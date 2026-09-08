<#
.SYNOPSIS
    Verifica la presenza di aggiornamenti remoti per ASTRALIS Framework (v3.0.4).
.DESCRIPTION
    Interroga il repository GitHub remoto (https://github.com/Nemex81/astralis-framework)
    usando primariamente le GitHub Releases API e secondariamente git ls-remote.
    Implementa una cache locale temporanea (12 ore) in $env:TEMP per azzerare
    l'overhead di rete ed evitare interrogazioni ridondanti nella stessa sessione.
.PARAMETER ForceCheck
    Se specificato, forza l'interrogazione remota ignorando la cache temporanea.
.OUTPUTS
    JSON contenente:
    - UpdateAvailable: $true se presente una nuova versione
    - CurrentVersion: versione locale attiva
    - LatestVersion: versione remota piu recente trovata
    - ReleaseUrl: URL di rilascio GitHub
    - Status: messaggio descrittivo
#>
param(
    [switch]$ForceCheck
)

$ErrorActionPreference = "SilentlyContinue"

$repoOwner = "Nemex81"
$repoName = "astralis-framework"
$repoUrl = "https://github.com/$repoOwner/$repoName"
$apiUrl = "https://api.github.com/repos/$repoOwner/$repoName/releases/latest"
$cacheFile = Join-Path $env:TEMP "astralis_update_cache.json"
$cacheDurationHours = 12

# 1. Rilevamento deterministico della versione locale
$currentVersion = "3.0.0"
$scriptDir = $PSScriptRoot
$hubRoot = (Resolve-Path (Join-Path $scriptDir "..")).Path

# Cerca prima nel CHANGELOG.md locale
$changelogPath = Join-Path $hubRoot "CHANGELOG.md"
if (-not (Test-Path $changelogPath) -and $env:ASTRALIS_HUB) {
    $changelogPath = Join-Path $env:ASTRALIS_HUB "CHANGELOG.md"
}

if (Test-Path $changelogPath) {
    $content = [System.IO.File]::ReadAllText($changelogPath, [System.Text.Encoding]::UTF8)
    if ($content -match '## .*?\[v?([0-9\.]+)\]') {
        $currentVersion = $matches[1]
    }
}

# 2. Controllo Cache Temporanea
if (-not $ForceCheck -and (Test-Path $cacheFile)) {
    try {
        $cacheRaw = Get-Content $cacheFile -Raw
        $cacheObj = $cacheRaw | ConvertFrom-Json
        $cacheTime = [datetime]$cacheObj.Timestamp
        if ((Get-Date) - $cacheTime -lt (New-TimeSpan -Hours $cacheDurationHours)) {
            # Se la versione corrente salvata coincide, restituisci il risultato in cache
            if ($cacheObj.CurrentVersion -eq $currentVersion) {
                [PSCustomObject]@{
                    UpdateAvailable = $cacheObj.UpdateAvailable
                    CurrentVersion  = $cacheObj.CurrentVersion
                    LatestVersion   = $cacheObj.LatestVersion
                    ReleaseUrl      = $cacheObj.ReleaseUrl
                    Source          = "Cache"
                    Status          = "OK"
                } | ConvertTo-Json -Compress
                exit 0
            }
        }
    } catch {
        # Se la cache e corrotta, procedi con il controllo online
    }
}

# 3. Interrogazione Remota (Canale 1: GitHub API)
$latestVersion = $null
$releaseUrl = "$repoUrl/releases/latest"

try {
    $headers = @{
        "User-Agent" = "ASTRALIS-Update-Checker"
        "Accept"     = "application/vnd.github.v3+json"
    }
    $response = Invoke-RestMethod -Uri $apiUrl -Headers $headers -TimeoutSec 3 -ErrorAction Stop
    if ($response -and $response.tag_name) {
        $rawTag = $response.tag_name -replace '^v', ''
        $latestVersion = $rawTag.Trim()
        if ($response.html_url) {
            $releaseUrl = $response.html_url
        }
    }
} catch {
    # Fail-safe Canale 2: Fallback su git ls-remote se siamo in un repository git
    try {
        $gitTags = git ls-remote --tags --refs "https://github.com/$repoOwner/$repoName.git" 2>$null
        if ($gitTags) {
            $tags = $gitTags | ForEach-Object {
                if ($_ -match 'refs/tags/v?([0-9\.]+)$') {
                    $matches[1]
                }
            } | Where-Object { $_ -ne $null }
            
            if ($tags) {
                # Ordina i tag SemVer per trovare il piu recente
                $sortedTags = $tags | Sort-Object { [version]($_ -replace '-.*$', '') } -Descending
                $latestVersion = $sortedTags[0]
            }
        }
    } catch {
        # Offline o Git non disponibile
    }
}

# 4. Confronto SemVer Deterministico
$updateAvailable = $false

if ($latestVersion) {
    try {
        $curClean = $currentVersion -replace '-.*$', ''
        $latClean = $latestVersion -replace '-.*$', ''
        $vCur = [version]$curClean
        $vLat = [version]$latClean
        if ($vLat -gt $vCur) {
            $updateAvailable = $true
        }
    } catch {
        # Se il formato non e strettamente SemVer, confronto testuale difensivo
        if ($latestVersion -ne $currentVersion) {
            $updateAvailable = $true
        }
    }
} else {
    $latestVersion = $currentVersion
}

# 5. Salvataggio Cache
$result = [PSCustomObject]@{
    UpdateAvailable = $updateAvailable
    CurrentVersion  = $currentVersion
    LatestVersion   = $latestVersion
    ReleaseUrl      = $releaseUrl
    Timestamp       = (Get-Date).ToString("o")
}

try {
    $result | ConvertTo-Json | Out-File -FilePath $cacheFile -Encoding utf8
} catch {}

# 6. Emissione Risultato JSON
[PSCustomObject]@{
    UpdateAvailable = $updateAvailable
    CurrentVersion  = $currentVersion
    LatestVersion   = $latestVersion
    ReleaseUrl      = $releaseUrl
    Source          = "Network"
    Status          = "OK"
} | ConvertTo-Json -Compress
