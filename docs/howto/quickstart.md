# Quickstart

1. Open this folder in Godot 4.
2. Enable the GUT plugin (once present in `addons/gut`).
3. Run tests from the GUT panel in the editor.
4. Run headless tests with a script for CI-parity:
   - PowerShell: `.\scripts\run_tests.ps1 -GodotExe "C:\Path\To\Godot_v4.x-stable_win64.exe"`
   - bash: `./scripts/run_tests.sh /path/to/Godot_v4.x-stable_linux.x86_64`
