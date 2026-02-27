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
$args = @(
	"--headless",
	"--path", $projectRoot,
	"-s", "addons/gut/gut_cmdln.gd",
	"-gdir=res://tests",
	"-ginclude_subdirs",
	"-gexit"
)

& $GodotExe @args
$exitCode = $LASTEXITCODE

if ($exitCode -ne 0) {
	Write-Error "GUT tests failed with exit code $exitCode."
	exit $exitCode
}

Write-Host "GUT tests passed."
