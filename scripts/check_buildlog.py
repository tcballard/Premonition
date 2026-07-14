#!/usr/bin/env python3
from __future__ import annotations

import argparse
import pathlib
import re
import sys


parser = argparse.ArgumentParser()
parser.add_argument("buildlog", type=pathlib.Path)
parser.add_argument("--devlog", type=pathlib.Path, required=True)
parser.add_argument("--previous", type=pathlib.Path)
parser.add_argument("--previous-devlog", type=pathlib.Path)
args = parser.parse_args()

build = args.buildlog.read_text()
dev = args.devlog.read_text()

if args.previous and not build.startswith(args.previous.read_text()):
    raise SystemExit("BUILDLOG is not append-only relative to previous copy")
if args.previous_devlog and not dev.startswith(args.previous_devlog.read_text()):
    raise SystemExit("DEVLOG is not append-only relative to previous copy")

build_ids = re.findall(r"^## Entry ([A-Z0-9.]+)\b", build, re.MULTILINE)
dev_ids = re.findall(r"^## ([A-Z0-9.]+)\b", dev, re.MULTILINE)
if len(build_ids) != len(set(build_ids)):
    raise SystemExit("duplicate BUILDLOG entry ID")
if len(dev_ids) != len(set(dev_ids)):
    raise SystemExit("duplicate DEVLOG entry ID")

for entry_id in build_ids:
    checkpoint = f"Entry {entry_id}" in build and "DEVLOG: no material narrative change" in build
    if entry_id not in dev_ids and not checkpoint:
        raise SystemExit(f"missing DEVLOG entry {entry_id}")
    if entry_id in dev_ids and f"**Source:** `BUILDLOG.md`, Entry {entry_id}" not in dev:
        raise SystemExit(f"missing DEVLOG source line for {entry_id}")

required = ("### Objective", "### Completed", "### Decisions and provenance", "### Artefacts", "### Verification", "### Deviations", "### Risks and missing evidence", "### Next entry state")
latest = build.rsplit("\n## Entry ", 1)[-1]
missing = [heading for heading in required if heading not in latest]
if missing:
    raise SystemExit("latest BUILDLOG entry missing: " + ", ".join(missing))

print(f"paired build logs valid: {len(build_ids)} BUILDLOG entries, {len(dev_ids)} DEVLOG entries")
