#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TEMP_DIR="$(mktemp -d "${TMPDIR:-/tmp}/Premonition-release-tools.XXXXXX")"
trap 'rm -rf "$TEMP_DIR"' EXIT

/bin/bash -n "$ROOT_DIR/scripts/sign-and-notarise.sh"
/bin/bash -n "$ROOT_DIR/scripts/verify-release.sh"
/usr/bin/ruby -c "$ROOT_DIR/packaging/homebrew/premonition.rb" >/dev/null

if PREMONITION_SIGNING_IDENTITY= PREMONITION_NOTARY_PROFILE= \
    "$ROOT_DIR/scripts/sign-and-notarise.sh" "$TEMP_DIR/output" >/dev/null 2>&1; then
  echo "signing script must reject missing credentials" >&2
  exit 1
fi

if [[ -e "$TEMP_DIR/output" ]]; then
  echo "credential failure mutated the requested output" >&2
  exit 1
fi

if /usr/bin/grep -E 'PREMONITION_RELEASE_(URL|SHA256)' \
    "$ROOT_DIR/packaging/homebrew/premonition.rb" >/dev/null; then
  echo "release cask still contains metadata placeholders" >&2
  exit 1
fi

/usr/bin/grep -E 'sha256 "[0-9a-f]{64}"' \
  "$ROOT_DIR/packaging/homebrew/premonition.rb" >/dev/null
/usr/bin/grep -F \
  'url "https://github.com/tcballard/Premonition/releases/download/v#{version}/Premonition-#{version}.zip"' \
  "$ROOT_DIR/packaging/homebrew/premonition.rb" >/dev/null

echo "release tooling contracts passed"
