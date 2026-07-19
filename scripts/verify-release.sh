#!/usr/bin/env bash
set -euo pipefail

MODE="signed"
if [[ "${1:-}" == "--unsigned-local" ]]; then
  MODE="unsigned-local"
  shift
fi

if [[ $# -ne 1 ]]; then
  echo "usage: $0 [--unsigned-local] <Premonition.app>" >&2
  exit 2
fi

APP="$1"
INFO="$APP/Contents/Info.plist"
EXECUTABLE="$APP/Contents/MacOS/Premonition"
FIXTURE_ROOT="$APP/Contents/Resources/Fixtures/shallow"

[[ -d "$APP" ]] || { echo "missing app bundle: $APP" >&2; exit 1; }
[[ -f "$INFO" ]] || { echo "missing Info.plist" >&2; exit 1; }
[[ -x "$EXECUTABLE" ]] || { echo "missing executable" >&2; exit 1; }

/usr/bin/plutil -lint "$INFO" >/dev/null
[[ "$(/usr/libexec/PlistBuddy -c 'Print :CFBundleIdentifier' "$INFO")" == "co.armytage.Premonition" ]] || {
  echo "unexpected bundle identifier" >&2; exit 1;
}
[[ "$(/usr/libexec/PlistBuddy -c 'Print :CFBundleShortVersionString' "$INFO")" == "0.1.0" ]] || {
  echo "unexpected release version" >&2; exit 1;
}
[[ "$(/usr/libexec/PlistBuddy -c 'Print :LSMinimumSystemVersion' "$INFO")" == "14.0" ]] || {
  echo "unexpected deployment floor" >&2; exit 1;
}
[[ "$(/usr/libexec/PlistBuddy -c 'Print :LSUIElement' "$INFO")" == "true" ]] || {
  echo "Premonition must remain an LSUIElement app" >&2; exit 1;
}

for fixture in error.txt events.jsonl final.diff fixture.json; do
  [[ -s "$FIXTURE_ROOT/$fixture" ]] || { echo "missing packaged fixture: $fixture" >&2; exit 1; }
done

if [[ "$MODE" == "signed" ]]; then
  /usr/bin/codesign --verify --deep --strict --verbose=2 "$APP"
  SIGNING_SUMMARY="$(/usr/bin/codesign -dv --verbose=4 "$APP" 2>&1)"
  /usr/bin/grep -F "Authority=Developer ID Application:" <<<"$SIGNING_SUMMARY" >/dev/null || {
    echo "bundle is not signed with Developer ID Application" >&2; exit 1;
  }
  /usr/sbin/spctl --assess --type execute --verbose=4 "$APP"
  /usr/bin/xcrun stapler validate "$APP"
fi

printf 'verified %s Premonition 0.1.0 bundle: %s\n' "$MODE" "$APP"
