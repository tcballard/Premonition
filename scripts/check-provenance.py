#!/usr/bin/env python3
from __future__ import annotations
import pathlib, re, subprocess

ROOT = pathlib.Path(__file__).resolve().parent.parent
SESSION = re.compile(r"^[0-9a-f]{8}-[0-9a-f-]{27}$")

ledger = (ROOT / "docs/build-week/sol-ledger.md").read_text()
build = (ROOT / "BUILDLOG.md").read_text()
dev = (ROOT / "DEVLOG.md").read_text()
rows = [line for line in ledger.splitlines() if line.startswith("| 20")]
if not rows:
    raise SystemExit("ledger has no material rows")
for row in rows:
    fields = [field.strip() for field in row.strip("|").split("|")]
    if len(fields) != 8 or any(not field for field in fields):
        raise SystemExit("ledger row is incomplete")
    if fields[1].startswith("S") and not SESSION.match(fields[4]):
        raise SystemExit("material S0-S6 ledger row lacks a stable session ID")

baseline = "2e83e846d9bbe8764dce82a2e0869ce5655ea24c"
commits = subprocess.run(
    ["git", "log", "--format=%H", f"{baseline}..HEAD"], cwd=ROOT,
    text=True, capture_output=True, check=True,
).stdout.splitlines()
for commit in commits:
    body = subprocess.run(
        ["git", "show", "-s", "--format=%B", commit], cwd=ROOT,
        text=True, capture_output=True, check=True,
    ).stdout
    required = {
        "Co-developed-with": "Codex (GPT-5.6 Sol)",
        "Sol-Session": None,
        "Sol-Phase": None,
        "Build-Log-Entry": None,
    }
    trailers = dict(re.findall(r"^([A-Za-z-]+): (.+)$", body, re.MULTILINE))
    for key, value in required.items():
        if key not in trailers or (value is not None and trailers[key] != value):
            raise SystemExit(f"{commit}: missing or invalid {key} trailer")
    if not SESSION.match(trailers["Sol-Session"]):
        raise SystemExit(f"{commit}: invalid stable session ID")
    if trailers["Sol-Session"] not in ledger or trailers["Sol-Phase"] not in ledger:
        raise SystemExit(f"{commit}: session or phase absent from ledger")
    entry = trailers["Build-Log-Entry"]
    if f"## Entry {entry} " not in build:
        raise SystemExit(f"{commit}: BUILDLOG entry missing")
    if f"## {entry} " not in dev or f"**Source:** `BUILDLOG.md`, Entry {entry}" not in dev:
        raise SystemExit(f"{commit}: paired DEVLOG entry missing")

print("provenance record complete")
