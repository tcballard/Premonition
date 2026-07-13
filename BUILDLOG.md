# Premonition Build Log

This is the append-only project record for Premonition. It captures product refinement, Sol involvement, implementation work, verification and the exact entry state for the next durable session.

Do not rewrite previous entries to improve the story. Correct mistakes with a later dated entry. Never include clipboard content, runtime errors, prompts containing user or repository content, diffs, model output, credentials or secrets.

## Status

- **Current phase:** Planning and specification refinement complete; repository scaffolding not started
- **Implementation session:** Not started
- **Core `/feedback` Session ID:** Not yet captured
- **Canonical repository specification:** `PREMONITION_SPEC.md` once copied into the implementation repository
- **Current source artefact:** `Premonition-Implementation-Spec-v2.md`
- **Next session:** S0 — Establish and pin the world

---

## Entry P0 — Original standalone specification

**Date:** 2026-07-12

**Phase:** Pre-implementation product and requirements design

**Model/session evidence:** Not recorded in this build log

**Build Week classification:** Pre-existing planning; predates the 13 July Submission Period

### Completed

- Produced Premonition Implementation & Requirements Spec v1.1.
- Defined the ambient Codex interface, deterministic gate, allowlisted repository resolution, speculative patching, validation and human-controlled Apply path.
- Defined the privacy constitution, acceptance scenarios, UI register, demo repository and multi-session plan.
- Identified Peripheral as the proposed initial scaffold.

### Implementation state

- No Premonition application code was produced.
- No repository scaffold was created.
- No `/feedback` Session ID was captured.

---

## Entry P1 — Sol-led specification review and rewrite

**Date:** 2026-07-13

**Recorded at:** 2026-07-13T19:58:43+01:00

**Phase:** Specification refinement and implementation handoff design

**Model:** GPT-5.6 Sol, confirmed by the owner in the active session

**Session ID:** To be added if a stable ID for this planning session is captured

**Build Week classification:** Work performed during the Submission Period; planning/specification rather than application implementation

### Completed

- Reviewed v1.1 for implementation blockers, contradictions and unverifiable assumptions.
- Corrected the conflict between MIT licensing and the phrase “strictly non-commercial”.
- Removed the dependency on Peripheral and required an entirely in-repository scaffold.
- Rewrote the specification as `Premonition-Implementation-Spec-v2.md`.
- Selected SwiftPM plus native `.app` bundle scripts as the canonical build system.
- Added the repository-owned `ProcessRunner` contract for JSONL streaming, stdin, timeout and cancellation.
- Pinned GPT-5.6 Sol for initial speculation, escalation and rationale, differentiated by machine-verified reasoning effort.
- Added a Sol provenance ledger and Sol review gates across specification, architecture, implementation, interface design, tests, documentation and release preparation.
- Removed the direct API executor from v0.1 and retained it as roadmap-only.
- Corrected the cap acceptance scenario so a held candidate cannot mask `cap_drop` with `singleflight_drop`.
- Made fixture paths portable through a `{{REPO_ROOT}}` placeholder.
- Tightened persistence claims to what Premonition and the verified ephemeral Codex configuration can prove.
- Produced a fresh-session S0 handoff.
- Reviewed the Build macOS Apps plugin against the build plan.

### Settled plugin routing

- Use `swiftpm-macos` and `build-run-debug` during S0 and throughout development.
- Use `swiftui-patterns` for S3 view/state structure.
- Use `appkit-interop` for `NSStatusItem`, `NSPopover`, pasteboard handling and the non-activating `NSPanel`.
- Use `test-triage` when narrowing test failures.
- Use `signing-entitlements` and `packaging-notarization` during S5.
- Do not adopt Liquid Glass for a macOS 14+ target.
- Do not let generic `MenuBarExtra` guidance replace the specified AppKit status-item architecture.
- Treat local unified-log telemetry as optional debug instrumentation only; never add remote telemetry or content-bearing logs.

### Verification performed

- Checked official Build Week requirements for category, deadline, video, repository, README and `/feedback` Session ID expectations.
- Checked current official Codex documentation for the expected non-interactive, read-only, no-approval and ephemeral flags.
- Ran Markdown and whitespace consistency checks on the rewritten specification.
- Reviewed relevant Build macOS Apps skill instructions for SwiftPM, build/run, SwiftUI, AppKit interop, testing, signing, packaging and windows.

### Deviations from v1.1

- Peripheral removed entirely at owner request.
- All real v0.1 runtime model roles now use Sol rather than Luna/Terra fast tiers.
- Direct API fallback deferred to protect the Build Week path.
- The specification itself is recorded as the first Sol-produced project artefact.

### Current entry state

- The implementation repository does not yet exist in this workspace.
- `BUILDLOG.md` now exists as the planning seed and should be copied unchanged into the repository.
- Copy or rename the v2 specification to repository-root `PREMONITION_SPEC.md` without retaining a second authoritative copy.
- Create root `AGENTS.md` that points to the spec and build log without duplicating either.
- Start one durable GPT-5.6 Sol implementation thread.
- Run `/feedback` immediately and append the core Session ID here and to `docs/build-week/sol-ledger.md`.
- Execute S0 only.

---

## Entry P2 — Project skill and macOS workflow refinement

**Date:** 2026-07-13

**Phase:** Pre-implementation session orchestration

**Model:** GPT-5.6 Sol, confirmed by the owner in the active session

**Session ID:** Not yet captured

### Completed

- Designed the `build-premonition` project skill as the session operator for the repository specification.
- Kept the full specification out of the skill to prevent a second authoritative copy.
- Made the skill locate and read `PREMONITION_SPEC.md`, initialise missing evidence honestly, select the earliest eligible S0–S6 phase, protect C1–C5 and append the build log.
- Added phase-specific routing to the Build macOS Apps plugin.
- Updated the specification to require `script/build_and_run.sh` as the single developer launch path and `.codex/environments/environment.toml` as its Codex Run action.
- Kept `scripts/build-app.sh` as the lower-level bundle assembly primitive.

### Verification

- Skill structure validated with the skill validator.
- Specification and skill authority rules checked for duplication: the skill references the repository spec and does not bundle it.

### Next entry state

- Install/use `@build-premonition` in the fresh GPT-5.6 Sol implementation thread.
- Copy this log unchanged into the implementation repository.
- Canonicalise the specification as root `PREMONITION_SPEC.md`.
- Start S0 and capture `/feedback` before application implementation.

---

## Entry P3 — Dedicated build-log skill installed

**Date:** 2026-07-13

**Recorded at:** 2026-07-13T20:14:53+01:00

**Phase:** Pre-implementation session orchestration

**Status:** Complete

**Model:** GPT-5.6 Sol — owner-confirmed in visible project context

**Session ID:** Not captured

### Objective

Create a dedicated skill that keeps Premonition's build log append-only, evidence-backed, privacy-safe and sufficient for a fresh Sol session to resume exactly.

### Completed

- Created and installed `maintain-premonition-build-log` as a standalone project-workflow skill.
- Defined initialisation, append, checkpoint, correction and validation workflows.
- Added explicit evidence classes for observed, owner-confirmed, previously recorded and unverified claims.
- Added an entry template covering objective, provenance, artefacts, verification, deviations, risks and exact next state.
- Added a deterministic checker for latest-entry structure, duplicate IDs, append-only integrity, unresolved placeholders, raw diffs and common credential patterns.
- Appended the skill's own creation to this durable planning log.

### Decisions and provenance

- **Owner decision:** Create a dedicated build-log skill and record its authoring in the build log.
- **Sol implemented:** Skill workflow, entry schema, privacy constraints and deterministic checker.
- **Sol reviewed:** Alignment with `Premonition-Implementation-Spec-v2.md`, the existing `build-premonition` skill and the settled S0–S6 workflow.
- **Human-authored and Sol-reviewed:** None.

### Artefacts

- `maintain-premonition-build-log` — installed project-workflow skill.
- `references/entry-template.md` — canonical entry structure bundled with the skill.
- `scripts/check_buildlog.py` — structural and append-integrity checker bundled with the skill.
- `BUILDLOG.md` — durable planning record extended with Entry P3.

### Verification

- Skill validator — passed.
- Python bytecode compilation of the checker — passed.
- Synthetic conforming build-log entry — accepted by the checker.
- Synthetic no-append comparison — rejected by the checker as expected.
- Previous `BUILDLOG.md` SHA-256 copies — matched before appending Entry P3.
- Appended `BUILDLOG.md` checked against its previous copy — passed.

### Deviations

- None. The skill remains external project-workflow infrastructure and is not bundled with the Premonition application, so the v0.1 prohibition on a shipped skill/plugin remains intact.

### Risks and missing evidence

- The durable core-build `/feedback` Session ID is still not captured.
- The implementation repository and Sol ledger do not yet exist in this workspace.
- This planning session's Session ID was not available for recording.

### Next entry state

- In a fresh explicitly GPT-5.6 Sol-selected implementation thread, use `@build-premonition` with `@maintain-premonition-build-log`, establish the repository, canonicalise the specification as `PREMONITION_SPEC.md`, copy this log unchanged, capture `/feedback`, create the Sol ledger and execute S0 only.

---

## Entry P4 — Build evidence and the human story separated

**Date:** 2026-07-13

**Recorded at:** 2026-07-13T20:28:31+01:00

**Phase:** Pre-implementation session orchestration

**Status:** Complete

**Model:** GPT-5.6 Sol — owner-confirmed in visible project context

**Session ID:** Not captured

### Objective

Extend the Premonition logging workflow to maintain both an auditable build record and a readable builder diary, then clarify how Sol involvement should be evidenced across the ledger, commits and harness.

### Completed

- Updated `maintain-premonition-build-log` to maintain paired append-only `BUILDLOG.md` and `DEVLOG.md` entries with shared IDs.
- Added a dev-diary template and required factual grounding in the matching BUILDLOG entry.
- Added `merge-and-tell` Draft-mode routing for candid diary prose without introducing new facts.
- Extended the checker to validate cross-log IDs, source lines, privacy exclusions and independent append-only integrity.
- Created `DEVLOG.md` with traceable entries P0–P4.
- Reviewed the authoritative §4.6 Sol provenance contract: ledger rows and session evidence are primary; the existing `Co-developed-with: Codex (GPT-5.6 Sol)` commit trailer is supporting evidence.
- Evaluated `[CODEX]` commit subjects and a possible provenance harness check; no specification or harness change was made in this planning session.

### Decisions and provenance

- **Owner decision:** Maintain both the factual build log and the adjacent prose dev log.
- **Sol implemented:** Paired-log workflow, dev-log schema, cross-log validator and initial diary.
- **Sol reviewed:** Existing provenance requirements and the relative evidential value of ledger rows, session IDs, commit metadata and automated checks.
- **Human-authored and Sol-reviewed:** None.

### Artefacts

- `maintain-premonition-build-log` — updated paired-log skill.
- `references/devlog-template.md` — diary structure bundled with the skill.
- `scripts/check_buildlog.py` — paired-log validator bundled with the skill.
- `DEVLOG.md` — human-readable project diary derived from BUILDLOG entries.
- `BUILDLOG.md` — factual record extended with Entry P4.

### Verification

- Skill validator — passed.
- Paired checker against BUILDLOG P0–P3 and DEVLOG P0–P3 — passed.
- Previous BUILDLOG and DEVLOG SHA-256 copies — matched before appending P4.
- Paired P4 entries checked against both previous copies — passed.

### Deviations

- None. DEVLOG is narrative context rather than project authority, and the skill remains external workflow infrastructure.

### Risks and missing evidence

- The durable core-build `/feedback` Session ID is still not captured.
- The implementation repository and `docs/build-week/sol-ledger.md` do not yet exist in this workspace.
- A stronger set of machine-readable commit trailers and a provenance-completeness checker are recommendations, not yet owner-approved specification requirements.

### Next entry state

- Decide whether to make enhanced Git trailers and a non-claiming provenance-completeness check mandatory in S0; then begin the durable Sol implementation thread, capture `/feedback`, create the repository and ledger, and execute S0 only.

---

## Entry P5 — Provenance contract made repository-authoritative

**Date:** 2026-07-13

**Recorded at:** 2026-07-13T20:34:59+01:00

**Phase:** Pre-implementation specification and repository baseline

**Status:** Complete

**Model:** GPT-5.6 Sol — owner-confirmed in visible project context

**Session ID:** Not captured

### Objective

Make the paired-log and machine-checkable Sol provenance design binding in the authoritative specification, then establish the three project records in the owner's Premonition repository.

### Completed

- Amended the specification to version 2.1.
- Required paired BUILDLOG and DEVLOG entries for material sessions, with an explicit no-narrative checkpoint exception.
- Required conventional commit subjects plus structured `Co-developed-with`, `Sol-Session`, `Sol-Phase` and `Build-Log-Entry` trailers for material Sol commits.
- Prohibited `[CODEX]` subject prefixes as a provenance mechanism.
- Required `scripts/check-provenance.py` to validate ledger fields, session linkage, commit references, trailers and paired logs without claiming authorship.
- Added the provenance check to S0, the acceptance harness, S5 and the verification register.
- Clarified that external workflow skills are permitted but are not shipped product/runtime dependencies.
- Inspected `tcballard/Premonition`: the public `main` branch contained only the existing MIT `LICENSE` at the initial commit.
- Added `PREMONITION_SPEC.md`, `BUILDLOG.md` and `DEVLOG.md` to `main` while preserving the existing licence.

### Decisions and provenance

- **Owner decision:** Make enhanced trailers and the provenance-completeness check binding, then publish the three project records to `tcballard/Premonition`.
- **Sol implemented:** Specification v2.1 amendments, paired P5 logs and repository documentation baseline.
- **Sol reviewed:** Consistency between definition of done, repository structure, provenance ledger, acceptance harness, S0, S5, verification register and settled decisions.
- **Human-authored and Sol-reviewed:** None.

### Artefacts

- `PREMONITION_SPEC.md` — repository-authoritative specification v2.1.
- `BUILDLOG.md` — factual, append-only project handoff through P5.
- `DEVLOG.md` — paired human-readable diary through P5.
- Git commit `docs: establish Premonition project records` on `tcballard/Premonition` `main`; its SHA is intentionally obtained from Git history rather than embedded self-referentially in this entry.

### Verification

- Specification consistency and required-term checks — passed.
- Markdown fence-balance check — passed.
- Paired BUILDLOG/DEVLOG append and cross-reference checker — passed.
- Existing GitHub repository state inspected before mutation — one `LICENSE` file only.
- Resulting GitHub commit fetched after publication — all four expected files present and the three published documents matched the local canonical copies.

### Deviations

- The connected GitHub app created the commit directly because the local GitHub CLI was unavailable. The resulting repository state and commit metadata were verified through GitHub after publication.

### Risks and missing evidence

- This planning session has no captured stable Session ID, so the baseline commit omits `Sol-Session` rather than inventing one, as permitted for pre-repository planning.
- The durable S0 core-build Session ID and `docs/build-week/sol-ledger.md` still do not exist.
- `scripts/check-provenance.py` is specified but remains an S0 implementation task.

### Next entry state

- Start the durable explicitly GPT-5.6 Sol-selected implementation thread from `tcballard/Premonition`, run `/feedback`, record the core Session ID, create the ledger and execute S0 only—including implementation of `scripts/check-provenance.py`.

---

## Entry P6 — Correction to Entry P5: restore the PR workflow

**Date:** 2026-07-13

**Recorded at:** 2026-07-13T20:57:50+01:00

**Phase:** Pre-implementation repository correction

**Status:** Complete

**Model:** GPT-5.6 Sol — owner-confirmed in visible project context

**Session ID:** Not captured

### Objective

Correct the direct-to-main publication recorded in P5 and restore the expected reviewable GitHub workflow without rewriting repository history.

### Completed

- Acknowledged that committing the three project documents directly to `main` was incorrect.
- Reverted commit `4dbaa1adac5f1853e3d04eec61a984a2a76bda14` non-destructively with commit `dfd2e96a250290213433fc9e09f06852a0dc83a4`.
- Confirmed that `main` returned to the existing MIT `LICENSE` baseline.
- Created branch `agent/add-premonition-project-records` from the corrected `main`.
- Added the three documents on branch commit `05894be36bd6e5896d804d59258e7f81b4a6544c`.
- Opened draft pull request [#1](https://github.com/tcballard/Premonition/pull/1) targeting `main`.
- Preserved P5 as historical evidence and appended this correction rather than silently rewriting it.

### Decisions and provenance

- **Owner decision:** Repository changes must go through a pull request rather than being committed directly to `main`.
- **Sol implemented:** Non-destructive revert, feature branch, draft pull request and paired correction entries.
- **Sol reviewed:** Corrected branch topology, file scope, commit metadata and preservation of the existing licence.
- **Human-authored and Sol-reviewed:** None.

### Artefacts

- Revert commit `dfd2e96a250290213433fc9e09f06852a0dc83a4` — removes the prematurely published documents from `main` without rewriting history.
- Branch `agent/add-premonition-project-records` — reviewable documentation change.
- Branch commit `05894be36bd6e5896d804d59258e7f81b4a6544c` — adds the three P5 document versions.
- Draft pull request [#1](https://github.com/tcballard/Premonition/pull/1) — review and merge surface.
- `BUILDLOG.md` and `DEVLOG.md` — paired P6 correction entries added after the PR opened.

### Verification

- `main` head inspected after the revert — `dfd2e96a250290213433fc9e09f06852a0dc83a4`.
- Draft PR metadata inspected — base `main`, head `agent/add-premonition-project-records`, three changed files.
- Paired BUILDLOG/DEVLOG append and cross-reference checker — passed.
- Updated correction entries pushed to the PR branch and fetched back for verification — passed.

### Deviations

- Entry P5's direct-to-main publication used the wrong workflow. It was corrected with an ordinary revert commit rather than a force-push or history rewrite.

### Risks and missing evidence

- Pull request #1 remains draft and unmerged; the three documents are not currently present on `main`.
- The planning session still has no captured stable Session ID.
- The durable S0 ledger and provenance checker remain unimplemented.

### Next entry state

- Owner reviews and merges draft PR #1 when satisfied. After merge, start the durable explicitly GPT-5.6 Sol-selected S0 thread, capture `/feedback`, create the ledger and implement the provenance checker.

---

## Entry P7 — Align repository work with the owner’s Codex PR standard

**Date:** 2026-07-13

**Recorded at:** 2026-07-13T21:41:08+01:00

**Phase:** Pre-implementation repository workflow

**Status:** Complete

**Model:** GPT-5.6 Sol — owner-confirmed in visible project context

**Session ID:** Not captured

### Objective

Inspect the owner-supplied reference pull request `tcballard/SortingHat#14`, make its observable issue, branch, title, body, verification and review conventions authoritative for Premonition, and replace the earlier draft with a conforming review surface.

### Completed

- Inspected SortingHat pull request #14, its linked issue #7, its single material commit and its empty review timeline.
- Extracted the visible workflow: scoped issue first; `codex/issue-<number>-<slug>` branch; Conventional Commit title with `[issue:#<number>]`; draft PR; explicit included/excluded scope; architecture decisions; user contract; exact verification commands; covered behaviours; review path; and reviewer notes.
- Confirmed that the reference uses no `[CODEX]` commit-subject prefix. Premonition retains structured Sol trailers as its additional provenance layer.
- Added the issue-first pull-request contract to `PREMONITION_SPEC.md` and required `AGENTS.md` to restate it during S0.
- Opened issue [#2](https://github.com/tcballard/Premonition/issues/2) with objective, scope and acceptance criteria.
- Created `codex/issue-2-project-records` from corrected `main` with the three project documents in one issue-linked material commit.
- Opened replacement draft pull request [#3](https://github.com/tcballard/Premonition/pull/3) targeting `main` with the SortingHat review structure.
- Closed draft pull request #1 as superseded; it was not merged.

### Decisions and provenance

- **Owner decision:** Use the PR standards visible in `tcballard/SortingHat#14` for Premonition repository work.
- **Sol implemented:** Reference inspection, issue creation, specification amendment, conforming branch and draft PR replacement, and paired P7 records.
- **Sol reviewed:** Issue/PR linkage, branch and title conventions, PR evidence structure, main-branch preservation and Sol provenance compatibility.
- **Human-authored and Sol-reviewed:** None.

### Artefacts

- `PREMONITION_SPEC.md` — issue-first PR workflow made repository-authoritative.
- Issue [#2](https://github.com/tcballard/Premonition/issues/2) — objective, scope and acceptance contract.
- Branch `codex/issue-2-project-records` — conforming review branch.
- Draft pull request [#3](https://github.com/tcballard/Premonition/pull/3) — replacement review surface.
- Pull request #1 — closed as superseded, preserving its audit trail.
- `BUILDLOG.md` and `DEVLOG.md` — paired P7 workflow record.

### Verification

- SortingHat PR #14 metadata, diff, linked issue, commit and review timeline inspected — observable conventions recorded without inventing hidden harness rules.
- Premonition issue #2 inspected after creation — objective, scope and acceptance criteria present.
- Replacement PR metadata inspected — draft, open, base `main`, head `codex/issue-2-project-records`, three changed files.
- Corrected `main` inspected — remains at `dfd2e96a250290213433fc9e09f06852a0dc83a4`; no project documents added there.
- Paired BUILDLOG/DEVLOG append and cross-reference checker — passed.

### Deviations

- P6 used an `agent/` branch and an unlinked PR because the owner’s reference standard was not yet available. PR #1 was closed rather than renamed because GitHub branch and PR history should remain legible.

### Risks and missing evidence

- Pull request #3 remains draft and unmerged; the three documents are not present on `main`.
- No hidden or locally mounted harness policy was available; only standards observable in the owner-supplied public reference were adopted.
- The planning session still has no captured stable Session ID. The durable S0 ledger, `AGENTS.md` and provenance checker remain unimplemented.

### Next entry state

- Owner reviews and merges draft PR #3 when satisfied. After merge, start the durable explicitly GPT-5.6 Sol-selected S0 thread, capture `/feedback`, create the ledger, add `AGENTS.md` with the PR contract and implement the provenance checker.
