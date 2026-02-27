# Project Layout

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

## Extension Pattern

- Add production modules under `src/` using small, testable functions/classes.
- Add corresponding tests under `tests/` (for example `tests/unit/`).
