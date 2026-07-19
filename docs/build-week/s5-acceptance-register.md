# S5 Acceptance and Release Evidence Register

**Issue:** #17
**Branch:** `codex/issue-17-release-hardening`
**Evidence date:** 2026-07-18
**Status:** All non-credential work complete; owner signing/notarisation gate open

This register distinguishes deterministic proof, live Codex evidence,
installed-product owner observation and genuine credential-dependent blockers.
Mechanical applicability is never described as patch correctness.

## Evidence classes

- **Current automated:** run from the S5 stable working snapshot.
- **Current live:** a real ephemeral Codex invocation on the current CLI.
- **Recorded owner:** an installed-app result preserved in BUILDLOG.
- **Blocked:** requires an owner or machine prerequisite that is unavailable.

## A1–A14 result

| Scenario | S5 result | Evidence |
| --- | --- | --- |
| A1 — Money path | **Pass, with live variability recorded** | Current `PREMONITION_LIVE_CODEX=1 swift test --filter a1HeadlessRealSol` produced a validated, non-mutating fix in 17.907 s. A deliberate repeat produced no applicable patch in 24.871 s, so no determinism/correctness claim is made. BUILDLOG S3.2 separately records the installed clipboard → review → Apply → successful rerun → unstaged diff → restore path. |
| A2 — Zero-egress negatives | **Current automated pass** | Twenty negative shapes, oversize text and concealed/transient/auto-generated entries pass with zero executor starts and zero egress; protected pasteboard types are unread. A 96-item simulated workday spanning prose, URLs, JSON, code, commands, notes and zero-error logs also produces zero executor starts/egress. |
| A3 — Sol escalation | **Current automated pass** | The deterministic deep demo failure runs, the Low result fails parsing, exactly one Medium attempt returns a bounded applicable diff, the source remains unchanged and the Git tree remains clean. Both requests are pinned to Sol. |
| A4 — Escalation terminality | **Current automated pass** | Two invalid outputs produce exactly two calls and terminal discard. |
| A5 — Cap | **Current automated pass** | Cap date/count serialises, blocks the next same-day candidate with `capDrop`, produces no additional egress, survives reconstruction and resets at the next local day. |
| A6 — Single-flight | **Current automated pass** | A second executing/held candidate receives `singleflightDrop` before cap admission. |
| A7 — Timeout and cancellation | **Current automated pass** | Initial and escalated fixture timeouts discard after two calls; ProcessRunner timeout and task cancellation terminate the child and complete without a retained process. |
| A8 — Dirty tree | **Current automated plus recorded owner pass** | Post-presentation tracked and untracked dirt both make Apply throw `dirtyTree` and leave the target unchanged. BUILDLOG S3.2 records the installed safe refusal with Copy Patch retained. |
| A9 — Bounds | **Current automated pass** | Traversal, absolute escape, `.git`, binary and symlink-escape patches are rejected; one surrounding fence on a valid diff is accepted. |
| A10 — Ephemeral and persistence | **Current live and local-schema pass** | On Codex CLI 0.144.6, the bounded repeat call left the aggregate session-file count at 310 before/after. An earlier 309→310 observation is retained as inconclusive because this desktop task was active; no historic names or contents were inspected. Premonition storage contains only `config.json`, `state.json` and `verdicts.jsonl`, all mode `0600`; key-only inspection found configuration, cap/panel state and content-free verdict metadata, not captured text/prompt/diff/output fields. |
| A11 — Rationale independence | **Current automated pass** | Rationale failure leaves the validated fix intact; excessive/code-shaped prose is dropped. S5 now tracks the rationale task and cancels it on Pause, Dismiss, Copy Patch, Apply or expiry. |
| A12 — Offline replay | **Current automated plus recorded owner pass** | Replay crosses the real gate, resolver, admission, parser, bounds and `git apply --check` with zero model egress/mutation; the fixture is independently verified in the built app. BUILDLOG S4.3 records owner-approved networking-disabled installed replay. |
| A13 — Held-fix exclusion | **Current automated pass** | A fresh candidate while held is single-flight dropped; after release it is deduplicated until the controlled ten-minute expiry, then admits and consumes the second cap slot. |
| A14 — Fresh-machine onboarding | **Current isolated automated plus recorded owner pass** | A temporary Application Support path starts unconfigured, adds a root through the model’s Settings action, creates mode-`0600` config, restores the root, pinned model, cap and sound defaults without touching the owner configuration. BUILDLOG S3.2 records the installed first-run window, NSOpenPanel root addition, runtime status and subsequent A1. |

## Current verification

Stable working snapshot: `/tmp/Premonition-s5-work.ry9Ri4`

- `swift test` — 55 tests passed.
- `scripts/test.sh` — 55 Swift tests, deterministic shallow/deep demo,
  measurement normalisation and release-tool contracts passed.
- `scripts/build-app.sh release` — production app bundle built.
- `scripts/verify-release.sh --unsigned-local dist/Premonition.app` — bundle ID,
  v0.1.0, macOS 14 floor, `LSUIElement`, executable and packaged fixture passed.
- `script/build_and_run.sh --verify` — rebuilt and launched app remained running.
- README front-door audit — passed with no placeholders or missing local paths.
- `ruby -c packaging/homebrew/premonition.rb` — syntax valid.
- `brew style packaging/homebrew/premonition.rb` — one file, no offences.
- Release signing script with absent inputs — exited before creating its output.

## Distribution capability and gates

| Capability | Current state | Classification |
| --- | --- | --- |
| Xcode | Xcode 26.6, build 17F113 | Available |
| `notarytool` / `stapler` | 1.1.2 (41); commands available | Available |
| Homebrew | 6.0.11 with style/audit commands | Available |
| Code-signing identity | `security find-identity -p codesigning -v` reports zero valid identities | **Blocked pending owner-installed Developer ID Application identity** |
| Notary profile | No owner-confirmed Keychain profile name supplied or inferred | **Blocked pending owner confirmation** |
| Unsigned local bundle | Built and independently verified | Development evidence only |
| Signed judge artifact | Cannot be created without the two inputs above | **Blocked** |
| Homebrew URL/checksum and audit | Cask syntax/style pass; placeholders remain until the verified stapled archive exists | **Blocked by signed artifact; not published** |
| Final installed release review | Requires the signed/notarised/stapled candidate | **Blocked** |

## Publication boundary

No result here authorises a GitHub release, artifact upload, Homebrew tap
publication, repository-visibility change, Devpost submission, Sites deployment
or external promotion.
