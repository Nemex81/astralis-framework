<#
.SYNOPSIS
    Script di Pre-Flight Environment Check Universale.
.DESCRIPTION
    Verifica l'identita macchina, le variabili d'ambiente essenziali e i runtime disponibili.
#>

Write-Host "============================================================" -ForegroundColor Cyan
Write-Host " ASTRALIS PRE-FLIGHT ENVIRONMENT CHECK (v3.0.0)" -ForegroundColor Cyan
Write-Host " Autore: Luca (Senior Developer) & Antigravity" -ForegroundColor Yellow
Write-Host "============================================================" -ForegroundColor Cyan

# 1. Identita Macchina
$hostName = $env:COMPUTERNAME
Write-Host "[INFO] Hostname Attivo: $hostName" -ForegroundColor Yellow

# 2. Controllo Percorsi Principali
$userProfile = $env:USERPROFILE
$oneDrive = $env:OneDrive
Write-Host "[INFO] UserProfile: $userProfile"
Write-Host "[INFO] OneDrive:    $oneDrive"

# 3. Controllo Toolchain Comuni
Write-Host "`n--- VERIFICA TOOLCHAIN E RUNTIME ---" -ForegroundColor Cyan

# Git
try {
    $gitVer = git --version 2>$null
    if ($gitVer) {
        Write-Host "[OK] Git: $gitVer" -ForegroundColor Green
    } else {
        Write-Host "[WARN] Git non trovato nel PATH" -ForegroundColor Yellow
    }
} catch {
    Write-Host "[WARN] Git non trovato nel PATH" -ForegroundColor Yellow
}

# Java
try {
    $javaVer = java -version 2>&1 | Select-Object -First 1
    if ($javaVer) {
        Write-Host "[OK] Java: $javaVer" -ForegroundColor Green
    } else {
        Write-Host "[INFO] Java non presente nel PATH standard" -ForegroundColor Gray
    }
} catch {
    Write-Host "[INFO] Java non presente nel PATH standard" -ForegroundColor Gray
}

# Python
try {
    $pyVer = python --version 2>$null
    if ($pyVer) {
        Write-Host "[OK] Python: $pyVer" -ForegroundColor Green
    } else {
        Write-Host "[INFO] Python non presente nel PATH standard" -ForegroundColor Gray
    }
} catch {
    Write-Host "[INFO] Python non presente nel PATH standard" -ForegroundColor Gray
}

# Rust / Cargo
try {
    $cargoVer = cargo --version 2>$null
    if ($cargoVer) {
        Write-Host "[OK] Rust/Cargo: $cargoVer" -ForegroundColor Green
    } else {
        Write-Host "[INFO] Rust/Cargo non presente nel PATH standard" -ForegroundColor Gray
    }
} catch {
    Write-Host "[INFO] Rust/Cargo non presente nel PATH standard" -ForegroundColor Gray
}

Write-Host "============================================================" -ForegroundColor Cyan
Write-Host " PRE-FLIGHT CHECK CONCLUSO!" -ForegroundColor Green
Write-Host "============================================================" -ForegroundColor Cyan