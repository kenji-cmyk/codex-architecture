$ErrorActionPreference = "Stop"

$root = Resolve-Path (Join-Path $PSScriptRoot "..")
$backend = Join-Path $root "backend"

Write-Host "[backend] Starting backend validation"

if (-not (Test-Path $backend -PathType Container)) {
    Write-Host "[backend] Skipped: backend directory does not exist"
    exit 0
}

Push-Location $backend
try {
    if (Test-Path ".\mvnw.cmd") {
        Write-Host "[backend] Running Maven compile"
        & .\mvnw.cmd -DskipTests compile
        Write-Host "[backend] Running Maven tests"
        & .\mvnw.cmd test
    } elseif (Test-Path ".\pom.xml") {
        Write-Host "[backend] Running Maven compile"
        & mvn -DskipTests compile
        Write-Host "[backend] Running Maven tests"
        & mvn test
    } else {
        Write-Host "[backend] Skipped: no pom.xml or Maven wrapper found"
    }
} finally {
    Pop-Location
}
