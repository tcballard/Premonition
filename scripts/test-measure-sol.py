#!/usr/bin/env python3
from __future__ import annotations

import importlib.util
import pathlib


ROOT = pathlib.Path(__file__).resolve().parent.parent
SPEC = importlib.util.spec_from_file_location("measure_sol", ROOT / "scripts/measure-sol.py")
assert SPEC and SPEC.loader
MODULE = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(MODULE)

plain = "diff --git a/a.py b/a.py\n--- a/a.py\n+++ b/a.py"
normalised, stripped = MODULE.normalise_patch(plain)
assert normalised == plain + "\n"
assert stripped is False

fenced = "```diff\n" + plain + "\n```"
normalised, stripped = MODULE.normalise_patch(fenced)
assert normalised == plain + "\n"
assert stripped is True

prose = "Here is the patch:\n" + fenced
normalised, stripped = MODULE.normalise_patch(prose)
assert normalised == prose + "\n"
assert stripped is False

print("measurement normalisation: plain, single fence and prose boundaries verified")
