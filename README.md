# UA-GodotTestBench

[![CI](https://github.com/stoplayingames/UA-GodotTestBench/actions/workflows/ci.yml/badge.svg)](https://github.com/stoplayingames/UA-GodotTestBench/actions/workflows/ci.yml)
[![Docs](https://img.shields.io/badge/docs-GitHub%20Pages-blue)](https://stoplayingames.github.io/UA-GodotTestBench/)

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

## Docs

Local preview:

```bash
pip install -r requirements-docs.txt
mkdocs serve
```

Or use convenience scripts:

- PowerShell: `.\scripts\docs_serve.ps1`
- bash: `./scripts/docs_serve.sh`

Published site URL:

- `https://stoplayingames.github.io/UA-GodotTestBench/`

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

## Work Sample Notes

This repository demonstrates:

- GDScript unit testing with GUT in a Godot 4 project.
- Cross-platform headless test scripting (`scripts/run_tests.ps1`, `scripts/run_tests.sh`).
- Reproducible CI execution in GitHub Actions using a pinned Godot release.
- A portfolio-ready structure with clear setup and contribution docs.

## How to Extend

- Add production modules under `src/` using small, testable functions/classes.
- Add corresponding tests under `tests/` (for example `tests/unit/`).
- Run `.\scripts\run_tests.ps1` on Windows or `./scripts/run_tests.sh` on macOS/Linux before opening a PR.

## Troubleshooting

- `Godot executable not found`:
  - Pass an explicit executable path (`-GodotExe` in PowerShell or first arg in bash), or set `GODOT_EXE`.
- `Permission denied` on `run_tests.sh`:
  - Run `chmod +x scripts/run_tests.sh` once on macOS/Linux.
- GUT script path errors:
  - Confirm this path exists: `addons/gut/gut_cmdln.gd`.
- No tests discovered:
  - Confirm tests are under `tests/` and use GUT naming (`test_*.gd` with `func test_*()` methods).
- Wrong working directory:
  - Run commands from repository root so `--path` resolves correctly.
