# UA-GodotTestBench

A portfolio-ready Godot 4 + GUT testing harness that demonstrates deterministic local and CI test execution for GDScript code. This repository is designed to be simple to clone, quick to understand, and easy to extend with additional game logic and automated tests.

## Prerequisites

- Godot Engine `4.x` (stable)
- Optional: `headless`/CLI usage for local automation and CI parity

## Quickstart

1. Open this folder in Godot 4.
2. Enable the GUT plugin (once present in `addons/gut`).
3. Run tests from the GUT panel in the editor.

## CLI Test Commands

PowerShell:

```powershell
$env:GODOT_EXE="C:\Path\To\Godot_v4.x-stable_win64.exe"
& $env:GODOT_EXE --headless --path . -s addons/gut/gut_cmdln.gd -gdir=res://tests -gexit
```

bash:

```bash
export GODOT_EXE="/path/to/Godot_v4.x-stable_linux.x86_64"
"$GODOT_EXE" --headless --path . -s addons/gut/gut_cmdln.gd -gdir=res://tests -gexit
```

## CI Overview

GitHub Actions runs the same test flow in headless mode on Windows and Ubuntu for every `push` and `pull_request`, so local and CI behavior stays aligned.

## Repo Layout

```text
.
├─ project.godot
├─ addons/
├─ tests/
├─ scripts/
├─ .github/workflows/
├─ docs/
├─ CONTRIBUTING.md
├─ LICENSE
├─ README.md
└─ .gitignore
```
