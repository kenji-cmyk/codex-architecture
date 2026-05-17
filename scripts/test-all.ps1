$ErrorActionPreference = "Stop"

Write-Host "[all] Running workspace validation"
& (Join-Path $PSScriptRoot "test-backend.ps1")
& (Join-Path $PSScriptRoot "test-frontend.ps1")
Write-Host "[all] Validation complete"
