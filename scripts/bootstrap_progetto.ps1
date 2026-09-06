<#
.SYNOPSIS
    Script di Bootstrap Automatico per l'Ecosistema di Governance Universale.
.DESCRIPTION
    Inizializza la gerarchia docs/ e knowledge/ in un workspace target partendo dai template standard.
.PARAMETER TargetDir
    Percorso della cartella di progetto da inizializzare. Di default usa la cartella corrente.
#>
param(
    [string]$TargetDir = (Get-Location).Path
)

Write-Host "============================================================" -ForegroundColor Cyan
Write-Host " ASTRALIS BOOTSTRAP PROGETTO (Protocollo Onboarding v3.0.0)" -ForegroundColor Cyan
Write-Host " Autore: Luca (Senior Developer) & Antigravity" -ForegroundColor Yellow
Write-Host " Target: $TargetDir" -ForegroundColor Yellow
Write-Host "============================================================" -ForegroundColor Cyan

# 1. Creazione Cartelle docs/
$docsFolders = @(
    "docs\piani\attivi",
    "docs\piani\completati",
    "docs\strategie\attive",
    "docs\strategie\archiviate",
    "docs\report\archivio",
    "docs\idee",
    "docs\manuali"
)

foreach ($f in $docsFolders) {
    $fullPath = Join-Path $TargetDir $f
    if (-not (Test-Path $fullPath)) {
        New-Item -ItemType Directory -Path $fullPath -Force | Out-Null
        Write-Host "[+] Creata cartella: $f" -ForegroundColor Green
    }
}

# 2. Creazione Cartella knowledge/
$kPath = Join-Path $TargetDir "knowledge"
if (-not (Test-Path $kPath)) {
    New-Item -ItemType Directory -Path $kPath -Force | Out-Null
    Write-Host "[+] Creata cartella: knowledge\" -ForegroundColor Green
}

# 3. Copia Template Base in knowledge/ se non esistono
$templateBase = Join-Path $PSScriptRoot "..\templates\knowledge_schede_base"
$mapping = @{
    "00_consuetudini_operative_template.md" = "00_consuetudini_operative_e_sinergia_assistente.md"
    "01_accessibilita_vocale_template.md"   = "01_accessibilita_vocale_e_interazione_tastiera.md"
    "02_architettura_runtime_template.md"   = "02_architettura_stack_e_runtime.md"
    "03_standard_git_commit_template.md"    = "03_standard_git_branching_e_commit.md"
    "04_struttura_dati_template.md"         = "04_struttura_progetto_e_gestione_dati.md"
    "NN_registro_bug_soluzioni_template.md" = "09_registro_bug_e_soluzioni.md"
    "NN_living_documentation_template.md"   = "10_standard_piani_verifiche_e_living_documentation.md"
}

foreach ($t in $mapping.Keys) {
    $src = Join-Path $templateBase $t
    $dest = Join-Path $kPath $mapping[$t]
    if ((Test-Path $src) -and (-not (Test-Path $dest))) {
        Copy-Item -Path $src -Destination $dest
        Write-Host "[+] Inizializzata scheda: knowledge\$($mapping[$t])" -ForegroundColor Green
    }
}

# 4. Copia Template Registro Revisioni e Archivio in docs/report/ se non esistono
$rruSrc = Join-Path $PSScriptRoot "..\templates\REGISTRO_REVISIONI_TEMPLATE.md"
$rruDest = Join-Path $TargetDir "docs\report\REGISTRO_REVISIONI.md"
if ((Test-Path $rruSrc) -and (-not (Test-Path $rruDest))) {
    Copy-Item -Path $rruSrc -Destination $rruDest
    Write-Host "[+] Inizializzato: docs\report\REGISTRO_REVISIONI.md" -ForegroundColor Green
}

$archSrc = Join-Path $PSScriptRoot "..\templates\ARCHIVIO_REVISIONI_TEMPLATE.md"
$archDest = Join-Path $TargetDir "docs\report\ARCHIVIO_REVISIONI.md"
if ((Test-Path $archSrc) -and (-not (Test-Path $archDest))) {
    Copy-Item -Path $archSrc -Destination $archDest
    Write-Host "[+] Inizializzato: docs\report\ARCHIVIO_REVISIONI.md" -ForegroundColor Green
}

# 5. Copia Template GEMINI.md se non esiste
$geminiSrc = Join-Path $PSScriptRoot "..\templates\GEMINI_TEMPLATE.md"
$geminiDest = Join-Path $TargetDir "GEMINI.md"
if ((Test-Path $geminiSrc) -and (-not (Test-Path $geminiDest))) {
    Copy-Item -Path $geminiSrc -Destination $geminiDest
    Write-Host "[+] Generata bozza: GEMINI.md" -ForegroundColor Green
}

# 6. Copia Template README.md se non esiste
$readmeSrc = Join-Path $PSScriptRoot "..\templates\README_PROGETTO_TEMPLATE.md"
$readmeDest = Join-Path $TargetDir "README.md"
if ((Test-Path $readmeSrc) -and (-not (Test-Path $readmeDest))) {
    Copy-Item -Path $readmeSrc -Destination $readmeDest
    Write-Host "[+] Generata bozza: README.md" -ForegroundColor Green
}

# 7. Copia Template CHANGELOG.md se non esiste
$changelogSrc = Join-Path $PSScriptRoot "..\templates\CHANGELOG_PROGETTO_TEMPLATE.md"
$changelogDest = Join-Path $TargetDir "CHANGELOG.md"
if ((Test-Path $changelogSrc) -and (-not (Test-Path $changelogDest))) {
    Copy-Item -Path $changelogSrc -Destination $changelogDest
    Write-Host "[+] Generata bozza: CHANGELOG.md" -ForegroundColor Green
}

Write-Host "============================================================" -ForegroundColor Cyan
Write-Host " BOOTSTRAP COMPLETATO! Apri GEMINI.md per finalizzare la configurazione." -ForegroundColor Green
Write-Host "============================================================" -ForegroundColor Cyan