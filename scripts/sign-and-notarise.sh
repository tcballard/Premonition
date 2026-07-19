#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
OUTPUT_DIR="${1:-$ROOT_DIR/dist/release}"
IDENTITY="${PREMONITION_SIGNING_IDENTITY:-}"
NOTARY_PROFILE="${PREMONITION_NOTARY_PROFILE:-}"

if [[ $# -gt 1 ]]; then
  echo "usage: PREMONITION_SIGNING_IDENTITY=... PREMONITION_NOTARY_PROFILE=... $0 [output-directory]" >&2
  exit 2
fi

if [[ -z "$IDENTITY" ]]; then
  echo "PREMONITION_SIGNING_IDENTITY is required; no files were changed" >&2
  exit 2
fi

if [[ -z "$NOTARY_PROFILE" ]]; then
  echo "PREMONITION_NOTARY_PROFILE is required; no files were changed" >&2
  exit 2
fi

if ! /usr/bin/security find-identity -v -p codesigning | /usr/bin/grep -F -- "\"$IDENTITY\"" >/dev/null; then
  echo "the requested code-signing identity is not available; no files were changed" >&2
  exit 1
fi

if ! /usr/bin/xcrun notarytool history --keychain-profile "$NOTARY_PROFILE" >/dev/null 2>&1; then
  echo "the requested notary profile could not be verified; no files were changed" >&2
  exit 1
fi

if [[ -e "$OUTPUT_DIR" && ! -d "$OUTPUT_DIR" ]]; then
  echo "refusing to replace a non-directory output path: $OUTPUT_DIR" >&2
  exit 1
fi

if [[ -d "$OUTPUT_DIR" && -n "$(find "$OUTPUT_DIR" -mindepth 1 -maxdepth 1 -print -quit)" ]]; then
  echo "refusing to overwrite a non-empty output directory: $OUTPUT_DIR" >&2
  exit 1
fi

SOURCE_APP="$($ROOT_DIR/scripts/build-app.sh release)"
STAGING_DIR="$(mktemp -d "${TMPDIR:-/tmp}/Premonition-release.XXXXXX")"
trap 'rm -rf "$STAGING_DIR"' EXIT

SIGNED_APP="$STAGING_DIR/Premonition.app"
SUBMISSION_ZIP="$STAGING_DIR/Premonition-notary-submission.zip"
FINAL_ZIP="$STAGING_DIR/Premonition-0.1.0.zip"

/usr/bin/ditto "$SOURCE_APP" "$SIGNED_APP"
/usr/bin/codesign \
  --force \
  --sign "$IDENTITY" \
  --options runtime \
  --timestamp \
  --entitlements "$ROOT_DIR/packaging/entitlements.plist" \
  "$SIGNED_APP"

/usr/bin/codesign --verify --deep --strict --verbose=2 "$SIGNED_APP"
/usr/bin/ditto -c -k --sequesterRsrc --keepParent "$SIGNED_APP" "$SUBMISSION_ZIP"

/usr/bin/xcrun notarytool submit "$SUBMISSION_ZIP" \
  --keychain-profile "$NOTARY_PROFILE" \
  --wait
/usr/bin/xcrun stapler staple "$SIGNED_APP"
/usr/bin/xcrun stapler validate "$SIGNED_APP"
/usr/bin/codesign --verify --deep --strict --verbose=2 "$SIGNED_APP"
/usr/sbin/spctl --assess --type execute --verbose=4 "$SIGNED_APP"

/usr/bin/ditto -c -k --sequesterRsrc --keepParent "$SIGNED_APP" "$FINAL_ZIP"
/bin/mkdir -p "$OUTPUT_DIR"
/usr/bin/ditto "$SIGNED_APP" "$OUTPUT_DIR/Premonition.app"
/bin/cp "$FINAL_ZIP" "$OUTPUT_DIR/Premonition-0.1.0.zip"

printf '%s\n' "$OUTPUT_DIR/Premonition.app"
printf '%s\n' "$OUTPUT_DIR/Premonition-0.1.0.zip"
