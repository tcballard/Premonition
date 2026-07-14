# Premonition repository guidance

`PREMONITION_SPEC.md` is product authority. Before editing, read the current
`BUILDLOG.md` entry, the active S0–S6 session in §11 and settled decisions in
§13. `DEVLOG.md` is human context only.

## Invariants

- Execute only the earliest incomplete phase; do not add later-phase behaviour.
- Preserve C1–C5 and §13. No model call precedes gate, allowlist and cap admission.
- Never persist clipboard text, prompts, diffs, model output or stderr in normal operation.
- Pin `gpt-5.6-sol`; speculation is ephemeral, read-only and no-approval.
- One candidate, one canonical diff parser and explicit clean-tree Apply via `git apply` only.
- Never auto-apply, stage, commit, run post-apply commands or add telemetry.
- Do not publish, release, submit, merge or enable auto-merge without explicit owner authority.

## Workflow

1. Inspect existing issues before creating one. An issue needs Objective, Scope and testable Acceptance criteria.
2. Work on `codex/issue-<number>-<slug>`, never directly on `main` or another protected branch.
3. Use a Conventional Commit subject suffixed with `[issue:#<number>]`.
4. Material Sol commits include `Co-developed-with`, `Sol-Session`, `Sol-Phase` and `Build-Log-Entry` trailers.
5. Open a draft PR with Summary; Included/Excluded Scope; decisions; relevant user contract; exact verification; covered behaviours; review path; and reviewer notes.
6. The owner reviews and merges.

## S0 commands

- `swift build`
- `swift test`
- `scripts/test.sh`
- `scripts/build-app.sh release`
- `script/build_and_run.sh --verify`
- `python3 scripts/check_buildlog.py BUILDLOG.md --devlog DEVLOG.md`
- `python3 scripts/check-provenance.py`

Use `script/build_and_run.sh` as the only developer launch entrypoint. It must
delegate deterministic bundle assembly to `scripts/build-app.sh`.
