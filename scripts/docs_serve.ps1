$ErrorActionPreference = "Stop"

$projectRoot = (Resolve-Path (Join-Path $PSScriptRoot "..")).Path
Set-Location $projectRoot

$env:PYTHONUTF8 = "1"

pip install -r requirements-docs.txt
if ($LASTEXITCODE -ne 0) {
	exit $LASTEXITCODE
}

mkdocs serve -a 127.0.0.1:8010
exit $LASTEXITCODE
