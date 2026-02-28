#!/usr/bin/env bash
set -euo pipefail

GODOT_EXE="${1:-${GODOT_EXE:-}}"

if [[ -z "$GODOT_EXE" ]]; then
  if command -v godot4 >/dev/null 2>&1; then
    GODOT_EXE="$(command -v godot4)"
  elif command -v godot >/dev/null 2>&1; then
    GODOT_EXE="$(command -v godot)"
  else
    echo "Godot executable not found. Pass path as first arg or set GODOT_EXE." >&2
    exit 1
  fi
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

import_status=0
"$GODOT_EXE" \
  --headless \
  --path "$PROJECT_ROOT" \
  --import || import_status=$?

if [[ "$import_status" -ne 0 ]]; then
  echo "Godot import failed with exit code $import_status." >&2
  exit "$import_status"
fi

test_status=0
"$GODOT_EXE" \
  --headless \
  --path "$PROJECT_ROOT" \
  -s addons/gut/gut_cmdln.gd \
  -gdir=res://tests \
  -ginclude_subdirs \
  -gexit || test_status=$?

if [[ "$test_status" -ne 0 ]]; then
  echo "GUT tests failed with exit code $test_status." >&2
  exit "$test_status"
fi

echo "GUT tests passed."
