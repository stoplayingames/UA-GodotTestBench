# Run Tests

Run from repository root.

## PowerShell

```powershell
.\scripts\run_tests.ps1 -GodotExe "C:\Path\To\Godot_v4.x-stable_win64.exe"

# or use env var
$env:GODOT_EXE="C:\Path\To\Godot_v4.x-stable_win64.exe"
.\scripts\run_tests.ps1
```

## bash

```bash
# one-time executable bit on macOS/Linux
chmod +x scripts/run_tests.sh

./scripts/run_tests.sh /path/to/Godot_v4.x-stable_linux.x86_64

# or use env var
export GODOT_EXE="/path/to/Godot_v4.x-stable_linux.x86_64"
./scripts/run_tests.sh
```
