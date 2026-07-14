#!/usr/bin/env python3
from __future__ import annotations

import pathlib
import subprocess
import tempfile


ROOT = pathlib.Path(__file__).resolve().parent.parent


def run(*args: str, cwd: pathlib.Path | None = None) -> subprocess.CompletedProcess[str]:
    return subprocess.run(args, cwd=cwd, text=True, capture_output=True, check=False)


with tempfile.TemporaryDirectory(prefix="premonition-demo-test-") as temp:
    demo = pathlib.Path(temp) / "demo"
    generated = run(str(ROOT / "scripts/make-demo-repo.sh"), str(demo))
    assert generated.returncode == 0, generated.stderr
    assert run("git", "status", "--porcelain", cwd=demo).stdout == ""

    shallow = run("make", "break", cwd=demo)
    assert shallow.returncode != 0
    assert "KeyError: 'greting'" in shallow.stderr

    deep = run("make", "break-deep", cwd=demo)
    assert deep.returncode != 0
    assert "RuntimeError: unexpected step order" in deep.stderr

    unsafe = run(str(ROOT / "scripts/make-demo-repo.sh"), str(demo))
    assert unsafe.returncode != 0
    assert "refusing to overwrite" in unsafe.stderr

print("demo repository: deterministic shallow/deep failures and overwrite refusal verified")
