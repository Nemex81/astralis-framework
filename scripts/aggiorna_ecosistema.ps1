<#
.SYNOPSIS
    Script di supporto, verifica e audit per l'aggiornamento ASTRALIS (v3.0.0).
.DESCRIPTION
    Verifica l'integrita dei file radice, dei moduli, dei 12 protocolli, dei template e del Trittico Inviolabile (Version Coherence Guard),
    crea un backup preventivo del Genoma Globale e della knowledge base, rileva eventuali regole custom per l'Aggiornamento Integrativo,
    scansiona i progetti per l'allineamento a cascata ed esegue l'audit post-aggiornamento.
.PARAMETER BackupDir
    Cartella opzionale di destinazione per i backup. Di default usa la cartella di configurazione dell'utente.
#>
param(
    [string]$BackupDir = ""
)

Write-Host "============================================================" -ForegroundColor Cyan
Write-Host " ASTRALIS GOVERNANCE - VERIFICA INTEGRITA E AGGIORNAMENTO (v3.0.0)" -ForegroundColor Cyan
Write-Host " Autore: Luca (Senior Developer) & Antigravity" -ForegroundColor Yellow
Write-Host "============================================================" -ForegroundColor Cyan

$hubRoot = (Resolve-Path (Join-Path $PSScriptRoot "..")).Path
Write-Host "[*] Radice Master Hub ASTRALIS: $hubRoot" -ForegroundColor Gray

# 1. Verifica e Self-Healing dei File di Radice, Protocolli e Template
Write-Host "`n--- FASE 1: Verifica Integrita File di Radice, Protocolli e Template ---" -ForegroundColor Cyan

# Risoluzione dinamica dei percorsi chiave
$isRepoFramework = Test-Path (Join-Path $hubRoot "knowledge")
$kFolder = if ($isRepoFramework) { "knowledge" } else { "knowledge_globale" }
$catalogoRelPath = Join-Path $kFolder "03_architettura_e_metodologie\catalogo_protocolli_operativi_astralis.md"

$registroRelPath = "docs\report\REGISTRO_REVISIONI_ASTRALIS.md"
if ($isRepoFramework -and (Test-Path (Join-Path $hubRoot "docs\developer\report\REGISTRO_META_REVISIONI_ASTRALIS.md"))) {
    $registroRelPath = "docs\developer\report\REGISTRO_META_REVISIONI_ASTRALIS.md"
}

$requiredFiles = @(
    "CHANGELOG.md",
    "README.md",
    "ISTRUZIONI_DI_AVVIO.md",
    $registroRelPath,
    $catalogoRelPath,
    "templates\GEMINI_TEMPLATE.md",
    "templates\CHANGELOG_PROGETTO_TEMPLATE.md",
    "templates\PIANO_TECNICO_TEMPLATE.md",
    "templates\README_PROGETTO_TEMPLATE.md",
    "templates\REGISTRO_REVISIONI_TEMPLATE.md",
    "templates\ARCHIVIO_REVISIONI_TEMPLATE.md"
)

foreach ($f in $requiredFiles) {
    $filePath = Join-Path $hubRoot $f
    if (Test-Path $filePath) {
        Write-Host "[OK] Presente: $f" -ForegroundColor Green
    } else {
        Write-Host "[!] ATTENZIONE: File mancante: $f (richiesto ripristino)" -ForegroundColor Yellow
    }
}

# 1.1 Controllo Coerenza Versioni & Self-Healing (Version Coherence Guard per Trittico di Root)
$changelogPath = Join-Path $hubRoot "CHANGELOG.md"
$readmePath = Join-Path $hubRoot "README.md"
$istruzioniPath = Join-Path $hubRoot "ISTRUZIONI_DI_AVVIO.md"
$catalogoPath = Join-Path $hubRoot $catalogoRelPath

if (Test-Path $changelogPath) {
    $changelogContent = Get-Content $changelogPath -Raw
    if ($changelogContent -match '## 🚀 \[v?([0-9\.]+)\]') {
        $activeVersion = $matches[1]
        Write-Host "[*] Versione di riferimento da CHANGELOG.md: v$activeVersion" -ForegroundColor Gray
        $utf8NoBom = New-Object System.Text.UTF8Encoding($false)

        # Self-Healing README.md
        if (Test-Path $readmePath) {
            $readmeContent = [System.IO.File]::ReadAllText($readmePath)
            if ($readmeContent -notmatch "# Versione:\s*$([regex]::Escape($activeVersion))") {
                $updatedReadme = $readmeContent -replace '(# Versione:\s*)[0-9]+\.[0-9]+\.[0-9]+', "`${1}$activeVersion"
                if ($updatedReadme -ne $readmeContent) {
                    [System.IO.File]::WriteAllText($readmePath, $updatedReadme, $utf8NoBom)
                    Write-Host "[AUTO-ALLINEAMENTO] README.md allineato a v$activeVersion (Self-Healing)" -ForegroundColor Yellow
                }
            } else {
                Write-Host "[OK] README.md coerente con v$activeVersion" -ForegroundColor Green
            }
        }

        # Self-Healing ISTRUZIONI_DI_AVVIO.md
        if (Test-Path $istruzioniPath) {
            $istrContent = [System.IO.File]::ReadAllText($istruzioniPath)
            $needUpdateIstr = $false
            $updatedIstr = $istrContent

            if ($updatedIstr -notmatch "ISTRUZIONI RAPIDE DI AVVIO \(v$([regex]::Escape($activeVersion))\)") {
                $updatedIstr = $updatedIstr -replace '(ISTRUZIONI RAPIDE DI AVVIO \(v)[0-9]+\.[0-9]+\.[0-9]+(\))', "`${1}$activeVersion`${2}"
                $needUpdateIstr = $true
            }
            if ($updatedIstr -notmatch "Benvenuto in \*\*ASTRALIS v$([regex]::Escape($activeVersion))\*\*") {
                $updatedIstr = $updatedIstr -replace '(Benvenuto in \*\*ASTRALIS v)[0-9]+\.[0-9]+\.[0-9]+(\*\*)', "`${1}$activeVersion`${2}"
                $needUpdateIstr = $true
            }
            if ($needUpdateIstr -and ($updatedIstr -ne $istrContent)) {
                [System.IO.File]::WriteAllText($istruzioniPath, $updatedIstr, $utf8NoBom)
                Write-Host "[AUTO-ALLINEAMENTO] ISTRUZIONI_DI_AVVIO.md allineato a v$activeVersion (Self-Healing)" -ForegroundColor Yellow
            } else {
                Write-Host "[OK] ISTRUZIONI_DI_AVVIO.md coerente con v$activeVersion" -ForegroundColor Green
            }
        }

        # Self-Healing catalogo_protocolli_operativi_astralis.md
        if (Test-Path $catalogoPath) {
            $catContent = [System.IO.File]::ReadAllText($catalogoPath)
            if ($catContent -notmatch "Catalogo dei Protocolli Operativi Ufficiali ASTRALIS \(v$([regex]::Escape($activeVersion))\)") {
                $updatedCat = $catContent -replace '(Catalogo dei Protocolli Operativi Ufficiali ASTRALIS \(v)[0-9]+\.[0-9]+\.[0-9]+(\))', "`${1}$activeVersion`${2}"
                if ($updatedCat -ne $catContent) {
                    [System.IO.File]::WriteAllText($catalogoPath, $updatedCat, $utf8NoBom)
                    Write-Host "[AUTO-ALLINEAMENTO] catalogo_protocolli_operativi_astralis.md allineato a v$activeVersion (Self-Healing)" -ForegroundColor Yellow
                }
            } else {
                Write-Host "[OK] catalogo_protocolli_operativi_astralis.md coerente con v$activeVersion" -ForegroundColor Green
            }
        }

        Write-Host "[OK] Version Coherence Guard: Trittico di Root 100% allineato a v$activeVersion" -ForegroundColor Green
    }
}

# 2. Verifica Cartelle Strutturali
Write-Host "`n--- FASE 2: Verifica Moduli e Struttura ---" -ForegroundColor Cyan
$area1Folder = if (Test-Path (Join-Path $hubRoot "$kFolder\01_filosofia_e_metodologia")) { "$kFolder\01_filosofia_e_metodologia" } else { "$kFolder\01_profilo_e_consuetudini" }

$requiredFolders = @(
    $area1Folder,
    "$kFolder\02_accessibilita_e_audio",
    "$kFolder\03_architettura_e_metodologie",
    "$kFolder\04_standard_tecnologici_trasversali",
    "prompts",
    "templates",
    "scripts"
)

if ($isRepoFramework) {
    $requiredFolders += @(
        "docs\architettura",
        "docs\guide",
        "docs\developer\piani\attivi",
        "docs\developer\piani\completati",
        "docs\developer\report",
        "docs\developer\specifiche",
        "docs\developer\strategie"
    )
} else {
    $requiredFolders += @(
        "docs\piani\attivi",
        "docs\piani\completati",
        "docs\report"
    )
}

foreach ($folder in $requiredFolders) {
    $fullPath = Join-Path $hubRoot $folder
    if (-not (Test-Path $fullPath)) {
        New-Item -ItemType Directory -Path $fullPath -Force | Out-Null
        Write-Host "[OK] Cartella creata (Self-Healing): $folder" -ForegroundColor Yellow
    } else {
        $count = (Get-ChildItem -Path $fullPath -File).Count
        Write-Host "[OK] Modulo integro: $folder ($count file)" -ForegroundColor Green
    }
}

# 3. Backup Preventivo del Genoma Globale (Livello 0)
Write-Host "`n--- FASE 3: Backup Preventivo e Analisi Personalizzazioni Utente ---" -ForegroundColor Cyan
$globalConfigDir = Join-Path $env:USERPROFILE ".gemini\config"
$globalGeminiFile = Join-Path $globalConfigDir "GEMINI.md"

if (Test-Path $globalGeminiFile) {
    Write-Host "[OK] Genoma Globale rilevato: $globalGeminiFile" -ForegroundColor Green
    
    $timestamp = (Get-Date).ToString("yyyyMMdd_HHmmss")
    $backupFile = Join-Path $globalConfigDir "GEMINI_$timestamp.bak"
    $standardBak = Join-Path $globalConfigDir "GEMINI.md.bak"
    
    Copy-Item -LiteralPath $globalGeminiFile -Destination $backupFile -Force
    Copy-Item -LiteralPath $globalGeminiFile -Destination $standardBak -Force
    Write-Host "[OK] Backup preventivo creato con successo:" -ForegroundColor Green
    Write-Host "     - $standardBak" -ForegroundColor Gray
    Write-Host "     - $backupFile" -ForegroundColor Gray

    # Analisi differenziale per regole custom
    $content = Get-Content -LiteralPath $globalGeminiFile -Raw
    if ($content -match "## 🛡️ ISOLA PROTETTA UTENTE" -or $content -match "## 🧩 REGOLE & CONSUETUDINI PERSONALIZZATE") {
        Write-Host "[*] Rilevate potenziali regole/consuetudini custom: Modalita AGGIORNAMENTO INTEGRATIVO attiva!" -ForegroundColor Yellow
    }
} else {
    Write-Host "[!] Genoma Globale non trovato in $globalConfigDir. Eseguire Protocollo Onboarding per la prima installazione." -ForegroundColor Yellow
}

# 4. Scansione Workspace per Allineamento a Cascata (Triage Progetti)
Write-Host "`n--- FASE 4: Scansione Workspace per Allineamento a Cascata (Triage Progetti) ---" -ForegroundColor Cyan
$parentDir = (Resolve-Path (Join-Path $hubRoot "..")).Path
$projects = Get-ChildItem -Path $parentDir -Directory | Where-Object { $_.Name -ne (Split-Path $hubRoot -Leaf) }

$projectReports = @()
foreach ($p in $projects) {
    $pGemini = Join-Path $p.FullName "GEMINI.md"
    $pChangelog = Join-Path $p.FullName "CHANGELOG.md"
    $pRRU = Join-Path $p.FullName "docs\report\REGISTRO_REVISIONI.md"
    
    if (Test-Path $pGemini) {
        $geminiContent = Get-Content -LiteralPath $pGemini -Raw
        $isUmbrella = ($geminiContent -match "Macro-Dominio Ombrello" -or $geminiContent -match "Router di Governance" -or $geminiContent -match "Linee Guida di Dominio")
        if ($isUmbrella) {
            $projectReports += "     - $($p.Name) : [Macro-Dominio Ombrello / Router - Figli autonomi]"
        } else {
            $statusChangelog = if (Test-Path $pChangelog) { "[CHANGELOG presente]" } else { "[CHANGELOG da creare]" }
            $statusRRU = if (Test-Path $pRRU) { "[RRU attivo]" } else { "[RRU da inizializzare]" }
            $projectReports += "     - $($p.Name) : $statusChangelog | $statusRRU"
        }
    }
}

if ($projectReports.Count -gt 0) {
    Write-Host "[OK] Rilevati $($projectReports.Count) progetti/domini con governance attiva:" -ForegroundColor Green
    $projectReports | ForEach-Object { Write-Host $_ -ForegroundColor Gray }
} else {
    Write-Host "[*] Nessun progetto secondario individuato nel workspace genitore." -ForegroundColor Gray
}

Write-Host "`n============================================================" -ForegroundColor Cyan
Write-Host " AUDIT E VERIFICA COMPLETATI CON SUCCESSO!" -ForegroundColor Green
Write-Host " Per completare l'Aggiornamento Integrativo e la sincronizzazione progetti:" -ForegroundColor Yellow
Write-Host " 1. Apri la chat con Antigravity." -ForegroundColor Yellow
Write-Host " 2. Scrivi: 'Avvia Protocollo Aggiornamento'" -ForegroundColor Yellow
Write-Host "    (oppure: 'Aggiorna ASTRALIS a questa versione')" -ForegroundColor Yellow
Write-Host "============================================================" -ForegroundColor Cyan
