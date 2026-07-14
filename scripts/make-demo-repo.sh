#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 1 ]]; then
  echo "usage: $0 <destination>" >&2
  exit 2
fi

DESTINATION="$1"
if [[ -e "$DESTINATION" ]]; then
  if [[ ! -d "$DESTINATION" || -n "$(find "$DESTINATION" -mindepth 1 -maxdepth 1 -print -quit)" ]]; then
    echo "refusing to overwrite a non-empty or non-directory destination" >&2
    exit 1
  fi
else
  mkdir -p "$DESTINATION"
fi

mkdir -p "$DESTINATION/premonition_demo"

cat >"$DESTINATION/README.md" <<'EOF'
# Premonition demo

Copy the traceback; watch the menu bar.

- `make break` runs the shallow deterministic failure.
- `make break-deep` runs the cross-file deterministic failure.
EOF

cat >"$DESTINATION/Makefile" <<'EOF'
.PHONY: break break-deep
break:
	python3 -m premonition_demo.shallow
break-deep:
	python3 -m premonition_demo.deep
EOF

cat >"$DESTINATION/premonition_demo/__init__.py" <<'EOF'
"""Deterministic Premonition demo failures."""
EOF

cat >"$DESTINATION/premonition_demo/shallow.py" <<'EOF'
CONFIG = {"greeting": "hello"}

def main() -> None:
    print(CONFIG["greting"])

if __name__ == "__main__":
    main()
EOF

cat >"$DESTINATION/premonition_demo/rules.py" <<'EOF'
PRIORITY = {"first": 0, "second": 1}

def priority(name: str) -> int:
    return PRIORITY[name]
EOF

cat >"$DESTINATION/premonition_demo/deep.py" <<'EOF'
from .rules import priority

def ordered_steps() -> list[str]:
    steps = ["second", "first"]
    return sorted(steps, key=priority, reverse=True)

def main() -> None:
    actual = ordered_steps()
    expected = ["first", "second"]
    if actual != expected:
        raise RuntimeError(f"unexpected step order: {actual!r}")

if __name__ == "__main__":
    main()
EOF

git -C "$DESTINATION" init -q
git -C "$DESTINATION" config user.name "Premonition Demo"
git -C "$DESTINATION" config user.email "demo@premonition.invalid"
git -C "$DESTINATION" add README.md Makefile premonition_demo
git -C "$DESTINATION" commit -q -m "test(demo): plant deterministic failures"
printf '%s\n' "$(cd "$DESTINATION" && pwd)"
