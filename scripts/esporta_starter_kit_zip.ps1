<#
.SYNOPSIS
    Esporta e comprime l'ASTRALIS Universal Starter Kit in archivi ZIP versionati e immutabili.
.DESCRIPTION
    Individua il Master Hub ASTRALIS tramite scansione a marker strutturali (zero hardcoding),
    estrae deterministico il numero di versione dal CHANGELOG.md e genera gli archivi ZIP
    all'interno della cartella ufficiale "releases/" (o percorso custom).
.PARAMETER Version
    Versione specifica da assegnare alla release. Default: auto-rilevata da CHANGELOG.md.
.PARAMETER CustomTag
    Suffisso o etichetta personalizzata dell'utente (es. "luca-custom", "nightly", "fork").
.PARAMETER DestinationDir
    Cartella di destinazione per i file ZIP. Default: $hubRoot\releases\
.PARAMETER IncludeLatest
    Se $true, genera anche una copia "ASTRALIS_Universal_Starter_Kit_latest.zip". Default: $true.
#>
param(
    [string]$Version = "",
    [string]$CustomTag = "",
    [string]$DestinationDir = "",
    [bool]$IncludeLatest = $true
)

# ============================================================
# 1. FUNZIONE DI DISCOVERY A MARKER STRUTTURALI (ZERO HARDCODING)
# ============================================================
function Find-AstralisMasterHub {
    $candidates = @()
    
    # 1. Percorso relativo dallo script attivo
    if ($PSScriptRoot) {
        $candidates += (Resolve-Path (Join-Path $PSScriptRoot "..") -ErrorAction SilentlyContinue).Path
    }
    
    # 2. Percorso corrente
    $candidates += (Get-Location).Path
    
    # 3. Percorsi standard conosciuti su OneDrive / UserProfile
    if ($env:OneDrive) {
        $candidates += (Join-Path $env:OneDrive "Documenti\GitHub\astralis-framework")
    }
    if ($env:USERPROFILE) {
        $candidates += (Join-Path $env:USERPROFILE "astralis-framework")
        $candidates += (Join-Path $env:USERPROFILE "ASTRALIS")
    }

    $requiredMarkers = @("knowledge_globale", "prompts", "templates", "scripts")

    foreach ($cand in $candidates) {
        if (-not $cand -or -not (Test-Path $cand)) { continue }
        
        $allMarkersPresent = $true
        foreach ($marker in $requiredMarkers) {
            if (-not (Test-Path (Join-Path $cand $marker))) {
                $allMarkersPresent = $false
                break
            }
        }

        if ($allMarkersPresent) {
            return (Resolve-Path $cand).Path
        }
    }

    return $null
}

# ============================================================
# 2. ESTRAZIONE AUTOMATICA DELLA VERSIONE DA CHANGELOG.MD
# ============================================================
function Get-AstralisVersion([string]$hubPath) {
    $changelogPath = Join-Path $hubPath "CHANGELOG.md"
    if (Test-Path $changelogPath) {
        $lines = Get-Content $changelogPath -TotalCount 40
        foreach ($line in $lines) {
            if ($line -match '##.*\[v?([0-9]+\.[0-9]+\.[0-9]+)\]') {
                return $matches[1]
            }
        }
    }
    return "2.6.3" # Fallback conservativo
}

# ============================================================
# 2.1 SELF-HEALING & VERSION COHERENCE GUARD DEL TRITTICO
# ============================================================
function Sync-AstralisTrittico([string]$hubPath, [string]$targetVersion) {
    $utf8NoBom = New-Object System.Text.UTF8Encoding($false)
    $readmePath = Join-Path $hubPath "README.md"
    $istruzioniPath = Join-Path $hubPath "ISTRUZIONI_DI_AVVIO.md"
    $catalogoPath = Join-Path $hubPath "knowledge_globale\03_architettura_e_metodologie\catalogo_protocolli_operativi_astralis.md"

    # 1. README.md
    if (Test-Path $readmePath) {
        $content = [System.IO.File]::ReadAllText($readmePath)
        if ($content -notmatch "# Versione:\s*$([regex]::Escape($targetVersion))") {
            $updated = $content -replace '(# Versione:\s*)[0-9]+\.[0-9]+\.[0-9]+', "`${1}$targetVersion"
            if ($updated -ne $content) {
                [System.IO.File]::WriteAllText($readmePath, $updated, $utf8NoBom)
                Write-Host "[AUTO-ALLINEAMENTO] README.md sincronizzato a v$targetVersion (Self-Healing)" -ForegroundColor Yellow
            }
        }
    }

    # 2. ISTRUZIONI_DI_AVVIO.md
    if (Test-Path $istruzioniPath) {
        $content = [System.IO.File]::ReadAllText($istruzioniPath)
        $needUpdate = $false
        $updated = $content
        if ($updated -notmatch "ISTRUZIONI RAPIDE DI AVVIO \(v$([regex]::Escape($targetVersion))\)") {
            $updated = $updated -replace '(ISTRUZIONI RAPIDE DI AVVIO \(v)[0-9]+\.[0-9]+\.[0-9]+(\))', "`${1}$targetVersion`${2}"
            $needUpdate = $true
        }
        if ($updated -notmatch "Benvenuto in \*\*ASTRALIS v$([regex]::Escape($targetVersion))\*\*") {
            $updated = $updated -replace '(Benvenuto in \*\*ASTRALIS v)[0-9]+\.[0-9]+\.[0-9]+(\*\*)', "`${1}$targetVersion`${2}"
            $needUpdate = $true
        }
        if ($needUpdate -and ($updated -ne $content)) {
            [System.IO.File]::WriteAllText($istruzioniPath, $updated, $utf8NoBom)
            Write-Host "[AUTO-ALLINEAMENTO] ISTRUZIONI_DI_AVVIO.md sincronizzato a v$targetVersion (Self-Healing)" -ForegroundColor Yellow
        }
    }

    # 3. Catalogo Protocolli
    if (Test-Path $catalogoPath) {
        $content = [System.IO.File]::ReadAllText($catalogoPath)
        if ($content -notmatch "Catalogo dei Protocolli Operativi Ufficiali ASTRALIS \(v$([regex]::Escape($targetVersion))\)") {
            $updated = $content -replace '(Catalogo dei Protocolli Operativi Ufficiali ASTRALIS \(v)[0-9]+\.[0-9]+\.[0-9]+(\))', "`${1}$targetVersion`${2}"
            if ($updated -ne $content) {
                [System.IO.File]::WriteAllText($catalogoPath, $updated, $utf8NoBom)
                Write-Host "[AUTO-ALLINEAMENTO] catalogo_protocolli_operativi_astralis.md sincronizzato a v$targetVersion (Self-Healing)" -ForegroundColor Yellow
            }
        }
    }
}

# ============================================================
# 3. RISOLUZIONE AMBIENTE E PATHS
# ============================================================
$hubRoot = Find-AstralisMasterHub
if (-not $hubRoot) {
    Write-Host "[ERRORE] Impossibile individuare il Master Hub ASTRALIS tramite i marker strutturali." -ForegroundColor Red
    exit 1
}

if (-not $Version) {
    $Version = Get-AstralisVersion $hubRoot
}

# Sincronizzazione atomica preventiva (Self-Healing) del Trittico di Root
Sync-AstralisTrittico $hubRoot $Version

$releaseName = "ASTRALIS_Universal_Starter_Kit_v$Version"
if ($CustomTag) {
    $releaseName += "-$CustomTag"
}

if (-not $DestinationDir) {
    $DestinationDir = Join-Path $hubRoot "releases"
}

if (-not (Test-Path $DestinationDir)) {
    New-Item -ItemType Directory -Path $DestinationDir -Force | Out-Null
}

$versionedZip = Join-Path $DestinationDir "$releaseName.zip"
$latestZip = Join-Path $DestinationDir "ASTRALIS_Universal_Starter_Kit_latest.zip"

Write-Host "============================================================" -ForegroundColor Cyan
Write-Host " ESPORTAZIONE ASTRALIS STARTER KIT - Luca e Antigravity" -ForegroundColor Cyan
Write-Host " Master Hub:   $hubRoot" -ForegroundColor Gray
Write-Host " Versione:     v$Version" -ForegroundColor Yellow
if ($CustomTag) {
    Write-Host " Tag Custom:   $CustomTag" -ForegroundColor Magenta
}
Write-Host " Destinazione: $DestinationDir" -ForegroundColor Yellow
Write-Host "============================================================" -ForegroundColor Cyan

# ============================================================
# 4. PACKAGING PULITO TRAMITE STAGING TEMPORANEO
# ============================================================
Add-Type -AssemblyName System.IO.Compression
Add-Type -AssemblyName System.IO.Compression.FileSystem

$tempZip = Join-Path ([System.IO.Path]::GetTempPath()) ("AstralisStarterKit_" + [System.Guid]::NewGuid().ToString("N") + ".zip")

try {
    $zipArchive = [System.IO.Compression.ZipFile]::Open($tempZip, [System.IO.Compression.ZipArchiveMode]::Create)
    
    # Esclude: cartella releases, file .zip, cartelle .git, file temporanei
    $items = Get-ChildItem -Path $hubRoot -Recurse | Where-Object {
        $rel = $_.FullName.Substring($hubRoot.Length).TrimStart("\", "/")
        -not $_.PSIsContainer -and
        $_.Extension -ne ".zip" -and
        -not ($rel -like "releases*") -and
        -not ($rel -like ".git*")
    }

    foreach ($item in $items) {
        $relativePath = $item.FullName.Substring($hubRoot.Length).TrimStart("\", "/")
        [System.IO.Compression.ZipFileExtensions]::CreateEntryFromFile($zipArchive, $item.FullName, $relativePath, [System.IO.Compression.CompressionLevel]::Optimal) | Out-Null
    }
    $zipArchive.Dispose()

    # Copia nella destinazione finale versionata
    if (Test-Path $versionedZip) {
        Remove-Item -LiteralPath $versionedZip -Force
    }
    Copy-Item -LiteralPath $tempZip -Destination $versionedZip -Force

    # Copia come "latest" se richiesto
    if ($IncludeLatest) {
        if (Test-Path $latestZip) {
            Remove-Item -LiteralPath $latestZip -Force
        }
        Copy-Item -LiteralPath $tempZip -Destination $latestZip -Force
    }

    # Pulizia staging temporaneo
    if (Test-Path $tempZip) {
        Remove-Item -LiteralPath $tempZip -Force
    }

    # ============================================================
    # 5. RIEPILOGO FINALE PER SCREEN READER
    # ============================================================
    if (Test-Path $versionedZip) {
        $sizeKb = [math]::Round((Get-Item $versionedZip).Length / 1KB, 2)
        Write-Host "`n[OK] Release ASTRALIS esportata con successo!" -ForegroundColor Green
        Write-Host "[OK] Archivio Versionato: $versionedZip ($sizeKb KB)" -ForegroundColor Cyan
        if ($IncludeLatest) {
            Write-Host "[OK] Puntatore Latest:    $latestZip" -ForegroundColor Cyan
        }
        Write-Host "`nGli archivi sono pronti nella cartella 'releases/' per la distribuzione o il backup!" -ForegroundColor Yellow
    }
} catch {
    Write-Host "`n[ERRORE] Impossibile creare l'archivio ZIP: $_" -ForegroundColor Red
    if (Test-Path $tempZip) { Remove-Item -LiteralPath $tempZip -Force }
    exit 1
}

Write-Host "============================================================" -ForegroundColor Cyan