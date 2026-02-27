# Contributing

## Local Test Commands

Run tests in the Godot editor through the GUT panel, or use CLI:

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

## Style Notes

- Use GDScript with clear, testable functions and small modules.
- Keep tests deterministic and independent.
- Prefer explicit naming for test files and test cases.

## Pull Request Guidance

- Keep PRs focused on one concern.
- Include/adjust tests for behavior changes.
- Ensure local headless tests pass before opening a PR.
- Describe what changed, why, and how it was validated.
