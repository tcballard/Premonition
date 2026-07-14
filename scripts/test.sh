#!/usr/bin/env bash
set -euo pipefail
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
swift test --package-path "$ROOT_DIR"
python3 "$ROOT_DIR/scripts/test-demo-repo.py"
python3 "$ROOT_DIR/scripts/test-measure-sol.py"
