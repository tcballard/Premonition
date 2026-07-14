#!/usr/bin/env bash
set -euo pipefail
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
swift package --package-path "$ROOT_DIR" resolve
"$ROOT_DIR/scripts/test.sh"
