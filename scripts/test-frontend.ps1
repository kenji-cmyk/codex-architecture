$ErrorActionPreference = "Stop"

$root = Resolve-Path (Join-Path $PSScriptRoot "..")
$frontend = Join-Path $root "frontend"

Write-Host "[frontend] Starting frontend validation"

if (-not (Test-Path $frontend -PathType Container)) {
    Write-Host "[frontend] Skipped: frontend directory does not exist"
    exit 0
}

Push-Location $frontend
try {
    if (-not (Test-Path ".\package.json")) {
        Write-Host "[frontend] Skipped: no package.json found"
        return
    }

    if (Test-Path ".\package-lock.json") {
        Write-Host "[frontend] Installing npm dependencies with npm ci"
        & npm ci
    }

    Write-Host "[frontend] Running lint"
    & npm run lint

    Write-Host "[frontend] Running build"
    & npm run build
} finally {
    Pop-Location
}
