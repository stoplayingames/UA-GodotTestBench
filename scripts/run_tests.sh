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

if ! "$GODOT_EXE" \
  --headless \
  --path "$PROJECT_ROOT" \
  -s addons/gut/gut_cmdln.gd \
  -gdir=res://tests \
  -ginclude_subdirs \
  -gexit; then
  status=$?
  echo "GUT tests failed with exit code $status." >&2
  exit "$status"
fi

echo "GUT tests passed."
