param(
	[string]$GodotExe = ""
)

$ErrorActionPreference = "Stop"

if (-not $GodotExe) {
	$GodotExe = $env:GODOT_EXE
}

if (-not $GodotExe) {
	$discovered = Get-Command godot4, godot -ErrorAction SilentlyContinue | Select-Object -First 1
	if ($discovered) {
		$GodotExe = $discovered.Source
	}
}

if (-not $GodotExe) {
	Write-Error "Godot executable not found. Pass -GodotExe or set GODOT_EXE."
	exit 1
}

$projectRoot = (Resolve-Path (Join-Path $PSScriptRoot "..")).Path

# Import project assets/class_names before invoking GUT to avoid
# missing class_name errors in fresh environments (CI/new clones).
$importArgs = @(
	"--headless",
	"--path", $projectRoot,
	"--import"
)

& $GodotExe @importArgs
$importExitCode = if ($null -eq $LASTEXITCODE) { 1 } else { $LASTEXITCODE }
if ($importExitCode -ne 0) {
	Write-Warning "Godot import returned exit code $importExitCode. Continuing to test run."
}

$args = @(
	"--headless",
	"--path", $projectRoot,
	"-s", "addons/gut/gut_cmdln.gd",
	"-gdir=res://tests",
	"-ginclude_subdirs",
	"-gexit"
)

& $GodotExe @args
$exitCode = if ($null -eq $LASTEXITCODE) { 1 } else { $LASTEXITCODE }

if ($exitCode -ne 0) {
	Write-Error "GUT tests failed with exit code $exitCode."
	exit $exitCode
}

Write-Host "GUT tests passed."
