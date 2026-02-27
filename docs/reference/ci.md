# CI

GitHub Actions runs the same test flow in headless mode on Windows and Ubuntu for every `push` and `pull_request`, so local and CI behavior stays aligned.

## Strategy

- CI runs tests headlessly on Windows and Ubuntu to prove cross-platform reliability.
- The workflow downloads a pinned Godot 4 headless binary, then invokes GUT command-line execution against `res://tests`.
- The job exits non-zero on failures so pull requests are blocked until tests pass.

## Workflow Split

- `.github/workflows/ci.yml` runs the automated test suite.
- `.github/workflows/docs_pages.yml` builds MkDocs and publishes the docs site to GitHub Pages.
