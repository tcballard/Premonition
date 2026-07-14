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

---

## Entry S0.1 — S0 foundation built; Sol patch benchmark blocks exit

**Date:** 2026-07-14

**Recorded at:** 2026-07-14T06:55:10+01:00

**Phase:** S0

**Status:** Partial

**Model:** GPT-5.6 Sol — explicitly confirmed by the owner's durable-session brief

**Session ID:** 019f5f0f-a2dd-78e3-a5b3-413860708eab — exposed by `CODEX_THREAD_ID`; `/feedback` was not callable on this surface

### Objective

Execute S0 completely and only S0, leaving a verified, reviewable foundation for S1.

### Completed

- Established issue #4 and branch `codex/issue-4-establish-s0-foundation` from clean `main` at `2e83e846d9bbe8764dce82a2e0869ce5655ea24c`.
- Added the SwiftPM library, executable and two S0 test targets without S1 product behaviour.
- Added a narrow `NSStatusItem` menu-bar shell, deterministic native `.app` assembly, the single build/run entrypoint and Codex Run action.
- Added deterministic shallow and deep demo failures with overwrite refusal and automated verification.
- Verified Codex CLI 0.144.2 flag placement, pinned model, low/medium/high effort acceptance, JSONL completion shape and ephemeral session-file behaviour.
- Added the prior/new boundary, Sol ledger, paired-log checker, provenance checker and durable repository guidance.
- Measured five shallow-fixture runs per effort. Low: 48.32 s median, 0/5 valid; medium: 16.02 s, 0/5; high: 41.07 s, 0/5.

### Decisions and provenance

- **Owner decision:** Execute S0 only under the attached durable GPT-5.6 Sol brief and the repository specification.
- **Sol implemented:** S0 scaffold, scripts, demo generator, tests, CLI contract, measurements and provenance records.
- **Sol reviewed:** Phase boundary, macOS 14+/SwiftPM/AppKit architecture, C1-C5/§13 invariants and measured blocker classification.
- **Human-authored and Sol-reviewed:** Pre-existing `PREMONITION_SPEC.md`, BUILDLOG P0-P7, DEVLOG P0-P7 and `LICENSE`.

### Artefacts

- `Package.swift`, `Sources/`, `Tests/` — headless core boundary and menu-bar shell.
- `scripts/`, `script/build_and_run.sh`, `packaging/` — deterministic build, launch, demo and evidence tooling.
- `.codex/environments/environment.toml` — one Run action.
- `docs/codex-contract.md` — verified CLI contract and aggregate measurements.
- `docs/build-week/prior-new-boundary.md`, `docs/build-week/sol-ledger.md` — event boundary and primary provenance record.
- `AGENTS.md` — durable phase, invariant and issue/PR workflow rules.

### Verification

- `swift test --filter minimumMacOSVersionIsPinned` — focused test built successfully and passed (1 test); the first sandboxed attempt failed only because Swift/Clang user caches were not writable, then passed with normal cache access.
- Harmless ephemeral Sol call plus aggregate session-file counts — exit 0, final agent message `OK`, count 190 before and 190 after; no historical session names or contents inspected.
- `python3 -u scripts/measure-sol.py` — 15 bounded ephemeral calls completed; medians and 0/15 valid-patch result recorded above.
- `scripts/test.sh` — Swift build passed; 2 Swift Testing tests passed; deterministic shallow/deep demo failures and overwrite refusal passed.
- `scripts/build-app.sh release` — release product built and staged at `dist/Premonition.app`.
- `script/build_and_run.sh --verify` — debug bundle rebuilt, opened with `/usr/bin/open -n` and process verification exited 0 after correcting stdout path capture.
- `plutil` inspection — staged bundle has identifier `co.armytage.Premonition`, macOS minimum 14.0 and `LSUIElement = true`.

### Deviations

- `/feedback` was unavailable as an action on this Codex surface. The stable `CODEX_THREAD_ID` was recorded instead; V14 still requires later `/feedback` resolution.
- CLI 0.144.2 requires global `--ask-for-approval never` before `exec`, rather than the expected post-`exec` placement in the specification.
- The S0 benchmark produced no valid shallow patch at any measured effort, so no reasoning-effort defaults were selected and S0 is not marked complete.

### Risks and missing evidence

- Diagnose why live CLI outputs fail `git apply --check`; observed CLI skill/plugin loading is a candidate but not yet established as cause.
- Rerun the required five-per-effort benchmark after the contract fix and select evidence-backed initial, escalation and rationale efforts.
- Run paired-log and provenance checks after the material commit exists, then update the draft PR evidence.
- `/feedback` must later resolve this durable thread for V14.

### Next entry state

- Resume S0 on issue #4. First isolate the invalid-patch cause using the generated demo repository without persisting model output, amend `docs/codex-contract.md`, rerun five calls per viable effort, select defaults only if validity supports them, then run the complete S0 exit suite. Do not begin S1.

---

## Entry S0.2 — Benchmark corrected and S0 exit verified

**Date:** 2026-07-14

**Recorded at:** 2026-07-14T07:16:29+01:00

**Phase:** S0

**Status:** Complete

**Model:** GPT-5.6 Sol — explicitly confirmed by the owner's durable-session brief

**Session ID:** 019f5f0f-a2dd-78e3-a5b3-413860708eab — exposed by `CODEX_THREAD_ID`; `/feedback` remains unavailable on this surface

### Objective

Identify the cause of S0.1's invalid-output result, correct the benchmark contract, rerun the five-per-effort measurement and verify the S0 exit state without beginning S1.

### Completed

- Identified a benchmark validator defect: the harness passed raw final text directly to `git apply --check` instead of applying the specification's single-surrounding-fence normalisation, and discarded all apply diagnostics.
- Added shared-contract fence normalisation, safe reason/shape diagnostics, bounded diagnostic controls and regression coverage to the measurement harness.
- Ruled out the old temporary-path prefix as a cause: both neutral and original-prefix medium diagnostics produced plain applicable Git diffs.
- Reran five shallow-fixture calls at each verified effort, all explicitly pinned to `gpt-5.6-sol`.
- Recorded corrected results: Low 20.73 s median and 5/5 valid; Medium 20.37 s and 4/5; High 34.07 s and 4/5.
- Selected Low for initial speculation, Medium for escalation and Low for rationale. Medium is a higher effort than Low, matched High's observed validity and avoided High's higher median latency.
- Kept Luna and Terra out of the benchmark because §13 settles GPT-5.6 Sol as the only real v0.1 executor.
- Completed the S0 exit suite and updated the Codex contract and Sol ledger.

### Decisions and provenance

- **Owner decision:** Review the invalid-output cause and rerun Medium then High while confirming the model remains pinned to GPT-5.6 Sol.
- **Sol implemented:** Measurement normalisation, safe diagnostics, regression test, corrected benchmark, effort selection and S0 evidence updates.
- **Sol reviewed:** Cause classification, model pinning, §13 scope, effort trade-offs and S0 exit criteria.
- **Human-authored and Sol-reviewed:** None.

### Artefacts

- `scripts/measure-sol.py` — contract-correct normalisation, safe diagnostics and bounded benchmark controls.
- `scripts/test-measure-sol.py` — regression coverage for plain, single-fenced and prose-wrapped output boundaries.
- `scripts/test.sh` — includes measurement-normalisation regression coverage.
- `docs/codex-contract.md` — retains the superseded result, records the cause, corrected measurements and selected efforts.
- `docs/build-week/sol-ledger.md` — append-only S0 correction and verification row.

### Verification

- `python3 -m py_compile scripts/measure-sol.py scripts/test-measure-sol.py` — passed.
- `python3 scripts/test-measure-sol.py` — plain diff retained, one surrounding fence stripped and prose-wrapped fence rejected as a boundary; passed.
- `python3 -u scripts/measure-sol.py --runs 1 --effort medium --diagnose` — plain Git diff, 312 bytes, applicable, 29.27 s; no raw output persisted.
- Original-prefix controlled diagnostic — plain Git diff, 312 bytes, applicable, 13.57 s; path-triggered routing ruled out.
- `python3 -u scripts/measure-sol.py` — 15 corrected runs completed: Low 20.73 s/5 of 5, Medium 20.37 s/4 of 5, High 34.07 s/4 of 5.
- `scripts/test.sh` — Swift build passed; 2 Swift Testing tests, demo repository checks and measurement-normalisation checks passed.
- `scripts/build-app.sh release` — release bundle staged successfully at `dist/Premonition.app`.
- `script/build_and_run.sh --verify` — real debug `.app` rebuilt, launched and process verification exited 0.

### Deviations

- S0.1's 0/15 result is superseded rather than rewritten. It measured a defective harness and is retained as historical evidence in BUILDLOG and the Codex contract.
- `/feedback` remains unavailable. The stable environment-provided Session ID is sufficient for the internal S0 ledger, while V14 remains explicit submission evidence debt for S6.

### Risks and missing evidence

- The shallow fixture has only five observations per effort; measurements guide defaults but do not prove general patch quality.
- Medium and High each produced one invalid patch. S2 validation and the single permitted escalation remain load-bearing.
- V14 still requires the durable thread's `/feedback` ID to be resolved before submission.

### Next entry state

- S1 may begin from commit-backed S0 evidence after the updated draft PR is reviewed. Start with the headless deterministic safety core only: gate corpus, resolver, configuration/state/verdict boundaries, canonical diff parser, ProcessRunner, candidate state machine and FixtureExecutor. Do not implement the real CodexExecutor until S2.

---

## Entry S0.3 — Durable S0 session closed

**Date:** 2026-07-14

**Recorded at:** 2026-07-14T07:22:46+01:00

**Phase:** S0

**Status:** Complete

**Model:** GPT-5.6 Sol — explicitly confirmed by the owner's durable-session brief

**Session ID:** 019f5f0f-a2dd-78e3-a5b3-413860708eab — exposed by `CODEX_THREAD_ID`; `/feedback` remains unavailable on this surface

### Objective

Close the durable S0 session with an exact, evidence-backed handoff for later work.

### Completed

- Confirmed the S0 branch is clean and matches its remote after commit `bd7634d`.
- Confirmed draft pull request #5 is open, targets `main` and is titled `chore(scaffold): complete S0 foundation [issue:#4]`.
- Preserved S0.2 as the implementation and verification record; this entry adds no product work or new verification claim.
- Recorded the owner's decision to end this session and resume next steps later.

### Decisions and provenance

- **Owner decision:** End the durable session at the completed S0 boundary and pick up the next steps later.
- **Sol implemented:** Paired session-closing handoff only.
- **Sol reviewed:** Clean branch state, pushed commit, draft PR state and exact S1 entry boundary.
- **Human-authored and Sol-reviewed:** None.

### Artefacts

- Commit `bd7634d` — completed S0 benchmark correction and exit evidence.
- Draft pull request #5 — open review surface targeting `main`.
- `BUILDLOG.md` and `DEVLOG.md` — paired S0.3 session closure.
- `docs/build-week/sol-ledger.md` — unchanged; the material S0.2 work is already recorded there.

### Verification

- `git status --short --branch` — clean branch tracking `origin/codex/issue-4-establish-s0-foundation` before this log-only checkpoint.
- `git log -2 --oneline --decorate` — S0 commits `bd7634d` and `1d4a686` observed.
- `gh pr view 5 --json number,title,isDraft,state,url` — PR #5 observed open and draft with the completed S0 title.

### Deviations

- None. This is a requested session-boundary checkpoint, not a new build phase.

### Risks and missing evidence

- V14 still requires the durable thread's `/feedback` ID before submission.
- Draft PR #5 remains unmerged and requires owner review.

### Next entry state

- When work resumes, first read PREMONITION_SPEC.md §11 and §13 plus BUILDLOG entries S0.2–S0.3, inspect PR #5 and the branch state, then begin S1 only after owner direction. S1 starts with the headless deterministic safety core; the real CodexExecutor remains S2 scope.

---

## Entry S1.1 — Headless safety core verified

**Date:** 2026-07-14

**Recorded at:** 2026-07-14T07:43:12+01:00

**Phase:** S1

**Status:** Complete

**Model:** GPT-5.6 Sol — explicitly confirmed by the owner's durable-session brief

**Session ID:** 019f5f0f-a2dd-78e3-a5b3-413860708eab — exposed by `CODEX_THREAD_ID`; `/feedback` remains unavailable on this surface

### Objective

Implement and verify the deterministic headless safety core under issue #6 without beginning the production Codex executor or UI phases.

### Completed

- Added type-before-read clipboard filtering, full-hash ten-minute deduplication, two-second debounce abstraction and a multilingual deterministic error gate.
- Added canonical allowlist/repository resolution, shape-locked safe-default configuration, persisted cap/state shapes and content-free verdict records.
- Added a single canonical unified-diff parser, path/symlink bounds validator and non-mutating `git apply --check` boundary.
- Added a subprocess runner with stdin, incremental stdout lines, bounded stderr, timeout and cancellation termination.
- Added the candidate single-flight/cap state boundary, fixture replay/loading and deterministic initial/escalation fixture outcomes; no production Codex invocation exists in S1.
- Added headless A2, A5, A6, A7 and A9 acceptance coverage plus unit/integration coverage and the S1 architecture and threat model.
- Completed the required Sol review. It found and resolved three gaps before exit: configuration covered only part of the locked schema, deduplication used the short logging hash instead of full SHA-256, and verdict kinds omitted later lifecycle decisions.

### Decisions and provenance

- **Owner decision:** Begin the next build phase after confirming S0 pull request #5 was merged.
- **Sol implemented:** S1 safety-core code, deterministic fixture boundaries, tests, architecture, threat model and phase evidence.
- **Sol reviewed:** Privacy ordering, config and logging shapes, diff/path boundaries, process lifetime, acceptance mapping and strict S1/S2 scope separation.
- **Human-authored and Sol-reviewed:** None.

### Artefacts

- `Sources/PremonitionCore/` — clipboard, gate, resolver, configuration/state, logging, diff validation, process, speculation and fixture components.
- `Tests/PremonitionCoreTests/PremonitionCoreTests.swift` — focused unit and integration coverage.
- `Tests/AcceptanceTests/SafetyCoreAcceptanceTests.swift` — named headless A2/A5/A6/A7/A9 contracts.
- `docs/architecture.md` and `docs/threat-model.md` — reviewed S1 system and safety boundaries.
- Issue #6 and branch `codex/issue-6-headless-safety-core` — S1 work surface.

### Verification

- `swift test --filter PremonitionCoreTests` — focused safety-core suite passed during implementation.
- `swift test --filter AcceptanceTests` — 5 named headless acceptance tests passed.
- `swift test` — final Swift suite passed with 23 tests and zero issues after the Sol review corrections, including the retained S0 scaffold regression.
- `scripts/test.sh` — repository exit suite passed: Swift tests, deterministic shallow/deep demo failures, overwrite refusal and measurement-normalisation boundaries.
- `git diff --check` — passed before the final log update.

### Deviations

- The first sandboxed `scripts/test.sh` attempt could not write Swift/Clang user caches; the same repository script passed with normal cache access. This was an execution-sandbox constraint, not a product failure.

### Risks and missing evidence

- The production Codex process tree, JSONL contract and real timeout/escalation path remain deliberately unimplemented until S2.
- Symlink targets can change after validation; the future explicit Apply path must revalidate immediately before mutation.
- V14 still requires the durable thread's `/feedback` ID before submission.

### Next entry state

- After issue #6 is committed, pushed, reviewed and merged, begin S2 by re-reading the live CLI contract and implementing only the production `CodexExecutor`, explicit Sol effort roles and real headless escalation path. Do not begin S3 clipboard/UI integration.

---

## Entry S2.1 — Real Sol executor verified headlessly

**Date:** 2026-07-14

**Recorded at:** 2026-07-14T18:03:04+01:00

**Phase:** S2

**Status:** Complete

**Model:** GPT-5.6 Sol — explicitly confirmed by the owner's durable-session brief and pinned in live CLI verification

**Session ID:** 019f5f0f-a2dd-78e3-a5b3-413860708eab — exposed by `CODEX_THREAD_ID`; `/feedback` remains unavailable on this surface

### Objective

Implement the production Codex CLI executor and real headless speculation path under issue #8, preserving S1 safety boundaries and stopping before S3 UI integration.

### Completed

- Re-verified Codex CLI 0.144.4: global no-approval placement, JSONL, read-only sandbox, explicit `gpt-5.6-sol`, Low/Medium effort override, ignored user config and ephemeral execution remain accepted.
- Added the executor protocol, request/result/event contracts, tolerant JSONL parser and production `CodexExecutor` with stdin-only prompts, bounded stderr and final-message extraction only after successful turn completion.
- Added Low initial speculation, exactly one Medium escalation, canonical diff/bounds/apply-check validation and terminal second failure. Added a Low, 30-second optional rationale path with first-ten-error-line and output bounds.
- Aligned timeout and cooperative cancellation on terminate, 250 ms grace and hard-kill fallback; explicit process environments prepend Homebrew paths.
- Added deterministic S2 tests for invocation flags, unknown JSONL events, malformed/incomplete streams, escalation/terminality, rationale limits and zero mutation.
- Ran live A1 headlessly against a fresh shallow demo repository: the real Sol executor returned an applicable patch and left the worktree unchanged.
- Verified A10: a corrected ephemeral call reported 158 session files before and after; Premonition Application Support had zero normal files, unexpected files or content matches.
- Preserved the PR #7 squash-trailer loss as an explicit machine-checked provenance exception rather than rewriting protected `main` or weakening the failure silently.

### Decisions and provenance

- **Owner decision:** Continue the build after confirming pull request #7 was merged.
- **Sol implemented:** S2 executor contracts, parser, production executor, speculation/rationale pipeline, prompt contracts, tests, live verification and provenance-exception handling.
- **Sol reviewed:** CLI security flags, event completion rules, escalation terminality, process lifecycle, persistence boundaries and S2/S3 scope separation.
- **Human-authored and Sol-reviewed:** None.

### Artefacts

- `Sources/PremonitionCore/Executor/` — executor contract, JSONL parser and production Codex CLI executor.
- `Sources/PremonitionCore/Speculation/` — prompt builder and real validation/escalation/rationale pipeline.
- `Sources/PremonitionCore/Process/ProcessRunner.swift` — explicit PATH and symmetric timeout/cancellation termination.
- `Tests/PremonitionCoreTests/S2ExecutorTests.swift` and `Tests/AcceptanceTests/SafetyCoreAcceptanceTests.swift` — S2 deterministic and opt-in live coverage.
- `docs/codex-contract.md` and `docs/prompts/` — 0.144.4 re-verification and versioned prompt boundaries.
- `docs/build-week/provenance-exceptions.md` and `scripts/check-provenance.py` — explicit PR #7 squash provenance exception.
- Issue #8 and branch `codex/issue-8-real-sol-executor` — S2 work surface.

### Verification

- Corrected harmless ephemeral CLI check — exit 0; expected four JSONL event shapes; aggregate session files 158 before and 158 after; no historical session contents inspected.
- `PREMONITION_LIVE_CODEX=1 swift test --filter a1HeadlessRealSol` — passed after 54.162 seconds with an applicable patch and clean temporary worktree.
- `swift test --filter S2ExecutorTests` — 6 focused executor/pipeline tests passed after the final invocation-contract refactor.
- `swift test` — 29 tests passed after lifecycle review; the opt-in live test returned immediately without its environment flag.
- `scripts/test.sh` — 30 tests plus deterministic demo and measurement-normalisation checks passed before the final focused refactor.
- Application Support privacy check — zero files, zero unexpected files and zero shallow-error/prompt/diff content matches.
- `python3 scripts/check-provenance.py` — passed after recording the exact PR #7 squash exception.
- `python3 scripts/check_buildlog.py BUILDLOG.md --devlog DEVLOG.md` and `git diff --check` — passed before this entry.

### Deviations

- The first corrected ephemeral wrapper attempt used zsh's reserved `status` variable and exited after the successful call but before printing counts; a second harmless call completed the 158/158 evidence.
- The first live A1 assertion saw Python's pre-executor `__pycache__`; the harness now removes that generated cache before measuring executor mutation, and the rerun passed.
- GitHub's squash merge for PR #7 stripped the verified S1 source commit trailers from `main` commit `27e4150`. Protected `main` was not rewritten; the exact commit, PR, source commit, phase, session and S1.1 entry are recorded as a narrow append-only exception.

### Risks and missing evidence

- CLI 0.144.4 emitted model-catalog, plugin and MCP startup warnings on bounded stderr despite successful turns; these can add latency and remain non-persisted diagnostics.
- The current live A1 observation is one real shallow run, not a general correctness claim.
- The PR #7 squash exception is auditable evidence debt; future squash merge messages must retain the four required trailers.
- V14 still requires the durable thread's `/feedback` ID before submission.

### Next entry state

- After issue #8 is committed, pushed, reviewed and merged with trailers preserved, begin S3 only: connect the verified pipeline to pasteboard polling, menu-bar states, popover, Settings/onboarding and explicit Apply/Copy/Dismiss behaviour. Do not begin S4 polish or release work.
