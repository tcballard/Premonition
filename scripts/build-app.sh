#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CONFIGURATION="${1:-release}"
case "$CONFIGURATION" in
  debug|release) ;;
  *) echo "usage: $0 [debug|release]" >&2; exit 2 ;;
esac

swift build --package-path "$ROOT_DIR" -c "$CONFIGURATION" --product Premonition >&2
BIN_DIR="$(swift build --package-path "$ROOT_DIR" -c "$CONFIGURATION" --show-bin-path 2>/dev/null)"
APP_BUNDLE="$ROOT_DIR/dist/Premonition.app"
CONTENTS="$APP_BUNDLE/Contents"

rm -rf "$APP_BUNDLE"
mkdir -p "$CONTENTS/MacOS" "$CONTENTS/Resources"
cp "$BIN_DIR/Premonition" "$CONTENTS/MacOS/Premonition"
cp "$ROOT_DIR/packaging/Info.plist" "$CONTENTS/Info.plist"
chmod +x "$CONTENTS/MacOS/Premonition"
plutil -lint "$CONTENTS/Info.plist" >/dev/null
printf '%s\n' "$APP_BUNDLE"
