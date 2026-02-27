# Decisions

## Why Godot 4

- Godot 4 is a modern, open-source engine with strong 2D/3D workflows and first-class GDScript support.
- It is easy to run locally and in CI without paid tooling, which fits reproducible portfolio projects.

## Why GUT

- GUT is the established testing framework for GDScript unit and integration tests.
- It supports editor-based and command-line execution, allowing one test suite for local development and CI.

## Vendored GUT Version

- Vendored version: `v9.4.0`
- Source: `https://github.com/bitwes/Gut/releases/tag/v9.4.0`
- Installed from tagged archive: `https://github.com/bitwes/Gut/archive/refs/tags/v9.4.0.zip`
- GUT is vendored under `addons/gut` to keep CI and fresh clones reproducible without relying on the Asset Library or manual editor installs.

## CI Test Strategy

- CI runs tests headlessly on Windows and Ubuntu to prove cross-platform reliability.
- The workflow downloads a pinned Godot 4 headless binary, then invokes GUT command-line execution against `res://tests`.
- The job exits non-zero on failures so pull requests are blocked until tests pass.
