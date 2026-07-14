#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
MODE="${1:-run}"
pkill -x Premonition >/dev/null 2>&1 || true

case "$MODE" in
  run|--verify|verify|--logs|logs|--debug|debug) ;;
  *) echo "usage: $0 [run|--verify|--logs|--debug]" >&2; exit 2 ;;
esac

APP_BUNDLE="$("$ROOT_DIR/scripts/build-app.sh" debug)"
APP_BINARY="$APP_BUNDLE/Contents/MacOS/Premonition"

case "$MODE" in
  run)
    /usr/bin/open -n "$APP_BUNDLE"
    ;;
  --verify|verify)
    /usr/bin/open -n "$APP_BUNDLE"
    for _ in {1..20}; do
      pgrep -x Premonition >/dev/null && exit 0
      sleep 0.1
    done
    echo "Premonition did not remain running" >&2
    exit 1
    ;;
  --logs|logs)
    /usr/bin/open -n "$APP_BUNDLE"
    /usr/bin/log stream --info --style compact --predicate 'process == "Premonition"'
    ;;
  --debug|debug)
    lldb -- "$APP_BINARY"
    ;;
esac
