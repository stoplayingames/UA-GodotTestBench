# UA-GodotTestBench

A Godot 4 + GUT testing harness that demonstrates deterministic local and CI test execution for GDScript code. This repository is designed to be simple to clone, quick to understand, and easy to extend with additional game logic and automated tests.

## Prerequisites

- Godot Engine `4.x` (stable)
- Optional: `headless`/CLI usage for local automation and CI parity

## Quickstart

1. Open this folder in Godot 4.
2. Enable the GUT plugin (once present in `addons/gut`).
3. Run tests from the GUT panel in the editor.
4. Run headless tests with a script for CI-parity:
   - PowerShell: `.\scripts\run_tests.ps1 -GodotExe "C:\Path\To\Godot_v4.x-stable_win64.exe"`
   - bash: `./scripts/run_tests.sh /path/to/Godot_v4.x-stable_linux.x86_64`

## CLI Test Commands

PowerShell:

```powershell
.\scripts\run_tests.ps1 -GodotExe "C:\Path\To\Godot_v4.x-stable_win64.exe"

# or use env var
$env:GODOT_EXE="C:\Path\To\Godot_v4.x-stable_win64.exe"
.\scripts\run_tests.ps1
```

bash:

```bash
# one-time executable bit on macOS/Linux
chmod +x scripts/run_tests.sh

./scripts/run_tests.sh /path/to/Godot_v4.x-stable_linux.x86_64

# or use env var
export GODOT_EXE="/path/to/Godot_v4.x-stable_linux.x86_64"
./scripts/run_tests.sh
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
