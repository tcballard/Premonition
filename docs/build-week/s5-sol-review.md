# S5 Sol Security, Privacy and Accessibility Review

**Date:** 2026-07-18
**Phase:** S5
**Model/session:** GPT-5.6 Sol / `019f5f0f-a2dd-78e3-a5b3-413860708eab`
**Scope:** merged S4 runtime plus issue #17 hardening changes

## Result

No unresolved non-credential release blocker was found after remediation. The
runtime still obeys the earliest-phase boundary and C1–C5/§13 invariants. A
signed judge artifact remains blocked by the absent Developer ID identity and
owner-confirmed notary profile; this review does not waive that gate.

## Findings and resolutions

### F1 — Rationale task could outlive its candidate

**Severity:** High lifecycle/privacy defect — resolved.

The validated-fix rationale was created as an untracked task. Pause or a
terminal Dismiss, Copy Patch, Apply or expiry action could release the held
candidate without cancelling an in-flight Codex rationale, allowing background
egress after the user’s decision.

`PresentationModel` now owns `rationaleTask`, cancels any prior rationale before
starting it, clears it on completion and cancels it on Pause and every terminal
release. The existing ProcessRunner cancellation path terminates the Codex
child. The optional rationale remains post-validation and within the three-call
ceiling.

### F2 — Release-facing documents described obsolete phase boundaries

**Severity:** Medium misleading-copy and maintenance defect — resolved.

The architecture and threat model still described the live executor, UI and
Apply path as future work, while README, SECURITY and CHANGELOG were absent.
They now describe the actual S4/S5 product, reproduce the privacy constitution
verbatim, distinguish applicability from correctness, disclose verbatim egress
and no redaction, and state that signing/publication remain incomplete.

### F3 — Acceptance evidence over-relied on neighbouring or historical tests

**Severity:** Medium evidence defect — resolved for non-credential scenarios.

The suite now includes the full negative/workday zero-egress evidence, deep
fixture Low→Medium escalation, terminal A4 naming, cap/no-extra-egress, tracked
and untracked click-time dirt, controlled held-fix readmission and isolated
first-run configuration. Current live A1 and A10 were rerun. The A1 repeat
failure and the first inconclusive aggregate session-count change are retained
rather than hidden.

### F4 — Distribution commands and metadata did not exist

**Severity:** Medium release-integrity defect — resolved to the credential gate.

The signing/notarisation script requires explicit identity and profile inputs
before building or creating output, signs with hardened runtime, submits only
to Apple notarisation, staples and independently checks the result. The release
verifier distinguishes unsigned local evidence from Developer ID/Gatekeeper/
staple verification. The Homebrew cask is syntax/style-clean but retains
conspicuous URL/checksum placeholders and is not auditable or publishable until
the verified archive exists.

## Invariant review

- Pasteboard privacy marker types are checked before content reads.
- Gate, allowlist resolution, single-flight and cap all precede live egress.
- Every live request pins `gpt-5.6-sol`, uses read-only/no-approval/ephemeral/
  ignore-user-config flags and parses JSONL completion.
- Initial failure permits one escalation only; rationale occurs only after final
  validation and candidate release cancels it.
- One parser feeds bounds, rendering and Apply. Absolute, traversal, `.git`,
  binary and symlink escapes are rejected.
- `git apply --check` is non-mutating. Apply repeats clean-tree and validation
  checks and uses only `git apply`; there is no autonomous or post-apply action.
- Normal persistence is configuration, cap/panel state and content-free
  verdict metadata only, with mode `0600` on the observed files.
- Fixture replay replaces only the model hop and is visibly labelled.

## Accessibility and product-copy review

- Status-item state exposes an accessibility label/value and does not rely on
  the ready tint alone.
- Apply, Copy Patch, Dismiss and Settings have explicit accessible names.
- Return defaults to Apply only when safe; focus moves to Copy Patch when Apply
  is blocked; Escape closes the transient popover without dismissing the fix.
- Semantic diff lines announce added, removed, context or header meaning in
  addition to colour.
- Monitoring motion and the status pulse honour Reduce Motion.
- Apply failure posts an announcement and retains focus/review access.
- BUILDLOG S3.20 records the owner’s installed Dismiss, Copy Patch, keyboard,
  Escape and light/dark acceptance. S5 automation re-exercises the semantic,
  focus and Reduce Motion contracts; it does not manufacture a new VoiceOver
  or increased-contrast owner observation.
- README and SECURITY make no correctness, redaction, autonomous mutation,
  generic comprehension or zero-provider-retention claim.

## Residual risks and hard gates

- Sol is probabilistic. The current live run passed once and failed to produce
  an applicable patch on a deliberate repeat.
- The gate can admit false positives and miss unfamiliar traces.
- Admitted copied errors may contain secrets; no redaction exists.
- A same-user process can race local files despite click-time revalidation.
- Model stdout is held transiently in memory for a bounded call and is not
  persisted.
- No valid Developer ID identity or confirmed notary profile is available, so
  signed/notarised/stapled evidence, final Homebrew metadata/audit and owner
  release-candidate review remain blocked.
