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

---

## Entry S3.1 — Functional menu-bar loop reaches owner acceptance

**Date:** 2026-07-14

**Recorded at:** 2026-07-14T18:49:38+01:00

**Phase:** S3

**Status:** Partial

**Model:** GPT-5.6 Sol — explicitly confirmed by the owner's durable-session brief

**Session ID:** 019f5f0f-a2dd-78e3-a5b3-413860708eab — exposed by `CODEX_THREAD_ID`; `/feedback` remains unavailable on this surface

### Objective

Connect the verified headless safety and executor layers to the functional menu-bar product under issue #10, stopping before S4 polish and retaining owner-visible acceptance as an explicit exit gate.

### Completed

- Added twice-per-second pasteboard polling with concealed/transient type inspection before string reads, two-second debounce and the existing gate, resolver, cap and single-flight admission order.
- Connected admitted candidates to the pinned production Sol executor and canonical validation pipeline, with pause cancellation, ten-minute held-fix expiry and content-free lifecycle verdicts.
- Replaced the inert status item with watching, speculating, fix-ready, paused and not-configured states plus a SwiftUI popover driven by one presentation model.
- Added first-run Settings, allowlisted-root add/remove, privacy constitution, Codex path/status display, daily-cap visibility and sound preference without adding S4 polish or model controls.
- Added explicit Apply, Copy and Dismiss actions. Apply rechecks literal clean-tree state and `git apply --check` at click time, then uses only `git apply` and leaves an unstaged edit.
- Corrected repository resolution for relative stack paths and repaired two process-runner lifecycle defects found by integration testing: EOF handlers could spin and blocking process waiting could deadlock cooperative tasks.
- Added explicit Apply and relative-path regression coverage; opening a held fix and pausing an active run now record the corresponding lifecycle verdicts.

### Decisions and provenance

- **Owner decision:** Proceed with issue #10's planned functional work and defer commentary or judgment on SwiftUI popover polish.
- **Sol implemented:** S3 pasteboard adapter, application presentation model, menu-bar/popover/Settings wiring, explicit fix actions, persistence/logging integration, process lifecycle corrections and regression tests.
- **Sol reviewed:** Privacy-before-read ordering, admission and egress order, clean-tree Apply contract, cancellation, single source of UI state and S3/S4 scope boundary.
- **Human-authored and Sol-reviewed:** None.

### Artefacts

- `Sources/PremonitionApp/PasteboardWatcher.swift`, `PresentationModel.swift` and `UI/PopoverView.swift` — functional S3 product loop.
- `Sources/PremonitionCore/Diff/PatchApplier.swift` — bounded explicit Apply contract.
- `Sources/PremonitionCore/Process/ProcessRunner.swift` — asynchronous termination and EOF-safe pipe draining.
- `Tests/PremonitionCoreTests/` — Apply, relative resolver and retained process lifecycle coverage.
- Issue #10 and branch `codex/issue-10-menu-bar-product` — S3 work surface.

### Verification

- `swift test && swift test` — two consecutive full runs passed with 32 tests each after the process lifecycle correction.
- `scripts/test.sh` — passed with 32 Swift tests, deterministic demo-repository checks and measurement-normalisation checks; the first managed-sandbox attempt failed only on an unwritable Swift module cache and the exact script passed with normal host cache access.
- `script/build_and_run.sh --verify` — rebuilt the debug application bundle, launched it and confirmed the Premonition process remained running.
- Focused explicit Apply test — clean temporary repository accepted the patch as an unstaged edit; the subsequent dirty-tree apply was rejected.

### Deviations

- None from the S3 scope. Visual polish, detailed motion and the filmable demo remain deferred; the current popover is a functional acceptance surface.

### Risks and missing evidence

- S3 is not complete: A1 still needs an owner-observed end-to-end clipboard run with Apply/Copy/Dismiss clicks, and A8/A14 plus fresh-config root onboarding require owner-visible verification.
- The local UI-control adapter could not enumerate the running accessory application, so no visual or accessibility claim is made from automation.
- V14 still requires the durable thread's `/feedback` ID before submission.

### Next entry state

- Resume S3. First launch from a fresh configuration, add a demo root through Settings, exercise one real admitted clipboard error through fix presentation and Apply/Copy/Dismiss, and record A1, A8 and A14 observations. Then perform the required Sol UI/accessibility review, correct any findings, run the complete S3 exit suite and only then mark S3 complete; do not begin S4 meanwhile.

---

## Entry S3.2 — Menu-bar product accepted and S3 completed

**Date:** 2026-07-15

**Recorded at:** 2026-07-15T05:44:43+01:00

**Phase:** S3

**Status:** Complete

**Model:** GPT-5.6 Sol — explicitly confirmed by the owner's durable-session brief and used by the live acceptance runs

**Session ID:** 019f5f0f-a2dd-78e3-a5b3-413860708eab — exposed by `CODEX_THREAD_ID`; `/feedback` remains unavailable on this surface

### Objective

Complete issue #10 by exercising the owner-visible S3 exit paths, correcting the functional and accessibility findings from the Sol review, and preserving S4 as a separate demo-surface phase.

### Completed

- Verified the provenance-preserving PR #11 squash at `5bb703f`; all four S3.1 trailers survived and the repository provenance checker passed.
- Completed A1 through the staged application and real pasteboard/Sol pipeline. The owner reviewed the held fix and clicked Apply; the content-free verdict recorded `applied`, exactly one tracked file became an unstaged one-line edit, the deterministic command then exited successfully and `git restore` returned the disposable repository to clean state.
- Completed A8 after presenting a fix from a clean tree and then adding one unrelated untracked marker. The owner clicked Apply and observed the safe failure with Copy patch retained; `apply_failed` was recorded and the target remained unchanged.
- Completed A14 from no config. Settings opened for the owner, who added the demo root without JSON editing; the resulting file was mode `0600` and contained the selected root, pinned Sol model, default cap and sound-off default.
- Performed the S3 Sol UI/accessibility review and corrected the findings: Escape no longer dismisses a held fix; the gear menu exposes Settings, Open Config and Quit; the footer shows daily count; Codex version is checked when Settings opens; popover height and configured render budget are bounded; large diffs show per-file counts; Apply failure is announced; status state carries label/value; single-instance launch is guarded; and the speculating glyph pulses unless Reduce Motion requests a static state.
- Added semantic diff gutters and restrained backgrounds while retaining literal line markers and VoiceOver line-kind descriptions, so added/removed meaning does not rely on colour.
- Corrected the deterministic demo generator to ignore Python cache artefacts so running the planted failure does not make the acceptance repository dirty before Apply.
- Restored Application Support to the three permitted normal files after the fresh-config exercise.

### Decisions and provenance

- **Owner decision:** Continue S3 through its required product polish, while keeping the filmable demo panel, narration and sound behaviour in S4.
- **Sol implemented:** S3 acceptance corrections, status motion/accessibility, menu and Settings completion, bounded semantic diff rendering, single-instance protection, Apply cleanliness refresh and clean demo-fixture behaviour.
- **Sol reviewed:** S3 presentation contract, keyboard semantics, accessibility labels/announcements, Reduce Motion, semantic appearance adaptation, clean-tree mutation boundaries and S3/S4 scope separation.
- **Human-authored and Sol-reviewed:** Owner-observed dark-appearance popover, Apply interaction, dirty-tree failure and fresh-config root onboarding.

### Artefacts

- `Sources/PremonitionApp/AppController.swift`, `AppDelegate.swift` and `PresentationModel.swift` — status/accessibility lifecycle, single-instance guard and safe user actions.
- `Sources/PremonitionApp/UI/PopoverView.swift` and `SettingsPlaceholderView.swift` — completed S3 menu, footer, bounded semantic diff and runtime status surfaces.
- `Sources/PremonitionApp/Strings.swift` — S3 user-visible and accessibility copy.
- `scripts/make-demo-repo.sh` — clean-tree-safe Python demo fixture.
- Branch `codex/issue-10-s3-acceptance` — S3 completion work surface.

### Verification

- Owner-observed A1 — held fix and rationale visible; Apply clicked; `applied` verdict observed; one unstaged one-line edit; deterministic command exit 0; `git restore` returned the disposable repository to clean state.
- Owner-observed A8 — Apply clicked after an unrelated untracked file was added post-presentation; safe failure shown, Copy patch remained, `apply_failed` recorded and only the marker appeared in `git status --porcelain`.
- Owner-observed A14 — no-config launch opened Settings; root added through `NSOpenPanel`; generated config was `-rw-------`, contained the selected root and retained `gpt-5.6-sol`, cap 30 and sound off.
- Owner-supplied dark-appearance screenshot — popover hierarchy, bounded semantic diff, labeled Sol rationale, action row and daily count were visibly present; no copied runtime content is retained in project logs.
- `scripts/test.sh` — 32 Swift tests, deterministic demo checks and measurement-normalisation checks passed after the final S3 corrections.
- `script/build_and_run.sh --verify` — final staged debug bundle rebuilt, launched and remained running.
- `swift build` and `git diff --check` — passed after the final 14 pt medium status-symbol configuration.
- Application Support file-name inspection — exactly `config.json`, `state.json` and `verdicts.jsonl` remained.

### Deviations

- The local Computer Use bridge could not enumerate the `LSUIElement` accessory application by name or bundle identifier. Owner observations and the supplied screenshot provide the visual evidence; automation claims only process, repository and content-free state evidence.

### Risks and missing evidence

- Light and increased-contrast appearances use semantic system colours and standard controls but were not separately captured in this session; include them in the S5 visual verification matrix.
- A1 is one live shallow-fixture observation, not a general patch-correctness claim.
- V14 still requires the durable thread's `/feedback` ID before submission.

### Next entry state

- After this S3 completion commit is pushed, reviewed and merged with provenance retained, begin S4 only: add the filmable non-activating demo panel, honest narration/timer, fixture recording/replay and specified sound behaviour. Start by opening a scoped S4 issue; do not begin release or submission work.

---

## Entry S3.3 — Authored fix experience ready for owner review

**Date:** 2026-07-15

**Recorded at:** 2026-07-15T08:21:33+01:00

**Phase:** S3

**Status:** Partial

**Model:** GPT-5.6 Sol — explicitly confirmed by the owner's durable-session brief

**Session ID:** 019f5f0f-a2dd-78e3-a5b3-413860708eab — exposed by `CODEX_THREAD_ID`; `/feedback` remains unavailable on this surface

### Objective

Implement the owner-approved post-S3 popover direction under issue #13 without beginning S4 or changing any speculation, admission, privacy, Apply or provenance contract.

### Completed

- Reframed the popover as a native instrument with Premonition identity and state first, followed by diagnosis, quiet repository/file context, a focused dark inset diff, a separately outlined Sol rationale, explicit actions and quiet safety/expiry metadata.
- Made Apply the sole native accent-blue primary action; retained Copy patch and Dismiss as secondary native controls and reserved green/red for semantic diff additions/removals.
- Kept the eye SF Symbol family as the functional identity and removed any need for a separate status rail, custom chrome, gradients or simulated Liquid Glass on the macOS 14 deployment target.
- Split the SwiftUI presentation into stable shell, header/receipt, fix-ready, semantic-diff and design-token views while leaving AppKit status-item/popover ownership unchanged.
- Added a read-only `DiffPresentation` projection over the existing canonical `UnifiedDiff`; it classifies visible lines and supplies non-colour VoiceOver descriptions without introducing a second parser or persistence path.
- Added ten-minute expiry to the held-fix presentation model so the existing ephemeral lifetime can be shown quietly in the footer.
- Added headless tests for file display, semantic line classification, accessible descriptions, aggregate counts and render-budget summarisation.

### Decisions and provenance

- **Owner decision:** Use Option 1 composition and hierarchy with Option 2's dark inset diff and outlined rationale, native-blue Apply, quiet operational metadata and no Option 3 status rail.
- **Sol implemented:** Native SwiftUI hierarchy, presentation components, design tokens, diff presentation projection, expiry metadata and accessibility-focused tests.
- **Sol reviewed:** S3/S4 phase boundary, canonical parser ownership, AppKit/SwiftUI ownership, colour semantics, accessibility labels and preservation of clean-tree Apply and privacy contracts.
- **Human-authored and Sol-reviewed:** Owner-approved Product Design ideation direction.

### Artefacts

- `Sources/PremonitionApp/UI/PopoverView.swift`, `PopoverChrome.swift` and `FixReadyView.swift` — authored shell, identity/state hierarchy and explicit actions.
- `Sources/PremonitionApp/UI/SemanticDiffView.swift` and `PremonitionDesign.swift` — native IDE-like diff presentation and semantic design roles.
- `Sources/PremonitionCore/Diff/DiffPresentation.swift` — read-only presentation projection over the canonical parsed diff.
- `Tests/PremonitionCoreTests/PremonitionCoreTests.swift` — semantic and accessibility presentation coverage.
- Issue #13 and branch `codex/issue-13-authored-popover` — reviewable S3.5 work surface.

### Verification

- `swift build` — passed on the pinned macOS 14 target after normal SwiftPM cache access was granted.
- `scripts/test.sh` — 34 Swift tests passed, including the new diff-presentation tests; deterministic demo and measurement-normalisation checks passed.
- `scripts/build-app.sh release` — production bundle assembled at `dist/Premonition.app`.
- `script/build_and_run.sh --verify` — debug bundle rebuilt, launched and remained running.
- `git diff --check` — passed before the log append.
- Existing paired-log and provenance checks — passed before this entry was appended.

### Deviations

- This is an owner-approved bounded S3 presentation refinement after S3 completion. It does not implement S4's demo panel, narration, fixture replay presentation or sound behaviour.

### Risks and missing evidence

- Owner visual review of the rebuilt fix-ready state is still pending, so no claim is made that the approved direction has been visually accepted in implementation.
- Light and increased-contrast appearance captures remain deferred to the S5 visual verification matrix.
- V14 still requires the durable thread's `/feedback` ID before submission.

### Next entry state

- Owner opens the running popover with a held fix and reviews hierarchy, density, diff readability, rationale separation and actions. Correct any findings on issue #13, rerun the complete verification set, then merge only with explicit owner authority; after merge, open a scoped S4 issue before beginning the filmable demo layer.

---

## Entry S3.4 — Monitoring state becomes a quiet watch field

**Date:** 2026-07-15

**Recorded at:** 2026-07-15T08:36:12+01:00

**Phase:** S3

**Status:** Partial

**Model:** GPT-5.6 Sol — explicitly confirmed by the owner's durable-session brief

**Session ID:** 019f5f0f-a2dd-78e3-a5b3-413860708eab — exposed by `CODEX_THREAD_ID`; `/feedback` remains unavailable on this surface

### Objective

Apply the authored macOS design review to issue #13's monitoring state after the owner found the newly installed idle presentation insufficiently authored.

### Completed

- Replaced the single stretched instruction with a compact three-level hierarchy: current state in the header, a direct next-action cue and a quiet local-admission status line.
- Made the monitoring signature functional by stating that the local gate is active and Sol waits for admission; no new gate, executor or persistence behavior was introduced.
- Reduced the configured monitoring popover height from 220 to 196 points while retaining separate heights for setup and fix-ready states.
- Changed the tertiary daily receipt from a foregrounded fraction to a quieter runs-today label with a complete accessibility value.
- Added a distinct paused treatment using the same hierarchy and native SF Symbols without ornamental watching animation.
- Rebuilt the release bundle, replaced `/Applications/Premonition.app` and verified that the running process uses the installed bundle.

### Decisions and provenance

- **Owner decision:** Apply `authored-macos-design` to the new monitoring screen before accepting issue #13.
- **Sol implemented:** Compact monitoring and paused compositions, admission-boundary copy, quiet daily receipt and state-specific popover sizing.
- **Sol reviewed:** Native popover density, hierarchy, material restraint, motion role, accessibility semantics and unchanged S3/S4 safety boundary.
- **Human-authored and Sol-reviewed:** Owner-supplied screenshot of the insufficient monitoring state.

### Artefacts

- `Sources/PremonitionApp/UI/PopoverView.swift` — authored monitoring and paused content.
- `Sources/PremonitionApp/UI/PopoverChrome.swift` and `Strings.swift` — quieter receipt and production copy.
- `Sources/PremonitionApp/AppController.swift` — state-specific native popover heights.
- `/Applications/Premonition.app` — locally installed owner-review build; not a published release.

### Verification

- `swift build` — passed on the existing macOS 14 target.
- `scripts/test.sh` — all 34 Swift tests plus deterministic demo and measurement-normalisation checks passed.
- `scripts/build-app.sh release` — production bundle assembled successfully.
- Installed-process check — the running command was `/Applications/Premonition.app/Contents/MacOS/Premonition`; installed and built executables matched byte-for-byte.
- `git diff --check` — passed before the log append.

### Deviations

- None. This remains a bounded presentation refinement within issue #13 and does not enter S4.

### Risks and missing evidence

- Owner visual acceptance of the new monitoring state and the fix-ready state remains pending.
- Automated UI control could not previously enumerate the accessory app; no automated focus or appearance claim is added here.
- Light and increased-contrast captures remain deferred to the S5 visual matrix.

### Next entry state

- Owner opens the newly installed monitoring popover and reviews its hierarchy, density, copy and admission-boundary signature. Correct any findings, then review a real fix-ready state before issue #13 is eligible for owner-approved merge.

---

## Entry S3.5 — Durable feedback Session ID confirmed

**Date:** 2026-07-15

**Recorded at:** 2026-07-15T17:37:34+01:00

**Phase:** S3

**Status:** Partial

**Model:** GPT-5.6 Sol — explicitly confirmed by the owner's durable-session brief

**Session ID:** 019f5f0f-a2dd-78e3-a5b3-413860708eab — owner-confirmed through `/feedback codex-session-id` and matched by `CODEX_THREAD_ID`

### Objective

Close the outstanding V14 provenance-evidence gap by recording the stable Session ID returned for the durable build thread.

### Completed

- The owner invoked `/feedback codex-session-id` and confirmed that the returned identifier is the required Session ID.
- The identifier matched the active `CODEX_THREAD_ID` already carried by the S0–S3 build records.
- V14's missing durable feedback Session ID is therefore resolved; earlier entries remain unchanged as accurate historical statements.

### Decisions and provenance

- **Owner decision:** Treat the confirmed `/feedback` identifier as the required V14 evidence.
- **Sol implemented:** Append-only BUILDLOG, DEVLOG and Sol-ledger update only.
- **Sol reviewed:** Identifier consistency with the active environment and prior phase records.
- **Human-authored and Sol-reviewed:** Owner invocation and confirmation of `/feedback codex-session-id`.

### Artefacts

- `BUILDLOG.md` and `DEVLOG.md` — paired S3.5 evidence record.
- `docs/build-week/sol-ledger.md` — V14 confirmation row.

### Verification

- `printenv CODEX_THREAD_ID` — returned `019f5f0f-a2dd-78e3-a5b3-413860708eab`, matching the owner-confirmed feedback identifier.

### Deviations

- None.

### Risks and missing evidence

- Owner visual acceptance of issue #13's monitoring and fix-ready states remains pending.
- Light and increased-contrast captures remain deferred to the S5 visual matrix.

### Next entry state

- Resume issue #13 owner review: inspect the installed monitoring state and a real fix-ready state, correct any findings, rerun verification and merge only with explicit owner authority.

---

## Entry S3.6 — CodexToolkit provenance context recorded

**Date:** 2026-07-15

**Recorded at:** 2026-07-15T17:44:33+01:00

**Phase:** S3

**Status:** Partial

**Model:** GPT-5.6 Sol — explicitly confirmed by the owner's durable-session brief

**Session ID:** 019f5f0f-a2dd-78e3-a5b3-413860708eab — owner-confirmed through `/feedback codex-session-id`

### Objective

Record the parallel formalisation of Codex skills used around the Premonition build so the builder diary preserves the relationship without treating external tooling as shipped product scope.

### Completed

- Recorded [tcballard/CodexToolkit](https://github.com/tcballard/CodexToolkit) as the owner's external workshop for focused Codex skills used to design, build, document, demonstrate and ship software.
- Recorded the owner-confirmed fact that other Codex sessions are preparing and pushing CodexToolkit pull requests alongside Premonition work.
- Observed draft CodexToolkit pull request [#1](https://github.com/tcballard/CodexToolkit/pull/1), `feat(toolkit): add Product Demo skill scaffold`, from branch `codex/product-demo-v0.0.1`.
- Preserved the boundary that CodexToolkit and the local workflow skills are provenance/build infrastructure, not Premonition runtime dependencies or v0.1 shipped features.

### Decisions and provenance

- **Owner decision:** Add the parallel CodexToolkit skill-formalisation work to Premonition's DEVLOG for provenance tracking.
- **Sol implemented:** Paired append-only provenance-context entries only.
- **Sol reviewed:** Separation between external workflow/tooling provenance and Premonition product/runtime scope.
- **Human-authored and Sol-reviewed:** Owner's description of the concurrent CodexToolkit sessions.

### Artefacts

- `BUILDLOG.md` and `DEVLOG.md` — paired S3.6 provenance-context record.
- [tcballard/CodexToolkit](https://github.com/tcballard/CodexToolkit) — external skill workshop; no code from it is added to Premonition by this entry.

### Verification

- `gh repo view tcballard/CodexToolkit` — confirmed the repository, description and `main` default branch.
- `gh pr list --repo tcballard/CodexToolkit --state all` — observed draft PR #1 as the only currently visible pull request; additional concurrent work remains owner-confirmed rather than GitHub-observed at this timestamp.

### Deviations

- None. This entry records adjacent provenance only and does not change the authoritative specification or S3/S4 product boundary.

### Risks and missing evidence

- The eventual set of CodexToolkit skills and PRs is still evolving; this entry is a timestamped context record, not a claim that the toolkit is complete.
- Owner visual acceptance of issue #13 remains pending.

### Next entry state

- Continue issue #13 owner review. Update the logs again only when CodexToolkit produces a concrete Premonition-related durable artefact or when the popover review reaches an owner decision.

---

## Entry S3.7 — CodexToolkit thread linked

**Date:** 2026-07-15

**Recorded at:** 2026-07-15T17:49:26+01:00

**Phase:** S3

**Status:** Partial

**Model:** GPT-5.6 Sol — explicitly confirmed for the Premonition durable session; the model used by the CodexToolkit thread is not asserted here

**Session ID:** 019f5f0f-a2dd-78e3-a5b3-413860708eab — Premonition durable session

### Objective

Attach the owner-supplied CodexToolkit thread identifier to the external provenance context recorded in S3.6.

### Completed

- Recorded CodexToolkit thread ID `019f647d-1687-7bf1-8b48-769da8e836d2` as owner-confirmed.
- Kept it distinct from Premonition's durable Session ID `019f5f0f-a2dd-78e3-a5b3-413860708eab`.

### Decisions and provenance

- **Owner decision:** Supply the CodexToolkit thread ID for provenance tracking.
- **Sol implemented:** Paired append-only linkage entries only.
- **Sol reviewed:** Separation of the two project thread identities and avoidance of unsupported model claims for the external thread.
- **Human-authored and Sol-reviewed:** Owner-supplied CodexToolkit thread identifier.

### Artefacts

- `BUILDLOG.md` and `DEVLOG.md` — paired S3.7 cross-project provenance link.

### Verification

- Owner-confirmed in the active Premonition conversation; no independent claim is made about the external thread's contents or model selection.

### Deviations

- None.

### Risks and missing evidence

- CodexToolkit remains evolving external workflow infrastructure.
- Owner visual acceptance of Premonition issue #13 remains pending.

### Next entry state

- Continue issue #13 owner review; use the CodexToolkit thread ID only when tracing the related external skill work.

---

## Entry S3.8 — Monitoring screen actually implemented

**Date:** 2026-07-15

**Recorded at:** 2026-07-15T18:19:59+01:00

**Phase:** S3

**Status:** Partial

**Model:** GPT-5.6 Sol — explicitly confirmed for the Premonition durable session; this entry continues issue #13 in that session context

**Session ID:** 019f5f0f-a2dd-78e3-a5b3-413860708eab — Premonition durable session

### Objective

Finish the owner-requested implementation of the pre-error monitoring screen from the dirty working tree after the previous Codex crash. Correct the gap where the earlier S3.4 monitoring refinement had not faithfully implemented the selected watch-dial visual direction.

### Completed

- Replaced the ordinary configured/no-fix popover body with a dedicated authored monitoring surface using the centered eye instrument, radial tick dial, top-right Pause and Settings controls, centered state copy and a quiet bottom receipt.
- Preserved the existing fix-ready and no-roots popover structures; the new monitoring surface is used only when roots are configured and no fix is held.
- Added reduced-motion aware dial behaviour: the sweep pauses for Reduce Motion and paused state, and the dial remains an SF Symbols eye-family identity element.
- Added content-free recent-activity metadata through an in-memory `lastRunAt` timestamp and existing verdict status text; no clipboard, prompt, diff, model output or stderr content is persisted or displayed.
- Added app-side monitoring presentation tests covering state copy, SF Symbols identity, receipt counter text and the daily-count accessibility label.
- Rebuilt, installed and launched `/Applications/Premonition.app` from the verified bundle so owner review is not looking at the older installed version.

### Decisions and provenance

- **Owner decision:** Finish and verify the actual monitoring-screen implementation from the dirty working tree before running the later UX/design evaluation skills.
- **Sol implemented:** S3 monitoring-screen SwiftUI implementation, presentation seam and tests, paired logs and provenance ledger update.
- **Sol reviewed:** S3/S4 boundary, §13 invariants, authored macOS design constraints, no-Liquid-Glass target rule and absence of new runtime egress or Apply behaviour.
- **Human-authored and Sol-reviewed:** Owner-supplied monitoring mock and approved product character.

### Artefacts

- `Sources/PremonitionApp/UI/MonitoringView.swift` — dedicated watch-dial monitoring surface and presentation mappers.
- `Sources/PremonitionApp/UI/PopoverView.swift` — routes configured/no-fix state to the monitoring surface while preserving fix-ready and empty states.
- `Sources/PremonitionApp/UI/PopoverChrome.swift` — gives Settings menu compact and prominent native control presentations.
- `Sources/PremonitionApp/PresentationModel.swift` — records a content-free in-memory last-run timestamp for the monitoring receipt.
- `Sources/PremonitionApp/Strings.swift` and `Sources/PremonitionApp/UI/PremonitionDesign.swift` — monitoring copy and semantic design tokens.
- `Tests/PremonitionAppTests/MonitoringPresentationTests.swift` and `Package.swift` — focused app presentation/accessibility coverage.
- `/Applications/Premonition.app` — installed from the rebuilt `dist/Premonition.app` bundle for owner review.

### Verification

- `git diff --check` — passed before and after the implementation/test changes.
- `swift build` — initial sandboxed run failed because SwiftPM could not write `~/.cache/clang/ModuleCache`; rerun outside the sandbox passed.
- `swift test` — passed 36 Swift tests, including two new monitoring presentation/accessibility tests.
- `scripts/test.sh` — passed 36 Swift tests plus demo-repository and measurement-normalisation checks.
- `scripts/build-app.sh release` — produced `dist/Premonition.app`.
- `script/build_and_run.sh --verify` — passed the repository developer build/verify entrypoint.
- `pkill -x Premonition`; `ditto dist/Premonition.app /Applications/Premonition.app`; `open -n /Applications/Premonition.app` — refreshed and launched the installed app bundle.
- `shasum -a 256 dist/Premonition.app/Contents/MacOS/Premonition /Applications/Premonition.app/Contents/MacOS/Premonition` — hashes matched.
- `ps -p 36346 -o pid= -o comm=` — confirmed the running process path as `/Applications/Premonition.app/Contents/MacOS/Premonition`.

### Deviations

- None from the specification. This corrects the earlier visual implementation gap without starting S4, adding a demo panel, changing the executor, changing Apply or introducing persistence of protected content.

### Risks and missing evidence

- Owner visual acceptance of the installed monitoring screen remains pending.
- Product-design evaluation skills have not yet been run; the owner explicitly sequenced those after implementation.
- Light, increased-contrast and full accessibility matrix captures remain deferred to the later visual/accessibility review path.

### Next entry state

- Owner should inspect the installed monitoring state, then run the planned UX/design evaluation pass on the actual implementation and decide any follow-up issue #13 corrections before merging or beginning S4.

---

## Entry S3.9 — Dial sweep refined

**Date:** 2026-07-15

**Recorded at:** 2026-07-15T18:30:41+01:00

**Phase:** S3

**Status:** Partial

**Model:** GPT-5.6 Sol — explicitly confirmed for the Premonition durable session; this entry continues issue #13 in that session context

**Session ID:** 019f5f0f-a2dd-78e3-a5b3-413860708eab — Premonition durable session

### Objective

Refine the monitoring dial so the eye remains a quiet SF Symbol instrument while the dial, not the pupil, carries the scanning cue.

### Completed

- Replaced the prior three-tick circular orbit with a softer lobe that eases across the dial's upper arc from left to right and back.
- Kept the eye glyph itself static so the product reads as an instrument rather than a character or autonomous observer.
- Preserved paused and Reduce Motion behaviour: paused state remains static and reduced motion shows a single static lit tick.
- Added app presentation coverage for the dial sweep's active arc, paused opacity and inactive lower-dial state.
- Rebuilt, installed and launched `/Applications/Premonition.app` from the updated bundle.

### Decisions and provenance

- **Owner decision:** Prefer the best product fit: refine the dial sweep rather than animate the eye or add a pupil glint.
- **Sol implemented:** S3 monitoring-dial motion refinement and app-side test coverage.
- **Sol reviewed:** Motion grammar, Reduce Motion behaviour and the S3/S4 boundary.
- **Human-authored and Sol-reviewed:** Owner's direction to avoid the pupil-glint risk and keep the cue instrument-like.

### Artefacts

- `Sources/PremonitionApp/UI/MonitoringView.swift` — upper-arc monitoring dial sweep.
- `Tests/PremonitionAppTests/MonitoringPresentationTests.swift` — dial sweep behaviour coverage.
- `/Applications/Premonition.app` — refreshed installed bundle for owner review.

### Verification

- `swift test` — passed 37 Swift tests after correcting the new dial-sweep assertion.
- `scripts/test.sh` — passed 37 Swift tests plus demo-repository and measurement-normalisation checks.
- `git diff --check` — passed.
- `scripts/build-app.sh release` — produced `dist/Premonition.app`.
- `pkill -x Premonition`; `ditto dist/Premonition.app /Applications/Premonition.app`; `open -n /Applications/Premonition.app` — refreshed and launched the installed app bundle.
- `shasum -a 256 dist/Premonition.app/Contents/MacOS/Premonition /Applications/Premonition.app/Contents/MacOS/Premonition` — hashes matched.

### Deviations

- None from the specification. The change stays inside S3 monitoring polish and does not add S4 demo behaviour, persistence, executor changes or Apply changes.

### Risks and missing evidence

- Owner visual acceptance of the refined installed monitoring sweep remains pending.
- Product-design evaluation skills have not yet been run; they remain the next review step.

### Next entry state

- Owner should inspect the installed refined monitoring sweep, then run the planned UX/design evaluation pass on the actual implementation and decide any follow-up issue #13 corrections before merging or beginning S4.

---

## Entry S3.10 — Dial sweep made full-circle

**Date:** 2026-07-15

**Recorded at:** 2026-07-15T18:36:08+01:00

**Phase:** S3

**Status:** Partial

**Model:** GPT-5.6 Sol — explicitly confirmed for the Premonition durable session; this entry continues issue #13 in that session context

**Session ID:** 019f5f0f-a2dd-78e3-a5b3-413860708eab — Premonition durable session

### Objective

Correct the S3.9 dial motion after owner review: the sweep must travel around the full circle rather than bounce across only the upper arc.

### Completed

- Changed `MonitoringDialSweep.activePosition` from upper-arc easing to a full-ring progression across all 48 dial ticks.
- Kept the static SF Symbol eye and soft lobe falloff, so the scan cue remains in the dial rather than becoming eye or pupil animation.
- Preserved separate watching and speculating speeds, paused stillness and Reduce Motion's static single-tick fallback.
- Updated the app test to assert full-ring quarter, half and three-quarter positions plus paused and inactive-opposite-side behaviour.
- Rebuilt, installed and launched `/Applications/Premonition.app` from the updated bundle.

### Decisions and provenance

- **Owner decision:** The sweep must go around the full circle.
- **Sol implemented:** S3 monitoring-dial correction and matching test update.
- **Sol reviewed:** Motion remains an instrument cue and does not change S3 safety, runtime or Apply behaviour.
- **Human-authored and Sol-reviewed:** Owner correction of the S3.9 visual behaviour.

### Artefacts

- `Sources/PremonitionApp/UI/MonitoringView.swift` — full-circle monitoring dial sweep.
- `Tests/PremonitionAppTests/MonitoringPresentationTests.swift` — full-ring sweep coverage.
- `/Applications/Premonition.app` — refreshed installed bundle for owner review.

### Verification

- `swift test` — passed 37 Swift tests.
- `scripts/test.sh` — passed 37 Swift tests plus demo-repository and measurement-normalisation checks.
- `git diff --check` — passed.
- `scripts/build-app.sh release` — produced `dist/Premonition.app`.
- `pkill -x Premonition`; `ditto dist/Premonition.app /Applications/Premonition.app`; `open -n /Applications/Premonition.app` — refreshed and launched the installed app bundle.
- `shasum -a 256 dist/Premonition.app/Contents/MacOS/Premonition /Applications/Premonition.app/Contents/MacOS/Premonition` — hashes matched.

### Deviations

- S3.9 recorded an upper-arc scan, but owner review found that behaviour insufficient because it did not travel around the full circle. This entry corrects that implementation without rewriting S3.9.

### Risks and missing evidence

- Owner visual acceptance of the installed full-circle sweep remains pending.
- Product-design evaluation skills have not yet been run; they remain the next review step.

### Next entry state

- Owner should inspect the installed full-circle monitoring sweep, then run the planned UX/design evaluation pass on the actual implementation and decide any follow-up issue #13 corrections before merging or beginning S4.

---

## Entry S3.11 — Deferred Sites explainer handoff persisted

**Date:** 2026-07-15

**Recorded at:** 2026-07-15T18:40:03+01:00

**Phase:** S3 checkpoint for deferred S6/submission-support material

**Status:** Partial

**Model:** GPT-5.6 Sol — explicitly confirmed for the Premonition durable session; this checkpoint preserves owner-supplied future-session guidance

**Session ID:** 019f5f0f-a2dd-78e3-a5b3-413860708eab — Premonition durable session

### Objective

Persist the owner-supplied Sites explainer handoff for a later S6/submission-support session without starting Sites work now.

### Completed

- Added `docs/build-week/sites-explainer-handoff.md` with the deferred future-session prompt.
- Recorded that the Sites explainer remains deferred until the app, README, demo flow, provenance logs and release evidence are stable.
- Recorded that no Sites work, deployment, publication or external promotion has started.
- Recorded that this handoff does not alter Premonition's runtime scope, product implementation, S3/S4 phase boundary or v0.1 invariants.

### Decisions and provenance

- **Owner decision:** Persist the Sites explainer handoff now, but do not start Sites work.
- **Sol implemented:** Deferred handoff document plus paired checkpoint logs.
- **Sol reviewed:** S6/submission-support boundary and the no-public-action/no-runtime-scope-change guardrails.
- **Human-authored and Sol-reviewed:** Owner-supplied handoff content and constraints.

### Artefacts

- `docs/build-week/sites-explainer-handoff.md` — deferred Sites landing/explainer handoff prompt.
- `BUILDLOG.md` and `DEVLOG.md` — paired S3.11 checkpoint.

### Verification

- `test -f docs/build-week/sites-explainer-handoff.md` — passed.
- `python3 scripts/check_buildlog.py BUILDLOG.md --devlog DEVLOG.md` — passed, reporting 24 paired BUILDLOG/DEVLOG entries.
- `python3 scripts/check-provenance.py` — passed, reporting the provenance record complete.

### Deviations

- None. This is documentation-only and deliberately starts no Sites implementation, deployment, publication or promotion.

### Risks and missing evidence

- The Sites explainer remains future S6/submission-support work and must be re-grounded in the then-current spec, logs, README, demo flow and release evidence before use.

### Next entry state

- Continue issue #13 owner visual review and planned UX/design evaluation. Defer all Sites work until the app, README, demo, provenance logs and release evidence are stable and the owner explicitly authorises Sites work.

---

## Entry S3.12 — CodexToolkit skill formalisation updated

**Date:** 2026-07-15

**Recorded at:** 2026-07-15T18:59:14+01:00

**Phase:** S3 provenance checkpoint

**Status:** Partial

**Model:** GPT-5.6 Sol — explicitly confirmed for the Premonition durable session; this checkpoint records owner-supplied external workflow context

**Session ID:** 019f5f0f-a2dd-78e3-a5b3-413860708eab — Premonition durable session

### Objective

Record the owner's update that the Premonition workflow skills used in this session are now also being added to the external CodexToolkit repository.

### Completed

- Recorded that the `build-premonition` and `maintain-premonition-build-log` skills used in this session are being formalised into CodexToolkit.
- Preserved the boundary that CodexToolkit remains external workflow infrastructure and provenance context, not Premonition app/runtime scope.
- Confirmed that the next Premonition agenda remains issue #13 owner visual review, planned UX/design evaluation and any final popover corrections before S4.

### Decisions and provenance

- **Owner decision:** Note that the Premonition build/log skills are being added to CodexToolkit before continuing through the issue #13 agenda.
- **Sol implemented:** Paired provenance checkpoint logs only.
- **Sol reviewed:** Separation between external workflow tooling provenance and Premonition product/runtime invariants.
- **Human-authored and Sol-reviewed:** Owner-supplied CodexToolkit update.

### Artefacts

- `BUILDLOG.md` and `DEVLOG.md` — paired S3.12 external workflow provenance checkpoint.

### Verification

- Owner-confirmed in the active Premonition conversation; no independent claim is made in this entry about the current CodexToolkit branch, pull request, merge status or model selection.

### Deviations

- None. This does not alter Premonition's runtime scope, v0.1 invariants, S3/S4 boundary, Sites deferral or publication status.

### Risks and missing evidence

- The CodexToolkit skill formalisation remains external and evolving; future Premonition sessions should re-check that repository only when its concrete artefacts become relevant to Premonition submission or process provenance.

### Next entry state

- Continue the previously outlined agenda: inspect the installed issue #13 UI, run the planned UX/design evaluation on the real implementation, apply any final corrections, then prepare PR #14 for owner review/merge before beginning S4.

---

## Entry S3.13 — Settings menu opens the shared Settings scene

**Date:** 2026-07-16

**Recorded at:** 2026-07-16T07:08:21+01:00

**Phase:** S3

**Status:** Partial

**Model:** GPT-5.6 Sol — explicitly confirmed for the Premonition durable session; this entry continues issue #13 in that session context

**Session ID:** 019f5f0f-a2dd-78e3-a5b3-413860708eab — Premonition durable session

### Objective

Repair the issue #13 monitoring and fix-ready gear-menu path after the owner observed that choosing Settings did not present the Settings window.

### Completed

- Replaced the popover's detached `SettingsLink` with an explicit action routed back to `AppController`, because the manually hosted `NSPopover` view does not inherit the SwiftUI Settings scene environment reliably.
- Added one shared `SettingsWindowOpener` for both first-run onboarding and the gear menu. It activates the accessory application and sends the existing `showSettingsWindow:` scene action.
- Made the gear-menu path close the transient popover before opening Settings.
- Added an app-side regression test that verifies activation and the exact Settings scene selector without adding runtime telemetry or changing configuration, admission, executor, Apply or persistence behaviour.
- Rebuilt, installed and launched `/Applications/Premonition.app` from the verified release bundle.

### Decisions and provenance

- **Owner decision:** Fix the non-opening Settings action before continuing the issue #13 UX agenda.
- **Sol implemented:** Shared Settings-window action routing, popover closure wiring, regression coverage and paired provenance records.
- **Sol reviewed:** S3/A14 Settings ownership, AppKit/SwiftUI boundary, accessory-app activation and unchanged v0.1 safety/runtime invariants.
- **Human-authored and Sol-reviewed:** Owner observation that the Settings action did not present its window.

### Artefacts

- `Sources/PremonitionApp/AppController.swift` — shared AppKit-owned Settings opener and first-run/menu routing.
- `Sources/PremonitionApp/UI/PopoverView.swift`, `PopoverChrome.swift` and `MonitoringView.swift` — explicit Settings action propagation through the manually hosted popover.
- `Tests/PremonitionAppTests/MonitoringPresentationTests.swift` — focused Settings routing regression test.
- `/Applications/Premonition.app` — refreshed local owner-review bundle; not a published release.

### Verification

- `swift test --filter settingsWindowOpenerRoutesToSettingsScene` — focused Settings route passed after correcting an initial actor-isolation compile error in the injected default construction.
- `swift test` — 38 Swift tests passed.
- `scripts/test.sh` — 38 Swift tests plus deterministic demo-repository and measurement-normalisation checks passed; the first sandboxed attempt failed only because Swift/Clang user caches were not writable, and the prescribed script passed with normal cache access.
- `scripts/build-app.sh release` — production bundle assembled at `dist/Premonition.app`.
- `script/build_and_run.sh --verify` — freshly staged debug bundle built and launched through the repository's single developer entrypoint.
- SHA-256 comparison — built and installed executables matched at `bb4639f157c9d30988b3ca1f48941ac619033b69e503d8ded29061ecfcbef3db`.
- Installed-process check — PID 80505 was running `/Applications/Premonition.app/Contents/MacOS/Premonition`.

### Deviations

- None from the specification. The repair restores the required shared non-modal Settings scene and A14 path within S3; it does not begin S4 or alter product safety contracts.

### Risks and missing evidence

- The available Computer Use bridge again could not enumerate the `LSUIElement` accessory application, so the final gear → Settings visual/focus observation remains an owner-review step rather than an automated UI claim.
- Issue #13 owner visual acceptance remains open.

### Next entry state

- Owner clicks the installed app's gear menu and confirms that Settings opens and takes focus. If accepted, continue the planned UX/design evaluation of the monitoring and fix-ready states, apply any final issue #13 corrections, and prepare the branch for owner review before S4.

---

## Entry S3.14 — Settings action deferred and app installed from a clean slate

**Date:** 2026-07-16

**Recorded at:** 2026-07-16T07:18:03+01:00

**Phase:** S3

**Status:** Partial

**Model:** GPT-5.6 Sol — explicitly confirmed for the Premonition durable session; this entry continues issue #13 in that session context

**Session ID:** 019f5f0f-a2dd-78e3-a5b3-413860708eab — Premonition durable session

### Objective

Respond to the owner's report that S3.13 still did not visibly open Settings by correcting the menu-dismissal timing and performing a genuinely clean rebuild, cache cleanup and fresh installation.

### Completed

- Deferred the Settings scene action until the next main-loop turn after closing the transient popover, so the action is no longer sent while the gear menu's tracking loop is still unwinding.
- Stopped Premonition and unregistered both the installed and staged bundles from Launch Services.
- Removed the 436 MB repository-local `.build` cache, staged `dist` bundle and old `/Applications/Premonition.app` before rebuilding.
- Cleared the app's AppKit/SwiftUI preference domain, which contained the prior Settings-window frame and open-panel state; no dedicated Premonition cache directory or saved-application-state directory existed.
- Preserved `/Users/tballard/Library/Application Support/Premonition` and its three permitted files: `config.json`, `state.json` and `verdicts.jsonl`.
- Built the focused regression and complete repository suite from the empty SwiftPM build directory, assembled a release bundle, installed it into an empty `/Applications/Premonition.app` destination, registered only that bundle and launched it.
- Verified the installed executable against the freshly built release, then removed the regenerated `.build` and `dist` directories so only the installed application copy remains.

### Decisions and provenance

- **Owner decision:** Perform a fresh rebuild and installation while clearing Premonition-associated cache/state accumulated during the UX iteration.
- **Sol implemented:** Main-loop deferral of the Settings action, bounded generated-state cleanup, clean rebuild/install and paired provenance records.
- **Sol reviewed:** Preservation of Application Support configuration, Launch Services duplicate-bundle risk, menu tracking timing and unchanged runtime safety invariants.
- **Human-authored and Sol-reviewed:** Owner observation that the S3.13 installed flow still did not visibly present Settings.

### Artefacts

- `Sources/PremonitionApp/AppController.swift` — defers Settings presentation until after the gear menu and transient popover finish closing.
- `/Applications/Premonition.app` — sole freshly installed owner-review bundle.
- `BUILDLOG.md`, `DEVLOG.md` and `docs/build-week/sol-ledger.md` — append-only correction and clean-install evidence.

### Verification

- Empty-state checks before rebuild — `.build`, `dist` and the installed bundle were absent; the AppKit preference domain was empty; Application Support retained its three permitted files.
- `swift test --filter settingsWindowOpenerRoutesToSettingsScene` — rebuilt from an empty `.build` directory and passed the focused Settings route.
- `scripts/test.sh` — 38 Swift tests plus deterministic demo-repository and measurement-normalisation checks passed.
- `scripts/build-app.sh release` — release bundle assembled from the clean build state.
- SHA-256 comparison before removing `dist` — built and installed executables matched at `d5a9a1e51c559a53033c94c542577614aacdfef2ae0b48756388d647b663464b`.
- Installed-process check — PID 94951 was running `/Applications/Premonition.app/Contents/MacOS/Premonition`.
- Final cleanup check — `.build` and `dist` were absent and the installed executable remained present.

### Deviations

- S3.13's synchronous menu action did not visibly resolve the owner's flow despite matching installed and built binaries. This append-only entry records the smaller timing correction rather than rewriting S3.13.

### Risks and missing evidence

- The Computer Use bridge still timed out when enumerating the sole installed `LSUIElement` app, so the clean install and action wiring are verified but the final visual/focus result remains owner-observed.
- If Settings still fails after this exact clean install, replace the SwiftUI responder action with an explicitly owned `NSWindowController`; do not attribute another failure to stale build artifacts.
- Issue #13 owner visual acceptance remains open.

### Next entry state

- Owner retries gear → Settings… in the sole running `/Applications/Premonition.app`. If Settings appears, continue the planned issue #13 UX/design review. If it does not, implement the explicit shared `NSWindowController` fallback as the next bounded S3 correction.

---

## Entry S3.15 — Settings now uses an explicitly owned native window

**Date:** 2026-07-16

**Recorded at:** 2026-07-16T07:26:32+01:00

**Phase:** S3

**Status:** Partial

**Model:** GPT-5.6 Sol — explicitly confirmed for the Premonition durable session; this entry continues issue #13 in that session context

**Session ID:** 019f5f0f-a2dd-78e3-a5b3-413860708eab — Premonition durable session

### Objective

Replace the repeatedly failing SwiftUI Settings-scene responder path with the explicit shared `NSWindowController` fallback identified in S3.14.

### Completed

- Added one long-lived `SettingsWindowController` owned by `AppController` and backed by the existing `SettingsPlaceholderView` through `NSHostingController`.
- Configured one fixed 520 × 430 native titled, closable and miniaturizable non-modal window; it is not released when closed, disables tabbing, follows the active Space and restores its frame through one autosave name.
- Made both first-run onboarding and gear → Settings call the owned controller directly after the transient popover closes.
- `showSettings()` activates the accessory application, restores a miniaturized window when necessary, shows the retained controller and explicitly makes the window key and frontmost.
- Removed the SwiftUI `Settings` scene and the `showSettingsWindow:` responder selector entirely. The app now starts through the existing AppKit delegate while SwiftUI remains the source of truth for Settings and popover content.
- Replaced the selector-spy regression with a native-window lifecycle test that calls the real show path, observes visibility, closes the window and confirms the same controller retains the same window instance.
- Built, installed and launched the explicit-controller release at `/Applications/Premonition.app`, then removed `.build` and `dist` so only the installed bundle remains.

### Decisions and provenance

- **Owner decision:** Replace the still-failing Settings path with an explicitly owned `NSWindowController`.
- **Sol implemented:** Native Settings window ownership, AppKit application entrypoint, shared first-run/menu routing, visibility/reuse regression coverage and paired provenance records.
- **Sol reviewed:** Single-window lifetime, accessory-app activation/focus, SwiftUI/AppKit source-of-truth boundary, macOS 14 compatibility and unchanged runtime safety invariants.
- **Human-authored and Sol-reviewed:** Owner observation that the clean S3.14 build still did not visibly open Settings.

### Artefacts

- `Sources/PremonitionApp/SettingsWindowController.swift` — explicitly owned native window hosting the existing SwiftUI Settings content.
- `Sources/PremonitionApp/AppController.swift` — owns and routes both Settings entry paths to the controller.
- `Sources/PremonitionApp/PremonitionApp.swift` — AppKit accessory-app entrypoint with no competing SwiftUI Settings scene.
- `Tests/PremonitionAppTests/MonitoringPresentationTests.swift` — native window visibility, fixed-contract and retained-lifetime regression.
- `/Applications/Premonition.app` — sole freshly installed owner-review bundle.

### Verification

- `swift test --filter settingsWindowControllerOwnsReusableWindow` — focused test passed twice; the final version called `showSettings()`, observed `isVisible`, closed the window and confirmed retained identity.
- `scripts/test.sh` — 38 Swift tests plus deterministic demo-repository and measurement-normalisation checks passed.
- `scripts/build-app.sh release` — release bundle assembled successfully.
- Source search — no `SettingsWindowOpener`, `showSettingsWindow:` selector or SwiftUI `Settings` scene remains under `Sources` or `Tests`.
- SHA-256 comparison before removing `dist` — built and installed executables matched at `f88bf96420be0de018c63702c083f453da55f3fbd49c2701295f9810319abf6a`.
- Installed-process check — PID 8507 was running `/Applications/Premonition.app/Contents/MacOS/Premonition`.
- Final cleanup check — `.build` and `dist` were absent and the installed executable remained present.

### Deviations

- S3.13 and S3.14 attempted to retain SwiftUI Settings-scene presentation through the responder chain; owner observation proved that path unreliable in the installed accessory app. This entry replaces it with the specification's explicitly owned shared non-modal window controller rather than adding another fallback layer.

### Risks and missing evidence

- The native show path is now exercised by an automated window-visibility test, but the final gear-menu click and focus result in the installed `LSUIElement` app still requires owner observation because Computer Use cannot enumerate it.
- Issue #13 owner visual acceptance remains open.

### Next entry state

- Owner retries gear → Settings… in the running `/Applications/Premonition.app`. If accepted, resume the planned issue #13 UX/design evaluation and final review preparation before S4.

---

## Entry S3.16 — Native menu-bar interaction split

**Date:** 2026-07-16

**Recorded at:** 2026-07-16T07:36:58+01:00

**Phase:** S3

**Status:** Partial

**Model:** GPT-5.6 Sol — explicitly confirmed for the Premonition durable session; this entry continues issue #13 in that session context

**Session ID:** 019f5f0f-a2dd-78e3-a5b3-413860708eab — Premonition durable session

### Objective

Replace the popover gear submenu with a direct Settings action and move infrequent application commands to the menu-bar eye's native right-click menu.

### Completed

- Kept left-click on the menu-bar eye as the single toggle for Premonition's primary popover.
- Added AppKit event routing so right-click opens a native `NSMenu` without changing the left-click interaction.
- Added Settings…, Open Config File… and Quit Premonition to that context menu, with native separators, key equivalents and config-file availability validation.
- Replaced the gear's SwiftUI `Menu` in both monitoring and fix-ready surfaces with one direct Settings button. The button retains native compact/prominent chrome, help text and an explicit accessibility label, but no longer presents a chevron or secondary menu.
- Preserved the S3.15 explicitly owned `SettingsWindowController`; first-run onboarding, the direct gear and the native context menu all route to the same retained non-modal window.
- Added presentation regressions for the left/right-click split and the native utility-menu command structure.
- Built, installed and launched the updated release at `/Applications/Premonition.app`.

### Decisions and provenance

- **Owner decision:** Use the menu-bar eye's native right-click menu for Settings, Open Config File and Quit, while making the in-popover gear a direct Settings action.
- **Sol implemented:** AppKit status-item event routing, native context-menu construction, direct SwiftUI Settings buttons, regression coverage, release installation and paired provenance records.
- **Sol reviewed:** Left-click discoverability, native menu validation, single Settings-window ownership, accessibility naming, macOS 14 compatibility and unchanged runtime safety invariants.
- **Human-authored and Sol-reviewed:** Owner preference that the gear should not trigger its own submenu after the Settings window became reliable.

### Artefacts

- `Sources/PremonitionApp/AppController.swift` — status-item click routing and native application utility menu.
- `Sources/PremonitionApp/UI/PopoverChrome.swift` — direct compact Settings button.
- `Sources/PremonitionApp/UI/MonitoringView.swift` — direct prominent Settings button.
- `Tests/PremonitionAppTests/MonitoringPresentationTests.swift` — click-routing and native-menu structure regressions.
- `/Applications/Premonition.app` — installed owner-review bundle.

### Verification

- `swift test --disable-sandbox --filter MonitoringPresentationTests` — six focused presentation/window/menu tests passed.
- `scripts/test.sh` — 40 Swift tests plus deterministic demo-repository and measurement-normalisation checks passed.
- `script/build_and_run.sh --verify` — prescribed developer entrypoint built, launched and confirmed the app remained running.
- `scripts/build-app.sh release` — release bundle assembled successfully.
- SHA-256 comparison — built and installed executables matched at `c5f8b7fa572bd970e545132e2ad2d74468d73b7a1ef342dec432ff707c390743`.
- Installed-process check — PID 20092 was running `/Applications/Premonition.app/Contents/MacOS/Premonition`.
- `git diff --check` — no whitespace errors.

### Deviations

- The earlier S3 popover contract grouped Settings, config and Quit under the visible gear. The owner-approved interaction refinement moves secondary application commands to the conventional status-item right-click menu while retaining a visible, one-click Settings route. No runtime pipeline or safety contract changed.

### Risks and missing evidence

- Automated tests cover routing and menu composition, but the final click feel, menu placement and Settings focus in the installed `LSUIElement` app remain owner-observed.
- Issue #13 owner visual acceptance remains open; S4 has not started.

### Next entry state

- Owner verifies left-click popover, direct gear → Settings, and right-click Settings/Open Config/Quit in the installed app. If accepted, run the planned issue #13 UX/design evaluation and prepare the existing branch for review without merging.

---

## Entry S3.17 — Status menu now opens below the menu bar

**Date:** 2026-07-16

**Recorded at:** 2026-07-16T07:43:43+01:00

**Phase:** S3

**Status:** Partial

**Model:** GPT-5.6 Sol — explicitly confirmed for the Premonition durable session; this entry continues issue #13 in that session context

**Session ID:** 019f5f0f-a2dd-78e3-a5b3-413860708eab — Premonition durable session

### Objective

Correct S3.16's right-click menu placement after owner observation showed the context menu overlapping the macOS menu bar.

### Completed

- Replaced cursor-event `NSMenu.popUpContextMenu` presentation with `NSMenu.popUp(positioning:at:in:)`.
- Converted the status button's bounds into screen coordinates and anchored the menu's top edge to the button's bottom-left edge, placing the menu below the menu bar independently of the pointer position.
- Preserved native status-button highlighting while the menu tracks and retained the approved left-click popover, right-click utility menu and direct gear → Settings split.
- Added a regression for the screen-space bottom-edge anchor.
- Built, installed and launched the corrected release at `/Applications/Premonition.app`.

### Decisions and provenance

- **Owner observation:** S3.16's menu overlapped the menu bar and should use standard below-menu-bar placement.
- **Sol implemented:** Screen-space status-button anchoring, native tracking highlight, regression coverage, release installation and append-only correction records.
- **Sol reviewed:** AppKit menu positioning semantics, right-click-only routing, macOS 14 compatibility and unchanged runtime safety invariants.

### Artefacts

- `Sources/PremonitionApp/AppController.swift` — bottom-edge status-menu presentation.
- `Tests/PremonitionAppTests/MonitoringPresentationTests.swift` — menu anchor regression.
- `/Applications/Premonition.app` — corrected installed owner-review bundle.

### Verification

- `swift test --disable-sandbox --filter MonitoringPresentationTests` — seven focused tests passed.
- `scripts/test.sh` — 41 Swift tests plus deterministic demo-repository and measurement-normalisation checks passed.
- `script/build_and_run.sh --verify` — developer bundle built, launched and remained running.
- `scripts/build-app.sh release` — release bundle assembled successfully.
- SHA-256 comparison — built and installed executables matched at `e5b96875dba5137433ddc2c7d31096921610e656f2b3ec7d083ae6bc0b4a4a6d`.
- Installed-process check — PID 26245 was running `/Applications/Premonition.app/Contents/MacOS/Premonition`.

### Deviations

- S3.16 described the right-click surface as native but used context-menu positioning tied to the click event. The menu content and routing were correct; this append-only correction replaces only the inappropriate presentation primitive.

### Risks and missing evidence

- The anchor is mechanically covered and the exact release is installed, but final menu placement remains owner-observed in the live menu-bar environment.
- Issue #13 owner visual acceptance remains open; S4 has not started.

### Next entry state

- Owner right-clicks the running menu-bar eye and confirms the utility menu begins below the menu bar. If accepted, continue the planned issue #13 UX/design evaluation without beginning S4.

---

## Entry S3.18 — Menu anchor follows the actual menu-bar boundary

**Date:** 2026-07-16

**Recorded at:** 2026-07-16T07:52:19+01:00

**Phase:** S3

**Status:** Partial

**Model:** GPT-5.6 Sol — explicitly confirmed for the Premonition durable session; this entry continues issue #13 in that session context

**Session ID:** 019f5f0f-a2dd-78e3-a5b3-413860708eab — Premonition durable session

### Objective

Correct S3.17 after owner screenshot evidence showed that the status button's lower edge was inset above the display's real menu-bar boundary, leaving the menu surface overlapping system chrome.

### Completed

- Replaced the status-button-only vertical anchor with the top of the active screen's `visibleFrame`, which represents the actual bottom edge of the menu bar.
- Retained the button's horizontal anchor and used the lower of the button edge and visible-frame edge so auto-hidden menu bars remain safe.
- Updated the placement regression to cover both a visible menu bar with an inset status button and an auto-hidden menu-bar fallback.
- Preserved every S3.16 interaction decision and all runtime safety invariants.
- Built, installed and launched the corrected release at `/Applications/Premonition.app`.

### Decisions and provenance

- **Owner evidence:** The S3.17 installed screenshot showed the menu below the pointer but still intruding into the menu bar because the status button itself does not extend to the menu bar's bottom edge.
- **Sol implemented:** Dynamic screen-visible-frame anchoring, fallback coverage, release installation and append-only correction records.
- **Sol reviewed:** Multi-display screen selection, auto-hidden-menu-bar behaviour, macOS 14 availability and unchanged runtime safety boundaries.

### Artefacts

- `Sources/PremonitionApp/AppController.swift` — actual menu-bar-boundary anchor.
- `Tests/PremonitionAppTests/MonitoringPresentationTests.swift` — visible and auto-hidden menu-bar geometry coverage.
- `/Applications/Premonition.app` — corrected installed owner-review bundle.

### Verification

- `swift test --disable-sandbox --filter MonitoringPresentationTests` — seven focused tests passed.
- `scripts/test.sh` — 41 Swift tests plus deterministic demo-repository and measurement-normalisation checks passed.
- `script/build_and_run.sh --verify` — developer bundle built, launched and remained running.
- `scripts/build-app.sh release` — release bundle assembled successfully.
- SHA-256 comparison — built and installed executables matched at `9f427db393d2d2ed3e4f045cf66f49315a7b4cef4db1be6aecdd5b56b4e445ec`.
- Installed-process check — PID 38924 was running `/Applications/Premonition.app/Contents/MacOS/Premonition`.

### Deviations

- S3.17 assumed the bottom of `NSStatusBarButton` matched the display's menu-bar boundary. The owner screenshot disproved that assumption on the current display; this correction derives the boundary from `NSScreen.visibleFrame` instead of adding a device-specific offset.

### Risks and missing evidence

- The exact release and geometry rule are verified mechanically, but the corrected live placement remains an owner visual check.
- Issue #13 owner visual acceptance remains open; S4 has not started.

### Next entry state

- Owner right-clicks the running menu-bar eye and confirms the menu surface now starts wholly beneath the menu bar. If accepted, continue the planned issue #13 UX/design evaluation without beginning S4.

---

## Entry S3.19 — Fix actions now leave the state they promise

**Date:** 2026-07-18

**Recorded at:** 2026-07-18T12:04:11+01:00

**Phase:** S3

**Status:** Partial

**Model:** GPT-5.6 Sol — explicitly confirmed for the Premonition durable session; this entry continues issue #13 in that session context

**Session ID:** 019f5f0f-a2dd-78e3-a5b3-413860708eab — Premonition durable session

### Objective

Resolve the three interaction defects confirmed by the issue #13 UX audit: stale Dismiss feedback, Copy Patch feedback overwritten by Premonition's own pasteboard write, and unreliable keyboard focus in the fix-ready popover.

### Completed

- Persisted the reviewable remediation plan at `docs/build-week/s3-ux-remediation-plan.md`.
- Added distinct content-free terminal receipts for Apply, Copy Patch and Dismiss, so releasing a candidate no longer leaves `Fix ready` behind.
- Marked only Premonition's known Copy Patch pasteboard write as handled; later external pasteboard changes still enter the existing watcher normally.
- Made the transient popover window key after presentation and gave Apply, Copy Patch and Dismiss explicit SwiftUI focus ownership and accessibility labels.
- Focus now begins on Apply only while Apply is safe, falls back to Copy Patch when Apply is unavailable, and moves away if a clean-tree recheck disables Apply.
- Added focused regression coverage for terminal receipts, local pasteboard suppression followed by external observation, receipt presentation and focus policy.
- Rebuilt, replaced and relaunched `/Applications/Premonition.app` from the verified release snapshot.

### Decisions and provenance

- **Owner decision:** Fix the three verified UX defects before filming and keep the work documented in a plan alongside the thread.
- **Sol implemented:** Terminal-action receipts, narrow self-authored pasteboard suppression, AppKit key-window handoff, SwiftUI action focus, accessibility labels, regression coverage, plan and provenance checkpoint.
- **Sol reviewed:** S3 phase fit, explicit human decision boundary, unchanged gate/allowlist/cap/Sol/validation/Apply contracts and the dirty-tree scope.

### Artefacts

- `docs/build-week/s3-ux-remediation-plan.md` — owner-reviewable scope, acceptance criteria and completion checklist.
- `Sources/PremonitionApp/PresentationModel.swift` and `Strings.swift` — distinct terminal receipts.
- `Sources/PremonitionApp/PasteboardWatcher.swift` — narrow handled-local-write boundary.
- `Sources/PremonitionApp/AppController.swift` and `UI/FixReadyView.swift` — key popover and explicit action focus.
- `Tests/PremonitionAppTests/MonitoringPresentationTests.swift` — receipt, watcher and focus regressions.
- `/Applications/Premonition.app` — installed owner-review release.

### Verification

- Focused `PremonitionAppTests` — ten tests passed during implementation.
- Stable `/tmp` snapshot `swift test` — 44 tests passed; this snapshot was required because the workspace file-provider layer changed source/build mtimes during two direct SwiftPM attempts.
- Stable snapshot `scripts/test.sh` — 44 Swift tests plus deterministic demo-repository and measurement-normalisation checks passed.
- Stable snapshot `scripts/build-app.sh release` — release bundle assembled successfully.
- Stable snapshot `script/build_and_run.sh --verify` — developer bundle built and launched successfully.
- Installed accessibility observation — Apply was the focused action in a safe fix-ready state (`true, false, false` for Apply, Copy Patch and Dismiss).
- SHA-256 comparison — snapshot release and installed executables matched at `ef36360a41f22ecfb91b12c48c6f7e4b4231c4e1b7865e4145d1cb5ad5e1e2f9`.
- `git diff --check` — no whitespace errors before this log append.

### Deviations

- Direct workspace verification was not accepted as final evidence because external mtime changes invalidated compilation twice. The unchanged dirty-tree snapshot was copied to `/tmp` and all prescribed commands were rerun there.
- Accessibility automation reliably proved initial action focus, but transient-popover closure made the scripted post-click receipt inspection flaky. The receipt and pasteboard state transitions are covered deterministically; final visual feel remains an owner check.

### Risks and missing evidence

- The wider screenshot audit still needs the owner's visual pass across light/dark appearance, Escape, Dismiss and Copy Patch receipts in the installed app.
- Issue #13 remains uncommitted and unmerged in the existing dirty worktree. S4 has not started.

### Next entry state

- Owner reviews the installed S3.19 build against `docs/build-week/s3-ux-remediation-plan.md`, especially Dismiss, Copy Patch, keyboard traversal, Escape and light/dark appearance. Resolve any observed defect, then prepare issue #13 for review without merging or beginning S4.

---

## Entry S3.20 — Owner acceptance closes the popover gate

**Date:** 2026-07-18

**Recorded at:** 2026-07-18T13:15:42+01:00

**Phase:** S3

**Status:** Complete

**Model:** GPT-5.6 Sol — explicitly confirmed for the Premonition durable session; this entry continues issue #13 in that session context

**Session ID:** 019f5f0f-a2dd-78e3-a5b3-413860708eab — Premonition durable session

### Objective

Record the owner's installed-app acceptance of the S3.19 remediation and close the remaining issue #13 visual gate before preparing the branch for review.

### Completed

- Owner confirmed the installed Dismiss receipt, Copy Patch receipt, keyboard traversal, Escape behaviour and light/dark appearance.
- Marked `docs/build-week/s3-ux-remediation-plan.md` owner accepted.
- Confirmed that issue #13 remains the active S3 scope and that draft PR #14 already exists for the branch.

### Decisions and provenance

- **Owner acceptance:** The installed S3.19 interaction and appearance checks passed; continue to branch and PR preparation.
- **Sol implemented:** Acceptance checkpoint, plan state and provenance record.
- **Sol reviewed:** Issue #13 scope, S3 completion boundary and the prohibition on merging or beginning S4 without the next owner decision.

### Artefacts

- `docs/build-week/s3-ux-remediation-plan.md` — owner-accepted remediation record.
- `BUILDLOG.md`, `DEVLOG.md` and `docs/build-week/sol-ledger.md` — paired acceptance evidence.

### Verification

- Owner-observed installed-app pass — Dismiss, Copy Patch, keyboard traversal, Escape, light appearance and dark appearance confirmed.
- GitHub inspection — issue #13 remains open and draft PR #14 targets `main` from `codex/issue-13-authored-popover`.

### Deviations

- None. This checkpoint records acceptance only and adds no runtime behaviour.

### Risks and missing evidence

- The dirty issue #13 work still requires final diff review, provenance-bearing commit, push and draft PR refresh.
- No merge is authorised. S4 has not started.

### Next entry state

- Review the complete issue #13 diff, run log and provenance validation, commit with the required Sol trailers, push `codex/issue-13-authored-popover`, refresh draft PR #14 and return it for owner review without merging.

---

## Entry S4.1 — S4 starts from the accepted instrument

**Date:** 2026-07-18

**Recorded at:** 2026-07-18T14:10:26+01:00

**Phase:** S4

**Status:** Partial

**Model:** GPT-5.6 Sol — explicitly confirmed for the Premonition durable session

**Session ID:** 019f5f0f-a2dd-78e3-a5b3-413860708eab — Premonition durable session

### Objective

Verify the owner-confirmed issue #13 squash merge, restore a clean `main`, establish the bounded S4 issue and branch, and translate the specification into an implementation plan before changing runtime code.

### Completed

- Verified PR #14 merged as squash commit `3839966c4c4f6b86ce4750f433eea0e358929c36` and retained the issue #13 Sol trailers through BUILDLOG S3.20.
- Repaired an interrupted local fast-forward after the filesystem cancelled Git's `mmap`; the pre-operation tree was clean and local `main` now exactly matches `origin/main`.
- Re-ran paired-log and provenance validation successfully on merged `main`.
- Closed completed issue #13 after its owner-accepted merge.
- Created issue #15, `S4: build rationale and filmable demo`, from the authoritative S4 scope and acceptance scenarios A11 and A12.
- Created `codex/issue-15-rationale-filmable-demo` from clean merged `main`.
- Added `docs/build-week/s4-implementation-plan.md`, mapping the existing rationale, FixtureExecutor, configuration, Settings and AppKit seams into a bounded S4 architecture and test plan.

### Decisions and provenance

- **Owner decision:** PR #14 was squash merged; continue to the next build phase.
- **Sol implemented:** Merge/provenance verification, safe local baseline repair, S4 issue, branch and implementation plan.
- **Sol reviewed:** Earliest-incomplete-phase selection, S4 entry criteria, A11/A12 boundary, non-activating panel ownership, content-free stage state and replay-only model-hop substitution.

### Artefacts

- GitHub issue #15 — bounded S4 objective, scope, acceptance and exclusions.
- `codex/issue-15-rationale-filmable-demo` — S4 implementation branch.
- `docs/build-week/s4-implementation-plan.md` — durable implementation and verification plan.

### Verification

- `gh pr view 14` — merged at 2026-07-18T12:55:29Z as `3839966c4c4f6b86ce4750f433eea0e358929c36`.
- Squash commit inspection — retained Sol model, session, phase and BUILDLOG trailers for all material issue #13 commits.
- `python3 scripts/check_buildlog.py BUILDLOG.md --devlog DEVLOG.md` — 33 paired entries valid before this append.
- `python3 scripts/check-provenance.py` — provenance record complete before this append.
- Local `main` and `origin/main` — identical and clean after the interrupted-fast-forward repair.

### Deviations

- Git's first fast-forward was interrupted by a filesystem `mmap` cancellation and left a partial checkout. Because the source branch was verified clean, the worktree and index were restored exactly from `origin/main` and the local ref advanced to the confirmed squash commit without rewriting history.

### Risks and missing evidence

- No S4 runtime code or tests have been added yet.
- DEBUG fixture recording remains conditional: it will be deferred if A12 can be satisfied without adding a content-bearing persistence path.
- S4 owner visual acceptance and airplane-mode replay evidence remain open.

### Next entry state

- Implement the content-free demo-stage model, explicitly owned non-activating panel, live event projection, clearly labelled fixture replay and system Tink preference on issue #15; then add focused A11/A12 and accessibility coverage before running the S4 exit suite.

---

## Entry S4.2 — The safety spine now has a filmable shadow

**Date:** 2026-07-18

**Recorded at:** 2026-07-18T15:51:28+01:00

**Phase:** S4

**Status:** Partial

**Model:** GPT-5.6 Sol — explicitly confirmed for the Premonition durable session

**Session ID:** 019f5f0f-a2dd-78e3-a5b3-413860708eab — Premonition durable session

### Objective

Implement the S4 demo surface and offline replay path while preserving the admitted pipeline, optional post-validation rationale, explicit human decision boundary and normal-operation privacy contract.

### Completed

- Added a content-free ordered demo model covering gate, repository, Sol reading/drafting, validation and clean-apply stages with an honest admission-based elapsed clock.
- Added a long-lived AppKit-owned `NSPanel` that is borderless, floating, shadowed, movable by background and explicitly unable to become key or main.
- Persisted panel geometry only through the existing `panel_frame` state field.
- Projected live pipeline lifecycle and new internal validating/validated events into the panel without retaining narration text.
- Added the Settings panel toggle and retained the existing sound preference; the only ready sound is the system Tink and remains off by default.
- Added `AnyExecutor` and a local `FixtureReplayExecutor` with recorded relative offsets and configurable acceleration.
- Routed fixture replay through the real gate, allowlisted repository resolver, admission state machine, canonical diff parser, bounds validator, `git apply --check` and normal held-fix presentation while bypassing Codex and egress logging.
- Added a visible `Fixture replay` label to both panel and held-fix presentation.
- Bundled the canonical shallow replay fixture inside the app so owner/judge replay does not require a JSON fixture path; `fixture_path` remains an explicit override.
- Deferred DEBUG fixture recording because the repository-authored fixture satisfies A12 without introducing a content-bearing persistence path.

### Decisions and provenance

- **Owner decision:** Continue S4 after the issue #15 phase plan was established.
- **Sol implemented:** Demo-stage state, non-activating panel, live projection, honest timer, sound route, timed replay executor, bundled fixture, Settings controls and A11/A12 coverage.
- **Sol reviewed:** Replay replaces only the model hop; live egress callback remains exclusive to `CodexExecutor`; panel state is content-free; rationale remains post-validation and non-blocking; Apply remains unchanged.

### Artefacts

- `Sources/PremonitionApp/DemoPresentation.swift` — content-free ordered stage and timing model.
- `Sources/PremonitionApp/DemoPanelController.swift` and `UI/DemoPanelView.swift` — explicit native panel ownership and presentation.
- `Sources/PremonitionCore/Executor/FixtureExecutor.swift` and `Executor.swift` — timed local replay and executor erasure.
- `Fixtures/shallow/` — bundled deterministic offline replay fixture.
- `docs/build-week/s4-implementation-plan.md` — implementation status and remaining review gates.
- `/Applications/Premonition.app` — installed S4 owner-review release with bundled fixture.

### Verification

- Stable snapshot `swift test` — 51 tests passed, including named A11 rationale independence and A12 offline replay.
- Stable snapshot `scripts/test.sh` — 51 Swift tests plus deterministic demo-repository and measurement-normalisation checks passed.
- Stable snapshot `scripts/build-app.sh release` — release bundle assembled successfully.
- Stable snapshot `script/build_and_run.sh --verify` — developer bundle built and launched successfully.
- Final focused A12 test after fixture bundling — passed.
- Release resource check — `Contents/Resources/Fixtures/shallow/fixture.json` exists in the built and installed bundles.
- SHA-256 comparison — built and installed release executables matched at `5132f54d2d9d2d6ca6eb3dc8fd89c468ecc3a2a26cb1d347e991f4ae6a35ac6d`.
- `git diff --check` — no whitespace errors before this append.

### Deviations

- Direct workspace test builds remain vulnerable to the previously recorded file-provider mtime race, so authoritative test evidence used stable `/tmp` snapshots.
- Fixture recording is deferred: the required offline path uses a repository-authored deterministic bundle, and no normal-operation recorder was added.

### Risks and missing evidence

- Owner visual review of panel placement, non-activation, stage timing, replay labelling and system sound remains open.
- A12 is deterministic and mechanically green, but the installed airplane-mode replay observation remains open.
- S4 is not ready for commit or PR until those owner-visible gates are completed.

### Next entry state

- Owner opens Settings, enables `Show “See the Future” panel`, confirms the quiet waiting presentation, then uses `Replay configured fixture` against the clean demo repository with networking disabled. Confirm stage/timer/replay labelling, no focus theft, fix review and optional Tink; resolve any visual or interaction defects before final S4 verification and PR preparation.

---

## Entry S4.3 — The offline loop is accepted and reviewable

**Date:** 2026-07-18

**Recorded at:** 2026-07-18T16:33:40+01:00

**Phase:** S4

**Status:** Complete

**Model:** GPT-5.6 Sol — explicitly confirmed for the Premonition durable session

**Session ID:** 019f5f0f-a2dd-78e3-a5b3-413860708eab — Premonition durable session

### Objective

Record the owner's installed S4 acceptance, repeat the complete branch verification from a stable snapshot, and publish the provenance-bearing issue #15 implementation as a draft pull request without merging it.

### Completed

- Owner approved the requested installed review covering panel placement, stage progression, honest timer, replay labelling, focus behaviour, optional sound and networking-disabled fixture replay.
- Repeated the full 51-test Swift suite, repository wrapper, release bundle and developer launch verification from a fresh stable `/tmp` snapshot.
- Reworked the fixture's blank context lines so the stored patch remains applicable while the repository change is whitespace-clean; reran focused A12 after the correction.
- Committed the complete S4 implementation as `778517df1b5620ff5e5a219f33109837a3078fb3` with the required model, session, phase and BUILDLOG trailers.
- Pushed `codex/issue-15-rationale-filmable-demo` and opened draft pull request [#16](https://github.com/tcballard/Premonition/pull/16) targeting `main`.

### Decisions and provenance

- **Owner decision:** Accept the installed S4 demo panel and offline replay checks and continue to the reviewable draft PR.
- **Sol implemented:** Final fixture cleanup, fresh verification, commit and draft-PR preparation, paired handoff records and plan completion.
- **Sol reviewed:** S4 exit criteria, A11/A12 evidence, replay's zero-model boundary, content-free panel state, unchanged Apply contract and the S5 stop boundary.
- **Human-authored and Sol-reviewed:** None.

### Artefacts

- Commit `778517df1b5620ff5e5a219f33109837a3078fb3` — filmable panel, bundled offline replay, Settings controls and S4 tests.
- Draft pull request [#16](https://github.com/tcballard/Premonition/pull/16) — owner review surface for issue #15.
- `docs/build-week/s4-implementation-plan.md` — completed S4 checklist and explicit exclusions.
- `BUILDLOG.md`, `DEVLOG.md` and `docs/build-week/sol-ledger.md` — final S4 owner-acceptance and handoff evidence.

### Verification

- Stable snapshot `swift test` — 51 tests passed, including A11 rationale independence and A12 real-pipeline offline replay.
- Stable snapshot `scripts/test.sh` — 51 Swift tests plus deterministic demo-repository and measurement-normalisation checks passed.
- Stable snapshot `scripts/build-app.sh release` — release bundle assembled with `Contents/Resources/Fixtures/shallow/fixture.json` present.
- Stable snapshot `script/build_and_run.sh --verify` — developer app bundle built and launched successfully.
- `swift test --filter a12OfflineReplay` — focused A12 passed after the final fixture whitespace cleanup.
- `git diff --cached --check` — staged issue #15 implementation was whitespace-clean.
- `python3 scripts/check_buildlog.py BUILDLOG.md --devlog DEVLOG.md` — 35 paired entries valid before this append.
- `python3 scripts/check-provenance.py` — provenance record complete after commit `778517d` and before this final append.
- Commit identity check — author and committer were both `Tom Ballard <tom@armytage.co>`; all four required Sol trailers were present.
- Owner-observed installed review — panel, timer, replay labelling, non-focus-stealing behaviour, sound option and networking-disabled replay approved.

### Deviations

- The first sandboxed `scripts/test.sh` attempt could not write the user Swift/Clang module cache; the unchanged snapshot was rerun with the prescribed cache access and passed.
- A zero-context fixture cleanup did not satisfy default `git apply`; the fixture was corrected to retain its required full hunk while representing blank context without trailing spaces, and focused A12 then passed.
- Local `gh auth status` reported stale credentials, so the already-connected GitHub integration created draft PR #16 after ordinary Git credentials successfully pushed the branch.

### Risks and missing evidence

- The S4 release remains unsigned development output; signing, notarisation and release hardening belong to S5.
- Draft PR #16 remains unmerged. No merge, auto-merge, release, publication or S5 implementation is authorised by this entry.

### Next entry state

- Owner reviews draft PR #16 and squash-merges it if satisfied while preserving the required Sol provenance. Only after that merge is confirmed may the next durable session select S5 and begin the full A1–A14 hardening sweep.

---

## Entry S5.1 — Hardening starts from the merged demo loop

**Date:** 2026-07-18

**Recorded at:** 2026-07-18T21:12:30+01:00

**Phase:** S5

**Status:** Partial

**Model:** GPT-5.6 Sol — explicitly confirmed for the Premonition durable session

**Session ID:** 019f5f0f-a2dd-78e3-a5b3-413860708eab — Premonition durable session

### Objective

Verify the owner-confirmed PR #16 squash merge, restore a clean merged `main`, and establish the bounded S5 issue, branch and evidence-first implementation plan without beginning release publication or S6.

### Completed

- Verified PR #16 was squash merged at 2026-07-18T19:33:04Z as `44a541114b5a2be69567688536b2696651eb7823`.
- Confirmed the squash commit retained both issue #15 commit narratives and their required S4.2/S4.3 Sol trailers.
- Fast-forwarded local `main` to the verified squash commit and confirmed it is clean and identical to `origin/main`.
- Re-ran paired-log and provenance validation successfully on merged `main`.
- Closed completed issue #15.
- Created issue #17, `S5: harden and prepare release-ready evidence`, with the full A1–A14, security/privacy, documentation, distribution-tooling and owner-credential boundaries.
- Created `codex/issue-17-release-hardening` from clean merged `main`.
- Added `docs/build-week/s5-implementation-plan.md`, ordering acceptance evidence, final review, repository documentation, release tooling and owner-assisted signing without any publication authority.

### Decisions and provenance

- **Owner decision:** PR #16 is merged; continue from the completed S4 boundary.
- **Sol implemented:** Merge/provenance verification, safe local transition, issue #17, S5 branch and implementation plan.
- **Sol reviewed:** Earliest-incomplete-phase selection, S5 exit criteria, missing repository/release surfaces, owner-credential gate and the prohibition on S6/public action.
- **Human-authored and Sol-reviewed:** None.

### Artefacts

- Squash commit `44a541114b5a2be69567688536b2696651eb7823` — merged issue #15 implementation with retained S4 provenance.
- GitHub issue #17 — bounded S5 objective, scope, acceptance criteria and exclusions.
- `codex/issue-17-release-hardening` — S5 implementation branch.
- `docs/build-week/s5-implementation-plan.md` — owner-reviewable S5 work order and stop gates.

### Verification

- GitHub PR inspection — PR #16 was closed and merged; head `689ca9b`, squash `44a5411`.
- Squash commit inspection — S4.2 and S4.3 model, session, phase and BUILDLOG trailers retained.
- `git fsck --no-dangling` — completed without findings after the narrow fetch.
- `python3 scripts/check_buildlog.py BUILDLOG.md --devlog DEVLOG.md` — 36 paired entries valid on merged `main`.
- `python3 scripts/check-provenance.py` — provenance record complete on merged `main`.
- Local `main` and `origin/main` — identical at `44a541114b5a2be69567688536b2696651eb7823` before branch creation.

### Deviations

- The first full `git fetch --prune origin` was interrupted when `rev-list` received signal 10 and did not update the remote ref. A narrow `git fetch origin main` then completed; object integrity, the squash commit and clean branch topology were verified before fast-forwarding.

### Risks and missing evidence

- `README.md`, `SECURITY.md`, `CHANGELOG.md`, signing/notarisation scripts, release verification and the prepared Homebrew surface do not yet exist.
- `docs/architecture.md` and `docs/threat-model.md` still contain older S1/S2 phase-boundary prose and require an S5 truth pass.
- Signing identity and notary profile availability have not been inspected or supplied; no signed/notarised artifact is claimed.
- No S5 runtime, documentation or release-tooling implementation has started beyond the durable plan.

### Next entry state

- Create the A1–A14 acceptance register, run the baseline deterministic suite and inspect the build machine's signing/notary/Homebrew capabilities without exposing credentials. Use those results to separate implementable S5 work from the explicit owner-assisted release gate.

---

## Entry S5.2 — Release evidence is separated from release hope

**Date:** 2026-07-18

**Recorded at:** 2026-07-18T21:17:20+01:00

**Phase:** S5

**Status:** Partial

**Model:** GPT-5.6 Sol — explicitly confirmed for the Premonition durable session

**Session ID:** 019f5f0f-a2dd-78e3-a5b3-413860708eab — Premonition durable session

### Objective

Create the evidence-first A1–A14 register, establish the current deterministic baseline and inspect distribution capabilities without exposing credentials or attempting signing, notarisation or publication.

### Completed

- Added `docs/build-week/s5-acceptance-register.md` with separate current automated, recorded live, owner-observed, pending and blocked evidence classes for every A1–A14 scenario.
- Recorded that A2 lacks the full §10 negative corpus and normal-workday zero-egress simulation; A1 live execution is opt-in and was not exercised by the ordinary baseline; current A10 and A14 reruns remain open.
- Identified explicit acceptance-mapping gaps for A3, A4, A8 and A13 despite their existing behavioural test coverage.
- Ran the merged S4 baseline from a fresh stable `/tmp` snapshot: 51 Swift tests and the repository wrapper passed.
- Confirmed Xcode 26.6, `notarytool` 1.1.2, `stapler`, Homebrew 6.0.11 and Homebrew `audit`/`style` are available.
- Confirmed the machine currently has zero valid code-signing identities; no identity name or notary profile was inferred.
- Inspected `/Applications/Premonition.app` as an ad hoc/linker-signed development artifact with no Team ID or bundle-bound Info.plist; Gatekeeper did not accept it as a distribution artifact.

### Decisions and provenance

- **Owner decision:** None beyond the previously recorded instruction to continue after the S4 merge.
- **Sol implemented:** Acceptance/evidence register and read-only machine/distribution capability audit.
- **Sol reviewed:** Existing A1–A14 evidence strength, skipped-live-test semantics, current distribution readiness and the owner credential boundary.
- **Human-authored and Sol-reviewed:** None.

### Artefacts

- `docs/build-week/s5-acceptance-register.md` — current acceptance matrix, capability baseline, blockers and publication boundary.
- Stable snapshot `/tmp/Premonition-s5-baseline.4YGexg` — S5 baseline verification copy; not a release artifact.

### Verification

- Stable snapshot `swift test` — 51 tests passed; the opt-in A1 body returned immediately because `PREMONITION_LIVE_CODEX` was unset.
- Stable snapshot `scripts/test.sh` — 51 Swift tests plus deterministic demo-repository and measurement-normalisation checks passed.
- `security find-identity -p codesigning -v` — zero valid identities found.
- `xcodebuild -version` — Xcode 26.6, build 17F113.
- `xcrun notarytool --version` — 1.1.2 (41); `xcrun stapler` exposed staple/validate commands.
- `brew --version` and command inspection — Homebrew 6.0.11-49-g3488a8c with `audit` and `style` available.
- `codesign -dvvv --entitlements :- /Applications/Premonition.app` — ad hoc/linker-signed arm64 executable, no Team ID, Info.plist not bound and no sealed resources.
- `spctl -a -vv /Applications/Premonition.app` — Code Signing subsystem error for the current unsigned development bundle; no Gatekeeper acceptance claimed.

### Deviations

- `codesign` and `spctl` do not expose the attempted GNU-style `--version` switches on this machine; their operational commands remain available and were used for the artifact inspection.

### Risks and missing evidence

- A valid `Developer ID Application` identity is not installed, so the signed/notarised S5 exit artifact is currently blocked on owner action.
- A `notarytool` Keychain profile name has not been supplied or inspected.
- Full A2/workday zero-egress evidence, current live A1/A10, isolated A14 and explicit A3/A4/A8/A13 acceptance coverage remain open.
- No release documentation or release scripts have been implemented yet.

### Next entry state

- Expand the deterministic acceptance suite and harness first: full A2/workday zero-egress, explicit A3/A4/A8/A13 mapping and safe A14 isolation. Then update the architecture/threat model and build the required README, SECURITY, CHANGELOG and release scripts while the signing credential gate remains open.

---

## Entry S5.3 — Every non-credential release gate is closed

**Date:** 2026-07-18

**Recorded at:** 2026-07-18T22:57:17+01:00

**Phase:** S5

**Status:** Partial — ready at the owner signing/notarisation gate

**Model:** GPT-5.6 Sol — explicitly confirmed for the Premonition durable session

**Session ID:** 019f5f0f-a2dd-78e3-a5b3-413860708eab — Premonition durable session

### Objective

Complete every S5 hardening, acceptance, documentation and release-preparation task that does not require the absent owner signing identity, notary profile or signed artifact, while preserving the no-publication and no-S6 boundaries.

### Completed

- Expanded the current acceptance suite from 51 to 55 tests: a twenty-shape A2 negative corpus plus 96-item normal-workday zero-egress simulation; deep-fixture Low-to-Medium A3; explicit A4; cap/no-extra-egress A5; post-presentation tracked/untracked A8; held-fix/dedup-expiry A13; and isolated mode-`0600` first-run A14.
- Ran current live A1 twice on Codex CLI 0.144.6. The first call produced a validated, non-mutating patch in 17.907 seconds; the deliberate repeat produced no applicable patch in 24.871 seconds. Both outcomes remain recorded without a correctness or determinism claim.
- Re-ran A10 without inspecting historic session names or content. The bounded repeat left the aggregate session-file count at 310 before/after; an earlier 309-to-310 observation during the active desktop task is explicitly inconclusive. Key-only local inspection found only owner-mode config, state and content-free verdict schemas.
- Completed the final Sol security/privacy/accessibility review. It found and resolved one lifecycle defect: the optional rationale task could outlive Pause or a terminal review action. `PresentationModel` now owns and cancels rationale work whenever its candidate is released.
- Rewrote `docs/architecture.md` and `docs/threat-model.md` to describe the actual S4/S5 product and retained residual risks rather than obsolete S1/S2 future boundaries.
- Added the complete README front door, SECURITY policy and unreleased CHANGELOG, including the privacy constitution verbatim, exact egress/apply contracts, warnings, offline demo, Sol runtime/build provenance, dated prior/new boundary and roadmap-only MCP/direct API note.
- Added fail-fast signing/notarisation and independent release-verification scripts. Missing identity/profile inputs stop before output creation; signed mode requires Developer ID, Gatekeeper and staple verification, while unsigned-local mode verifies only development bundle structure and resources.
- Added a prepared Homebrew cask with conspicuous unresolved release URL/checksum placeholders. Ruby syntax and Homebrew style pass; audit and publication remain gated on the real verified archive.
- Updated the A1–A14 register, Codex contract and S5 plan. No signing, notarisation, GitHub release, artifact upload, Homebrew publication, Sites work, submission or external promotion occurred.

### Decisions and provenance

- **Owner decision:** Complete everything except the hard-blocking items.
- **Sol implemented:** Acceptance expansion, isolated test seams, rationale lifecycle repair, repository front door, current architecture/threat model, security review, release scripts and prepared Homebrew cask.
- **Sol reviewed:** C1–C5/§13 ordering, current live variability, persistence boundary, cancellation, Apply, accessibility, misleading copy, release fail-fast behaviour and credential/publication stop gates.
- **Human-authored and Sol-reviewed:** None.

### Artefacts

- `Sources/PremonitionApp/PresentationModel.swift` — injected isolated configuration/pasteboard seams and candidate-owned rationale cancellation.
- `Tests/AcceptanceTests/SafetyCoreAcceptanceTests.swift`, `Tests/PremonitionCoreTests/S2ExecutorTests.swift` and `Tests/PremonitionAppTests/MonitoringPresentationTests.swift` — current A2–A5, A8, A13 and A14 evidence.
- `README.md`, `SECURITY.md`, `CHANGELOG.md` — truthful repository and release front door.
- `docs/architecture.md`, `docs/threat-model.md`, `docs/codex-contract.md` — current runtime and live-contract documentation.
- `docs/build-week/s5-acceptance-register.md`, `s5-sol-review.md` and `s5-implementation-plan.md` — final non-credential evidence, findings and gate status.
- `scripts/sign-and-notarise.sh`, `scripts/verify-release.sh`, `scripts/test-release-tools.sh` and `packaging/homebrew/premonition.rb` — unpublished release preparation.
- Stable working snapshot `/tmp/Premonition-s5-work.ry9Ri4` — verification copy, not a release artifact.

### Verification

- Stable snapshot `swift test` — 55 tests passed, including the named current A2–A14 deterministic coverage.
- Stable snapshot `scripts/test.sh` — 55 Swift tests, deterministic demo-repository, measurement-normalisation and release-tool contracts passed.
- `PREMONITION_LIVE_CODEX=1 swift test --filter a1HeadlessRealSol` — first call passed in 17.907 seconds; deliberate repeat did not produce an applicable patch in 24.871 seconds.
- Aggregate Codex session-file count — 310 immediately before and after the repeat ephemeral call; no historic names/content inspected.
- Premonition Application Support key-only audit — only `config.json`, `state.json`, `verdicts.jsonl`; all mode `0600`; permitted keys only.
- Stable snapshot `scripts/build-app.sh release` — built `/tmp/Premonition-s5-work.ry9Ri4/dist/Premonition.app`.
- Stable snapshot `scripts/verify-release.sh --unsigned-local dist/Premonition.app` — v0.1.0 bundle identity, macOS 14 floor, LSUIElement, executable and fixture resources passed.
- Stable snapshot `script/build_and_run.sh --verify` — rebuilt app launched and remained running.
- README front-door audit — passed with no placeholder or missing-local-path failure.
- `scripts/test-release-tools.sh` — shell/Ruby syntax, missing-input fail-fast/no-output and cask placeholder contracts passed.
- `brew style packaging/homebrew/premonition.rb` — one file inspected, no offences.
- Stable-copy `python3 scripts/check_buildlog.py BUILDLOG.md --devlog DEVLOG.md` — 39 BUILDLOG and 39 DEVLOG entries valid.
- Temporary local-history clone `python3 scripts/check-provenance.py` — provenance record complete against merged `44a5411` history and the current ledger/logs.
- `git diff --check` — passed after representing blank diff context without source trailing whitespace.

### Deviations

- The managed workspace's nested SwiftPM sandbox could not write its usual module cache or apply `sandbox-exec`; exact test/build commands were therefore run from the stable `/tmp` snapshot with explicit temporary module-cache paths and the approved normal macOS execution boundary.
- The workspace provider also stalled historical `git show` reads inside the provenance checker. A temporary filtered clone of the same `origin/main` history received only the current checker, ledger and paired logs, and the unchanged checker completed there; no repository history was rewritten.
- The first A10 aggregate count changed from 309 to 310 while this Codex desktop task was active. Because the source could not be attributed without inspecting session names, it is preserved as inconclusive; the deliberate repeat then held 310-to-310.
- Homebrew's first style run installed its own RuboCop dependency and reported stanza/sigil formatting only. Those offences were corrected manually; the final style run is clean.

### Risks and missing evidence

- `security find-identity` still reports zero valid identities. A `Developer ID Application` identity must be installed by the owner.
- No owner-confirmed `notarytool` Keychain profile name exists in this session.
- Therefore no signed, notarised or stapled judge artifact exists; signed release verification, final cask URL/checksum/audit and installed owner release review remain blocked.
- Live Sol output remains probabilistic: one current pass and one current non-applicable result are both factual evidence.
- No public or submission action has started.

### Next entry state

- Package the completed non-credential work into the issue #17 commit and draft PR for owner review. When the owner later installs/confirms the Developer ID identity and notary profile, run `scripts/sign-and-notarise.sh`, independently run signed `scripts/verify-release.sh`, derive the real cask URL/checksum, run Homebrew audit and present the installed candidate for owner review. Do not publish or begin S6 without separate authority.

---

## Entry S5.4 — Non-credential S5 work is in owner review

**Date:** 2026-07-19

**Recorded at:** 2026-07-19T07:37:02+01:00

**Phase:** S5

**Status:** Partial — draft PR open; owner signing/notarisation gate remains

**Model:** GPT-5.6 Sol — explicitly confirmed for the Premonition durable session

**Session ID:** 019f5f0f-a2dd-78e3-a5b3-413860708eab — Premonition durable session

### Objective

Package the completed non-credential issue #17 work into a provenance-bearing commit and draft pull request for owner review without signing, notarising, publishing, merging or beginning S6.

### Completed

- Reauthenticated GitHub CLI through the owner's macOS keychain after the prior saved tokens had expired.
- Reviewed and explicitly staged only the twenty-one issue #17 S5 files; removed six Markdown hard-break spaces found by the staged whitespace gate.
- Committed the implementation as `d0976541afabbf0420678c14464ec31ca78992c2` with the required issue, model, session, phase and S5.3 BUILDLOG provenance.
- Pushed `codex/issue-17-release-hardening` and opened draft pull request [#18](https://github.com/tcballard/Premonition/pull/18) against `main`.
- Marked only the draft-PR item complete in the S5 plan. Signing inputs, signed artifact and installed release-candidate review remain open.

### Decisions and provenance

- **Owner decision:** Continue after completing GitHub device authorisation and package every non-hard-blocked S5 item for review.
- **Sol implemented:** Explicit staging, provenance-bearing commit, branch push, complete draft-PR review contract and paired handoff records.
- **Sol reviewed:** Issue #17 scope, commit identity and trailers, draft status, S5 stop boundary and unchanged signing/publication blockers.
- **Human-authored and Sol-reviewed:** None.

### Artefacts

- Commit `d0976541afabbf0420678c14464ec31ca78992c2` — complete non-credential S5 hardening implementation.
- Draft pull request [#18](https://github.com/tcballard/Premonition/pull/18) — owner review surface for issue #17.
- `docs/build-week/s5-implementation-plan.md` — draft-PR checkpoint complete; credential and release-review gates still open.

### Verification

- `git diff --cached --check` — passed after the six formatting-only Markdown spaces were removed.
- Commit identity check — author and committer were both `Tom Ballard <tom@armytage.co>`.
- Commit-message inspection — `Co-developed-with`, `Sol-Session`, `Sol-Phase` and `Build-Log-Entry: S5.3` were present.
- `git push -u origin codex/issue-17-release-hardening` — created the remote review branch at `d097654`.
- GitHub draft PR inspection — PR #18 is open and draft, targets `main`, uses the issue #17 branch and contains one commit with twenty-one changed files.
- Independent filtered clone of the pushed branch — paired-log validation reported 39 BUILDLOG and 39 DEVLOG entries valid, and the unchanged provenance checker reported the record complete before this append.

### Deviations

- The managed workspace could not read the refreshed macOS keychain and continued to report the old invalid GitHub token. Authentication was confirmed through the native keychain boundary before any remote mutation.
- The workspace file provider again stalled a historical provenance read. The checker was rerun unchanged against an independent filtered clone of the pushed branch instead of treating the provider stall as a product failure.

### Risks and missing evidence

- This Mac still has zero valid Developer ID identities and the session still has no owner-confirmed `notarytool` profile.
- No signed, notarised or stapled judge artifact exists. Final cask metadata/audit and installed release-candidate review remain blocked.
- Draft PR #18 is unmerged. No release, publication, submission, Sites work, promotion or S6 work has started.

### Next entry state

- Owner reviews draft PR #18. Resolve any requested changes on the issue branch. When the owner later supplies the signing identity and notary profile, produce and independently verify the signed candidate, complete the cask evidence and present the installed artifact for review. Do not merge, publish or begin S6 without the corresponding owner decision.

---

## Entry S5.5 — The hardening merge is complete; S5 is not

**Date:** 2026-07-19

**Recorded at:** 2026-07-19T09:05:05+01:00

**Phase:** S5

**Status:** Partial — non-credential hardening merged; signed-artifact gates remain

**Model:** GPT-5.6 Sol — explicitly confirmed for the Premonition durable session

**Session ID:** 019f5f0f-a2dd-78e3-a5b3-413860708eab — Premonition durable session

### Objective

Verify the owner-confirmed PR #18 merge, preserve its Sol provenance, restore a trustworthy local merged baseline and keep issue #17 open for the remaining credential-assisted S5 work.

### Completed

- Verified pull request [#18](https://github.com/tcballard/Premonition/pull/18) was squash merged at 2026-07-19T07:36:32Z as `d922b109a74055fdfc8d35f5bac65af8bb92e099`.
- Confirmed the squash message retained both issue #17 commit narratives and their required S5.3/S5.4 model, session, phase and BUILDLOG trailers.
- Recovered local `main` from two File Provider `mmap` cancellations by applying the exact PR patch to the verified clean parent and advancing the reference only after the resulting tree hash matched `origin/main` byte-for-byte.
- Confirmed local `main` and `origin/main` both identify `d922b10` and the primary checkout is left on protected `main` without a local commit or push.
- Confirmed issue #17 remains open because its signed, notarised, stapled and installed-owner-review criteria are not complete.
- Created `codex/issue-17-release-completion` from the verified squash commit for the remaining S5 checkpoint and later credential-assisted work.

### Decisions and provenance

- **Owner decision:** PR #18 was merged.
- **Sol implemented:** Merge/provenance verification, exact-tree local recovery and the issue #17 continuation branch/checkpoint.
- **Sol reviewed:** Retained squash provenance, S5 completion criteria, protected-branch safety and the continued prohibition on release, publication and S6.
- **Human-authored and Sol-reviewed:** None.

### Artefacts

- Squash commit `d922b109a74055fdfc8d35f5bac65af8bb92e099` — merged non-credential S5 implementation and handoff records.
- `codex/issue-17-release-completion` — continuation branch for this checkpoint and the remaining S5 gates.
- GitHub issue #17 — still-open authority for the credential-assisted signed-artifact work.

### Verification

- GitHub PR inspection — PR #18 is closed and merged; head `01fcfbb`, squash `d922b10`.
- Squash commit inspection — retained both material commit messages and the S5.3/S5.4 Sol provenance trailers.
- Recovery tree comparison — reconstructed index tree `b992804b0f26f660108c98f01e38873bac90f510` exactly matched `origin/main^{tree}` before the local reference advanced.
- Local reference check — `HEAD` and `origin/main` both returned `d922b109a74055fdfc8d35f5bac65af8bb92e099` after recovery.
- Independent merged-main check — paired logs reported 40 BUILDLOG and 40 DEVLOG entries valid; the unchanged provenance checker reported the record complete.
- GitHub issue inspection — issue #17 remains open with its original signed-artifact acceptance criteria.

### Deviations

- Two ordinary `git merge --ff-only origin/main` attempts were cancelled by the managed workspace File Provider while mapping repository data, leaving only partial worktree writes. The pre-operation branch was proven clean. Each partial write was restored, and the final recovery used the exact verified PR patch plus a full Git tree-hash equality gate; no repository history was rewritten.
- The File Provider also stalled the continuation branch HEAD update in the primary checkout. The protected checkout was left clean on merged `main`, and this checkpoint was prepared from the independently verified local clone on the same continuation branch.

### Risks and missing evidence

- No valid Developer ID identity or owner-confirmed `notarytool` profile is available in the recorded environment.
- No signed, notarised or stapled judge artifact exists. Final cask URL/checksum/audit and installed release-candidate owner review remain open.
- No GitHub release, artifact upload, Homebrew publication, Sites work, submission, promotion or S6 work has started.

### Next entry state

- Keep issue #17 and S5 active. When the owner supplies or confirms the Developer ID identity and `notarytool` profile, run the fail-fast signing/notarisation path, independently verify the signed archive, derive and audit the real cask metadata, install the exact artifact for owner review and record the evidence. Do not publish or begin S6 without separate authority.

---

## Entry S5.6 — The explainer has a reviewable shape, not a public URL

**Date:** 2026-07-19

**Recorded at:** 2026-07-19T15:41:54+01:00

**Phase:** S5

**Status:** Partial — owner-authorised submission collateral prepared while signed-artifact gates remain

**Model:** GPT-5.6 Sol — explicitly confirmed for the Premonition durable session

**Session ID:** 019f5f0f-a2dd-78e3-a5b3-413860708eab — Premonition durable session

### Objective

Use the previously deferred Sites handoff to prepare a truthful, authored explainer for local and saved-version review while S5 is credential-blocked, without deploying, publishing, promoting, changing runtime scope or marking S6 started.

### Completed

- Created issue [#20](https://github.com/tcballard/Premonition/issues/20) with an explicit local/private preview boundary and testable content, design, responsive and accessibility acceptance criteria.
- Implemented a single-page field guide under `site/` with the product promise, admission loop, safety spine, exact privacy constitution, Sol's runtime/build roles, provenance links and demo cues.
- Used an authored dark field-guide composition rather than a generic SaaS surface, with the eye/dial family as its functional signature and no external fonts or image dependencies.
- Kept the release state honest: the page says signed verification is pending and provides no invented download, release or deployment URL.
- Created the Sites project once, pushed an exact standalone source commit `dfadbb35a6f4ee5e52c9d944b624fe85e5c592bf` and saved undeployed Sites version 1.
- Confirmed the project has neither a live URL nor a preview URL. No deployment, access-policy expansion, domain work, publication, submission or promotion occurred.
- Added the append-only provenance exception for PR #19 after its GitHub squash commit was found to have stripped the already-verified S5.5 source trailers.
- Pushed `codex/issue-20-sites-explainer-preview` and opened draft pull request [#21](https://github.com/tcballard/Premonition/pull/21) for owner review without enabling merge or changing the Sites deployment state.

### Decisions and provenance

- **Owner decision:** Work on the deferred Sites explainer in the meantime after asking what follows the remaining S5 gates.
- **Sol implemented:** Evidence-grounded copy, authored responsive presentation, functional loop-stage instrument, source/build checks, browser review, Sites source provenance and the undeployed version checkpoint.
- **Sol reviewed:** S5/S6 boundary, product claims, privacy constitution, correctness limits, release-status language, responsive layout, semantics, focus treatment and reduced-motion fallback.
- **Human-authored and Sol-reviewed:** The owner-authored handoff in `docs/build-week/sites-explainer-handoff.md` supplied the purpose, constraints and suggested information architecture.

### Artefacts

- `site/` — source, verification script, deterministic build adapter and private-review instructions.
- Sites project `appgprj_6a5cd9f4fb4c8191a7825271e3b82970` — active but undeployed.
- Sites version 1 — source commit `dfadbb35a6f4ee5e52c9d944b624fe85e5c592bf`; no live or preview URL.
- GitHub issue [#20](https://github.com/tcballard/Premonition/issues/20) — authority and review boundary for the explainer preparation.
- Draft pull request [#21](https://github.com/tcballard/Premonition/pull/21) — review surface for the source, checks and provenance records.
- `docs/build-week/provenance-exceptions.md` — exact PR #19 squash/source linkage preserving the already-recorded S5.5 provenance without rewriting `main`.

### Verification

- `npm run verify` — required claims, semantic landmarks, skip link, visible focus, responsive breakpoints, reduced-motion treatment and functional loop observer passed.
- `npm run build` — Vite 7.3.6 produced the client assets and the deterministic Sites worker entrypoint.
- In-app browser review at 1440 × 1000, 820 × 1024 and 390 × 844 — no horizontal overflow; hierarchy, instrument and provenance surfaces remained coherent.
- Browser DOM snapshot — named header/main/section/footer landmarks, headings, lists, navigation and current-stage live region were exposed; the skip link received a visible 2 px focus outline.
- Browser console inspection — no warnings or errors.
- Standalone Sites source rebuild — `npm ci`, `npm run verify` and `npm run build` passed from the exact committed source; author and committer were both `Tom Ballard <tom@armytage.co>`.
- Sites inspection — latest version number is 1; `current_live_url` and `current_preview_url` are both null.
- Repository `scripts/test.sh` — all 55 Swift tests plus deterministic demo-repository, measurement-normalisation and release-tool contracts passed.
- `scripts/build-app.sh release` — the unchanged macOS product built successfully at `dist/Premonition.app`.
- GitHub PR #19 inspection — source `427c99284864ba4b8d20cf968ef06f32f11478f4` carried the required S5.5 trailers; squash `6fc8066b93c951c71d2c042c62ba4d0887aea8ed` retained only the title, and the exact append-only exception restored a complete checker result.
- GitHub draft-PR inspection — PR #21 targets `main`, contains only the issue #20 branch and remains unmerged.

### Deviations

- The managed sandbox could not resolve the Sites Git host, so the exact source push used the approved network boundary with a short-lived per-command credential that was neither printed nor persisted.
- The first repository test attempt could not write SwiftPM's default module cache. The unchanged prescribed test and release-build commands passed after using explicit temporary module-cache paths at the approved normal macOS execution boundary.
- Uploading the optional prebuilt archive was unavailable in the current Sites file-upload path. The version was therefore saved from the exact pushed source commit without an archive; no deployment or production build was attempted.
- The in-app browser's synthetic Tab key did not advance from the page body, so focus visibility was verified by focusing the unique skip-link locator and inspecting its computed outline. Source checks cover the shared `:focus-visible` rule; a final real-browser keyboard pass remains appropriate before any deployment.

### Risks and missing evidence

- S5 is still incomplete: there is no Developer ID identity, confirmed notary profile, signed/stapled artifact, final cask evidence or installed release-candidate owner approval.
- The explainer is reviewable source and an undeployed Sites version, not a production page. Responsive and semantic evidence is current, but public routing, production build behaviour and external-link checks have not been exercised.
- S6 is not marked started or complete. The demo video, final submission copy, release/download routes and any public Sites deployment remain future owner-gated work.

### Next entry state

- Review issue #20 and draft PR #21. Keep Sites version 1 undeployed. Finish the credential-assisted S5 release gates when inputs become available; only after the app, README, demo, provenance logs and release evidence are stable should the owner decide whether to deploy the explainer and proceed through the remaining S6 submission work.

---

## Entry S5.7 — The field guide is deployed for owner review

**Date:** 2026-07-19

**Recorded at:** 2026-07-19T16:27:03+01:00

**Phase:** S5

**Status:** Partial — owner-only review deployment live; requested custom domain awaits DNS

**Model:** GPT-5.6 Sol — explicitly confirmed for the Premonition durable session

**Session ID:** 019f5f0f-a2dd-78e3-a5b3-413860708eab — Premonition durable session

### Objective

Act on the owner's explicit decision to deploy the saved explainer for review, preserve owner-only access, attach `premonition.tcballard.dev` if supported and record the production boundary without making the page public or changing app/runtime scope.

### Completed

- Confirmed the Sites project remained in custom access mode with one allowed user and no allowed groups before deployment.
- Deployed saved Sites version 1 through the verified owner-only path. The deployment completed successfully at `https://premonition-field-guide.tom-ballard08574345.chatgpt.site`.
- Attached `premonition.tcballard.dev` to the Sites project. Sites accepted the hostname and returned the required CNAME plus two TXT validation records.
- Confirmed public DNS does not yet contain the requested CNAME or validation records, so the custom hostname remains pending and its certificate is still initialising.
- Opened the deployed URL in the in-app browser. The owner-only Sign in with ChatGPT gate loaded successfully and was left open for the owner to continue.
- Preserved the existing custom access policy. No public-access change, release publication, submission, external promotion or Premonition runtime change occurred.

### Decisions and provenance

- **Owner decision:** Deploy the explainer for review and use `premonition.tcballard.dev` if possible.
- **Sol implemented:** Owner-only Sites deployment, deployment-status monitoring, custom-hostname attachment, DNS inspection and the browser review handoff.
- **Sol reviewed:** The production nature of every Sites URL, owner-only access policy, explicit-publication boundary, domain validation state and unchanged S5/S6/runtime gates.
- **Human-authored and Sol-reviewed:** The requested `premonition.tcballard.dev` hostname.

### Artefacts

- Owner-only review URL: `https://premonition-field-guide.tom-ballard08574345.chatgpt.site`.
- Requested custom hostname: `premonition.tcballard.dev` — attached, pending DNS validation.
- Sites version 1 — unchanged exact source commit `dfadbb35a6f4ee5e52c9d944b624fe85e5c592bf`.
- Draft pull request [#21](https://github.com/tcballard/Premonition/pull/21) — source and provenance review surface.

### Verification

- Sites access inspection — custom mode, one allowed user, zero allowed groups.
- Sites deployment status — progressed from pending through building and publishing to succeeded.
- Sites custom-domain response — hostname accepted; provider pending; SSL initialising; no provider error.
- Read-only DNS lookup — no CNAME or required TXT validation records currently resolve for `premonition.tcballard.dev`.
- In-app browser DOM inspection — the deployed owner-only URL returned the Sign in with ChatGPT review gate rather than an error page.

### Deviations

- Entry S5.6 deliberately kept Sites version 1 undeployed under the earlier handoff. The owner explicitly superseded that stop for an owner-only review deployment in this session; it does not authorise public access, promotion or submission.
- The custom domain cannot become active from Sites alone. DNS records must be added at the authoritative provider before Sites can validate the hostname and issue its certificate.
- Deployed page content remains behind the owner authentication gate. The deployment endpoint is proven reachable, but the final rendered page still needs the owner's signed-in review.

### Risks and missing evidence

- Every Sites deployment URL is production even though access is owner-only. The page must not be described as public or externally reviewable.
- `premonition.tcballard.dev` is not active yet; DNS and certificate validation remain incomplete.
- The final signed macOS artifact and the rest of S5 remain blocked on the Developer ID identity and notary profile. S6 is not marked complete.

### Next entry state

- The owner continues through the already-open Sign in with ChatGPT gate and reviews the deployed page. Add the supplied CNAME and TXT records at the authoritative DNS provider, then refresh Sites validation and verify the custom hostname and rendered page. Treat any public-access change, external promotion, release or submission as a separate explicit owner decision.

---

## Entry S5.8 — The explainer now scans like one instrument

**Date:** 2026-07-19

**Recorded at:** 2026-07-19T19:01:12+01:00

**Phase:** S5

**Status:** Partial — simplified owner-only version deployed; owner review and custom-domain DNS remain

**Model:** GPT-5.6 Sol — explicitly confirmed for the Premonition durable session

**Session ID:** 019f5f0f-a2dd-78e3-a5b3-413860708eab — Premonition durable session

### Objective

Respond to the owner's review that the explainer needed rework by using the installed tcballard Codex Toolkit to make it materially simpler: one concise page, one visual idea and one fast reading path, without weakening Premonition's claims or changing the owner-only deployment boundary.

### Completed

- Applied the Toolkit's `authored-frontend-design` direction and replaced the six-part scrolling field guide with one compact instrument plate containing three sections: promise/instrument, bounded loop and safety contract.
- Removed the sticky stage navigator, scroll-driven stage observer, separate safety ledger, duplicated provenance cards, demo list and oversized closing section.
- Retained the functional eye/admission dial as the single signature element and reduced its script to the forty-eight semantic dial ticks only.
- Compressed the full seven-stage pipeline into one scan-friendly rail while preserving gate, allowlist, cap, read-only Sol, validation, single candidate and explicit human-decision boundaries.
- Preserved the privacy constitution verbatim, the applicability-not-correctness limit, the no-provider-retention claim and the four direct provenance links.
- Updated the source contract so simplicity is testable: exactly three sections, one functional dial, representative responsive transformations, semantic landmarks, focus treatment and reduced-motion support.
- Saved Sites version 2 from exact source commit `f5541358ae895efe26fa18dfacdd48dd758817e3` and successfully updated the existing owner-only deployment at `https://premonition-field-guide.tom-ballard08574345.chatgpt.site`.
- Kept custom access at one allowed user and zero groups. No public-access, runtime, release, submission or promotion change occurred.

### Decisions and provenance

- **Owner decision:** Rework the site into a simpler single-page experience using the tcballard Codex Toolkit.
- **Sol implemented:** Information-architecture reduction, authored instrument-plate composition, responsive transformations, contract updates, visual/accessibility verification, exact Sites source version and owner-only redeployment.
- **Sol reviewed:** C1–C5/§13 claims, privacy language, applicability limit, Sol roles, release-status honesty, reduced-motion fallback and unchanged public/runtime boundaries.
- **Human-authored and Sol-reviewed:** The explicit request for a simpler single-page experience and use of the owner's Toolkit plugin.

### Artefacts

- `site/index.html` — three-section single-page information architecture.
- `site/src/style.css` — restrained instrument-plate system and responsive transformations.
- `site/src/main.js` — dial-only enhancement with no scroll-state machinery.
- `site/scripts/verify-site.mjs` — concise-page and invariant contract.
- Sites version 2 — exact source commit `f5541358ae895efe26fa18dfacdd48dd758817e3`.
- Draft pull request [#21](https://github.com/tcballard/Premonition/pull/21) — owner review surface.

### Verification

- `npm --prefix site run verify` — required claims, three-section limit, semantic landmarks, focus, reduced motion, breakpoints and functional dial passed.
- `npm --prefix site run build` — Vite 7.3.6 produced a 5.96 kB HTML entry, 10.37 kB CSS asset and 0.92 kB JavaScript asset before compression.
- Exact standalone source rebuild — `npm ci`, `npm run verify` and `npm run build` passed from commit `f5541358` with Tom Ballard as author and committer.
- In-app browser at 1440 × 1000 — document height 1,684 px instead of the previous 7,221 px baseline; three sections and no horizontal overflow.
- In-app browser at 820 × 1024 and 390 × 844 — hierarchy transformed without horizontal overflow; mobile retained visible Source and review actions.
- Browser DOM inspection — one H1, two H2 headings, ordered seven-stage list, definition-list contract, named footer navigation and unique skip link exposed in reading order.
- Focus inspection — skip link showed a 2 px focus outline with 4 px offset; browser console inspection returned no warnings or errors.
- Sites access/version inspection — custom access remained one user and zero groups; version 2 identified exact source commit `f5541358`.
- Sites deployment status — version 2 progressed to succeeded at the unchanged owner-only URL.
- Production browser inspection — the endpoint returned the expected Sign in with ChatGPT gate without console errors.

### Deviations

- The first private Sites source pushes waited for the managed network approval and did not start before its deadline. A fresh short-lived credential and the already-approved Git push path completed the exact source update; no credential was persisted.
- Production content remains behind the owner authentication gate. Local visual evidence covers the rendered source at three breakpoints; the owner must still sign in to inspect version 2 through Sites.
- The app regression suite was not rerun because the commit changes only static submission collateral and its paired provenance records; the site-specific source/build/browser checks are the proportionate verification surface.

### Risks and missing evidence

- The simplified page is deployed but not yet owner-accepted. Copy density and the exact balance between the hero instrument and safety contract remain review judgments.
- `premonition.tcballard.dev` remains attached but pending its previously supplied DNS records and certificate validation.
- S5's signed macOS artifact remains blocked on the Developer ID identity and notary profile. S6 is not complete and public access remains unauthorised.

### Next entry state

- The owner signs in to the already-open version 2 review URL and judges the simplified page. Resolve any concrete copy or composition feedback on PR #21. When DNS records are available, refresh and verify `premonition.tcballard.dev`; keep public access, release, promotion and submission behind separate explicit decisions.

---

## Entry S5.9 — The README now points to the review door

**Date:** 2026-07-19

**Recorded at:** 2026-07-19T21:05:58+01:00

**Phase:** S5

**Status:** Partial — owner-review URL discoverable; canonical domain and public access remain pending

**Model:** GPT-5.6 Sol — explicitly confirmed for the Premonition durable session

**Session ID:** 019f5f0f-a2dd-78e3-a5b3-413860708eab — Premonition durable session

### Objective

Add the deployed explainer URL to the repository front door without implying that the owner-only Sites deployment is public or that the pending custom hostname is active.

### Completed

- Added the working Sites URL immediately after the README's release-status paragraph, before the first substantive documentation section.
- Displayed the destination as a literal URL and labelled it `Owner-review explainer (ChatGPT sign-in required)`.
- Kept `premonition.tcballard.dev` out of the README while its DNS and certificate validation remain incomplete.
- Preserved every README section below the front-door boundary without reformatting or unrelated copy changes.

### Decisions and provenance

- **Owner decision:** Include the deployed explainer link in the README as a URL.
- **Sol implemented:** Narrow front-door link placement, access qualification and paired provenance checkpoint.
- **Sol reviewed:** Destination accuracy, owner-only access wording, release-status consistency and unchanged public/custom-domain boundary.
- **Human-authored and Sol-reviewed:** The request to expose the explainer as a URL.

### Artefacts

- `README.md` — qualified owner-review URL in the opening block.
- Draft pull request [#21](https://github.com/tcballard/Premonition/pull/21) — review surface for the README addition.

### Verification

- README front-door inspection — canonical product name, tagline, one explanatory paragraph, honest release status and one qualified explainer destination remain above `How the loop works`.
- External destination — the same owner-only URL previously reached the expected Sign in with ChatGPT gate in BUILDLOG S5.8.
- `git diff --check` — passed with only the intended front-door and provenance additions.
- Paired-log and provenance checkers — passed after the S5.9 commit.

### Deviations

- The Toolkit front-door audit helper is not present in this repository, so the opening block and external URL were checked manually with the repository's paired-log and provenance tooling.

### Risks and missing evidence

- Public README visitors will reach a ChatGPT sign-in gate and are not authorised viewers. The label makes that limitation explicit but does not make the explainer public.
- The generated Sites URL is not the intended long-term canonical destination. Replace it only after `premonition.tcballard.dev` is active and the owner confirms the access policy.
- S5 signing/notarisation and S6 completion remain unchanged.

### Next entry state

- Review the README and version 2 page through PR #21. After DNS validation and an explicit access decision, replace the generated owner-review URL with the canonical custom domain. Keep release, public promotion and submission separately owner-gated.

---

## Entry S5.10 — The judge artifact is signed and running

**Date:** 2026-07-19

**Recorded at:** 2026-07-19T22:17:35+01:00

**Phase:** S5

**Status:** Partial — signed installed candidate awaiting owner acceptance; no release published

**Model:** GPT-5.6 Sol — explicitly confirmed for the Premonition durable session

**Session ID:** 019f5f0f-a2dd-78e3-a5b3-413860708eab — Premonition durable session

### Objective

Use the now-available owner distribution toolchain to create, independently verify and install the signed v0.1.0 judge candidate without publishing a release or beginning S6.

### Completed

- Confirmed the valid `Developer ID Application` identity for team `R8HXTBY3NM` and authenticated the owner-created `Premonition` notarytool Keychain profile without reading or recording credential values.
- Ran the prescribed signing pipeline from a clean local issue #17 completion branch. Apple accepted notarisation submission `5aaf9cfe-b35a-4971-b18e-adece5eaa6ca`; the app was stapled, validated and accepted by Gatekeeper.
- Independently verified both `dist/release/Premonition.app` and a clean extraction of `Premonition-0.1.0.zip`. The final archive SHA-256 is `3d48e5b06342ce8bd11dddf0fa7f8b318e7273dd3e453177b6a2b47ef8d03178`.
- Replaced the unpublished Homebrew cask placeholders with the verified checksum and intended GitHub v0.1.0 release URL. Updated its contract test to reject placeholders and require release-shaped metadata.
- Installed the stapled candidate at `/Applications/Premonition.app`, reran the signed verifier against that installed copy and confirmed it remained running with Developer ID, team and staple metadata intact.
- Kept DNS work outside the current agenda at the owner's direction. No GitHub release, release-asset upload, Homebrew publication, public promotion or submission occurred.

### Decisions and provenance

- **Owner decision:** Use the general Mac distribution toolchain, store the notary profile as `Premonition`, ignore DNS work and continue the signed S5 path.
- **Sol implemented:** Credential validation, repository signing/notarisation pipeline execution, independent extracted-archive verification, prepared cask metadata, installed-candidate verification and this evidence checkpoint.
- **Sol reviewed:** S5/§13 boundaries, credential non-persistence, signed archive provenance, no-publication boundary and installed candidate trust state.
- **Human-authored and Sol-reviewed:** Owner-provided Apple credentials and Keychain configuration remained outside the repository and were not inspected.

### Artefacts

- Local `dist/release/Premonition.app` and `dist/release/Premonition-0.1.0.zip` — signed, notarised and stapled release outputs; ignored local artefacts, not committed or published.
- `/Applications/Premonition.app` — installed signed candidate for owner review.
- `packaging/homebrew/premonition.rb` and `scripts/test-release-tools.sh` — verified unpublished cask metadata and release contract.
- `docs/build-week/s5-acceptance-register.md` and `docs/build-week/s5-implementation-plan.md` — credential gates closed and installed review left open.

### Verification

- `xcrun notarytool history --keychain-profile Premonition` — authenticated successfully.
- `scripts/sign-and-notarise.sh dist/release` with explicit identity/profile environment names — production build, Developer ID signing, Apple submission/wait, accepted status, stapling, Gatekeeper and final ZIP creation passed.
- `scripts/verify-release.sh dist/release/Premonition.app` — signed bundle contract, Developer ID authority, Gatekeeper and staple checks passed.
- Clean ZIP extraction plus `scripts/verify-release.sh`, direct `spctl` and `stapler validate` — passed against the distributed copy.
- `shasum -a 256 dist/release/Premonition-0.1.0.zip` — `3d48e5b06342ce8bd11dddf0fa7f8b318e7273dd3e453177b6a2b47ef8d03178`; archive size 432 KB.
- `scripts/test-release-tools.sh`, `ruby -c` and `brew style` — passed; one cask inspected with no offences.
- `swift test` — 55 tests passed.
- `scripts/test.sh` — 55 tests plus deterministic demo repository, measurement normalisation and release-tool contracts passed.
- `scripts/build-app.sh release` and `script/build_and_run.sh --verify` — production bundle built and real app-bundle launch remained running.
- Installed `/Applications/Premonition.app` — signed verifier passed; `codesign` reports the intended Developer ID authority, team `R8HXTBY3NM`, secure timestamp and stapled ticket.

### Deviations

- `brew audit --cask --strict packaging/homebrew/premonition.rb` stopped before inspecting the cask because Homebrew now requires Xcode 27.0 while this Mac has Xcode 26.6. Syntax, release-contract and style checks pass, but no strict audit pass is claimed.
- The primary Documents workspace still cannot update Git references under the managed File Provider boundary, so the signed work uses the clean local `/tmp` clone already tied to issue #20 and refreshed from merged `main`; the new issue #17 completion branch begins at exact merged commit `e93f44b`.

### Risks and missing evidence

- The installed candidate has not yet received the owner's manual acceptance.
- Strict Homebrew audit remains unavailable until Xcode 27.0 is installed or the cask polish is explicitly deferred under the specification's cut order.
- The intended GitHub release URL does not exist because publication remains owner-gated. The archive is local only.
- S5 cannot close and S6 cannot begin until owner acceptance, final paired-log/ledger/provenance review and the issue #17 completion review path are complete.

### Next entry state

- Owner reviews the installed signed candidate from `/Applications/Premonition.app`. Record acceptance or concrete defects. If accepted, decide whether to update Xcode for the strict cask audit or explicitly defer that polish under the allowed cut order, then run the final paired-log, ledger and provenance checks and package the issue #17 completion branch into a draft PR. Do not publish or begin S6.

---

## Entry S5.11 — The installed candidate is owner-approved

**Date:** 2026-07-19

**Recorded at:** 2026-07-19T22:21:59+01:00

**Phase:** S5

**Status:** Partial — owner acceptance complete; strict cask audit deviation remains explicit

**Model:** GPT-5.6 Sol — explicitly confirmed for the Premonition durable session

**Session ID:** 019f5f0f-a2dd-78e3-a5b3-413860708eab — Premonition durable session

### Objective

Record the owner's acceptance of the installed signed candidate and package the credential-assisted S5 completion work for review without merging or publishing it.

### Completed

- Received explicit owner approval for the installed `/Applications/Premonition.app` candidate described and verified in S5.10.
- Marked the installed/release-candidate review complete in the S5 plan and acceptance register.
- Kept the strict Homebrew audit limitation open and visible rather than treating owner app acceptance as evidence for a command that did not run.
- Confirmed issue #17 remains open and that the only earlier completion-branch PR is merged PR #19; the current branch begins from merged `main` and contains the new signed-candidate evidence.

### Decisions and provenance

- **Owner decision:** Approve the installed signed v0.1.0 candidate.
- **Sol implemented:** Acceptance-state updates, paired owner-decision checkpoint and review packaging.
- **Sol reviewed:** Installed-artifact evidence, unchanged publication boundary, remaining Xcode/Homebrew deviation and issue #17 scope.
- **Human-authored and Sol-reviewed:** The owner's direct acceptance verdict.

### Artefacts

- `docs/build-week/s5-implementation-plan.md` — installed review marked complete.
- `docs/build-week/s5-acceptance-register.md` — owner acceptance recorded without broadening the strict-audit claim.
- Issue #17 completion commit and draft PR — review surfaces to be produced from this checkpoint.

### Verification

- Owner observation — explicit `Approved.` response for the installed signed candidate.
- GitHub issue inspection — issue #17 remains open.
- GitHub branch-PR inspection — merged PR #19 is the only prior PR associated with the completion branch name; no open completion PR exists.
- Final paired-log, ledger, provenance, release-contract and diff checks — run before the S5.11 commit.

### Deviations

- Strict Homebrew audit is still not claimed. Homebrew requires Xcode 27.0 on this machine; Xcode 26.6 remains installed.

### Risks and missing evidence

- The owner has not yet decided whether to install Xcode 27 for the strict cask audit or explicitly defer that polish under the specification's cut order.
- The intended GitHub release URL remains unavailable because no release asset has been published.
- This acceptance does not authorise merging the completion PR, publishing a release, pushing a cask, promoting externally or beginning S6.

### Next entry state

- Push the issue #17 completion branch and open a draft PR containing the signed-candidate evidence and prepared unpublished cask. Owner reviews the PR and chooses either Xcode 27 strict-audit completion or explicit Homebrew-polish deferral. Keep merge, release publication and S6 separately owner-gated.

---

## Entry S5.12 — The old review branch remains untouched

**Date:** 2026-07-19

**Recorded at:** 2026-07-19T22:23:53+01:00

**Phase:** S5

**Status:** Partial — signed-candidate commit ready on a collision-free review branch

**Model:** GPT-5.6 Sol — explicitly confirmed for the Premonition durable session

**Session ID:** 019f5f0f-a2dd-78e3-a5b3-413860708eab — Premonition durable session

### Objective

Resolve the remote branch-name collision discovered during the owner-approved S5.11 push without overwriting the retained PR #19 branch or weakening provenance.

### Completed

- The attempted normal push to `codex/issue-17-release-completion` was rejected because the remote still contains commit `427c99284864ba4b8d20cf968ef06f32f11478f4` under that name.
- Refused to force-push or rewrite the retained branch.
- Renamed the new local review branch to `codex/issue-17-signed-candidate` and updated the active S5 plan accordingly.
- Preserved the earlier S5.5 references to the original completion branch as historical facts; this append-only entry records the new branch decision.

### Decisions and provenance

- **Owner decision:** Approve the signed installed candidate and proceed to the review package.
- **Sol implemented:** Safe branch-collision diagnosis, non-destructive rename and append-only provenance correction.
- **Sol reviewed:** Remote ref identity, no-force-push boundary, issue #17 naming and unchanged release/publication gates.
- **Human-authored and Sol-reviewed:** None.

### Artefacts

- `codex/issue-17-signed-candidate` — collision-free branch for the signed-candidate evidence.
- `docs/build-week/s5-implementation-plan.md` — current branch reference corrected.

### Verification

- `git ls-remote --heads origin refs/heads/codex/issue-17-release-completion` — retained remote ref resolves to `427c99284864ba4b8d20cf968ef06f32f11478f4`.
- Local branch inspection — `codex/issue-17-signed-candidate` is one commit ahead of merged `origin/main` before the amended checkpoint commit.
- Final paired-log, provenance and staged-diff checks — rerun after this append and before push.

### Deviations

- The branch name differs from the S5.11 planned completion name solely to preserve the older remote review branch without force-pushing it.

### Risks and missing evidence

- The renamed branch and its draft PR are not yet remote at the time of this entry.
- Strict Homebrew audit, release publication and S6 boundaries remain unchanged.

### Next entry state

- Amend the unpushed signed-candidate commit to include this collision checkpoint, push `codex/issue-17-signed-candidate`, open the draft issue #17 PR and stop for owner review. Do not merge or publish.

---

## Entry S5.13 — Homebrew polish is deliberately deferred

**Date:** 2026-07-20

**Recorded at:** 2026-07-20T07:27:11+01:00

**Phase:** S5

**Status:** Complete — S5 exit evidence satisfied; no public action

**Model:** GPT-5.6 Sol — explicitly confirmed for the Premonition durable session

**Session ID:** 019f5f0f-a2dd-78e3-a5b3-413860708eab — Premonition durable session

### Objective

Resolve the final S5 Homebrew-audit decision by applying the specification's explicit cut order without weakening the signed judge path or claiming an audit that did not run.

### Completed

- Received the owner's explicit decision to defer strict Homebrew audit rather than install Xcode 27 solely for that polish step.
- Applied §11 cut-order item 4: defer polished Homebrew automation while retaining a valid prepared cask.
- Kept the verified cask URL/checksum, release-contract test, Ruby syntax pass and Homebrew style pass; retained the failed strict-audit attempt as an explicit Xcode-version deviation.
- Confirmed PR #22 was merged as `0daa72665049a93483e7d72dfc4be8a3dfa4e8f5` before this decision, so created fresh branch `codex/issue-17-homebrew-audit-deferral` from merged `main` instead of modifying the closed review branch.
- Marked the S5 plan complete. The signed, notarised, stapled and owner-approved judge artifact, full required evidence and complete provenance record satisfy the S5 exit criteria without publishing anything.

### Decisions and provenance

- **Owner decision:** Defer strict Homebrew audit under the specification's permitted Homebrew-polish cut.
- **Sol implemented:** Phase-state update, explicit audit classification, fresh post-merge branch and paired provenance checkpoint.
- **Sol reviewed:** §11 S5 exit criteria, cut-order boundary, prepared-cask validity, no-false-audit claim and no-publication boundary.
- **Human-authored and Sol-reviewed:** The owner's direct deferral decision.

### Artefacts

- `docs/build-week/s5-implementation-plan.md` — S5 complete with the audit cut explicit.
- `docs/build-week/s5-acceptance-register.md` — owner-approved artifact and deferred strict-audit classification.
- `codex/issue-17-homebrew-audit-deferral` — narrow post-merge branch for the final S5 decision record.

### Verification

- Owner statement — `Defer it I think` in the durable session.
- `PREMONITION_SPEC.md` §11 — cut order explicitly permits deferring polished Homebrew automation while retaining a valid prepared formula.
- GitHub PR inspection — PR #22 is merged.
- GitHub/main inspection — merged main resolves to `0daa72665049a93483e7d72dfc4be8a3dfa4e8f5` before the fresh branch.
- Paired-log, provenance and diff checks — run before committing this S5.13 checkpoint.

### Deviations

- `brew audit --cask --strict` remains unpassed because installed Homebrew requires Xcode 27 while the Mac has Xcode 26.6. This is now an explicit owner-approved polish deferral, not missing or misreported evidence.

### Risks and missing evidence

- The cask remains unpublished and has no strict-audit pass. Revisit the audit with the then-current Xcode/Homebrew toolchain before any later Homebrew publication.
- The signed release archive remains local; no GitHub release or asset exists.
- The S5.13 follow-up branch is not merged at the time of this entry. S6 work has not started.

### Next entry state

- Commit and open a narrow draft PR for the S5.13 deferral checkpoint. After owner review and merge, close issue #17 and begin S6 only on a separately authorised issue/branch. Keep release publication, Homebrew publication, submission and promotion separately owner-gated.

---

## Entry S6.1 — Submission starts with one evidence spine

**Date:** 2026-07-20

**Recorded at:** 2026-07-20T07:56:47+01:00

**Phase:** S6

**Status:** Partial — issue, branch, live constraints and initial submission pack established

**Model:** GPT-5.6 Sol — explicitly confirmed for the Premonition durable session

**Session ID:** 019f5f0f-a2dd-78e3-a5b3-413860708eab — Premonition durable session

### Objective

Begin the owner-authorised S6 submission-materials phase from completed S5 evidence without treating preparation as authority to publish, upload or submit.

### Completed

- Verified PR #23 merged as `cac8cef48ff839e5a4218e393b0878afd39f4c12`, issue #17 closed as completed and no existing S6 issue existed.
- Created issue #24, `S6: assemble submission materials and owner handoff`, with objective, included/excluded scope, testable acceptance criteria and explicit public-action stop gates.
- Created `codex/issue-24-submission-materials` from exact merged `main` commit `cac8cef`.
- Checked the official Build Week rules, FAQ and OpenAI event page on 2026-07-20. Confirmed the deadline, single Developer Tools track, public narrated YouTube video at or under three minutes, repository/judge-sharing routes, primary feedback ID, testing-path and pre-existing-work disclosure requirements.
- Added a repository S6 plan and the Toolkit Launch Pack evidence spine: brief, claims ledger, asset inventory, channel matrix, release checklist and handoff.
- Classified public download and public Sites access as blocked rather than implying availability. Social/community/Homebrew publication remain deliberately omitted from the submission critical path.
- Identified one immediate consistency defect for S6: README still says the signed artifact is pending even though S5 produced and owner-approved it. No README edit was made in this checkpoint.

### Decisions and provenance

- **Owner decision:** Begin working through S6 submission materials.
- **Sol implemented:** Issue/branch setup, official-constraint verification, bounded S6 plan and initial launch evidence spine.
- **Sol reviewed:** S5 exit, S6 entry, current Build Week requirements, claims evidence, access-state qualifications and public-action boundaries.
- **Human-authored and Sol-reviewed:** Owner direction to proceed through S6.

### Artefacts

- GitHub issue #24 — S6 scope and acceptance contract.
- `docs/build-week/s6-implementation-plan.md` — ordered, owner-gated execution plan.
- `launch-pack/LAUNCH_BRIEF.md`, `CLAIMS_LEDGER.md`, `ASSET_INVENTORY.md`, `CHANNEL_MATRIX.md`, `RELEASE_CHECKLIST.md` and `HANDOFF.md` — initial submission package state.

### Verification

- GitHub issue list — no pre-existing S6 issue; issue #17 closed and issue #20 remains open submission support.
- GitHub/main inspection — `cac8cef48ff839e5a4218e393b0878afd39f4c12` is merged main before the S6 branch.
- Official [rules](https://openai.devpost.com/rules), [FAQ](https://openai.devpost.com/details/faqs) and [event page](https://openai.com/build-week/) — live constraints checked on 2026-07-20.
- Repository evidence inspection — specification, README, prior/new boundary, S5 acceptance evidence, logs and Sol ledger checked for initial claims and gaps.
- Launch Pack structural checker, paired-log checker, provenance checker and diff review — run before the S6.1 commit.

### Deviations

- The Toolkit Launch Pack checker lives in the installed plugin rather than this repository. It is run from the installed skill path and is workflow tooling, not a Premonition runtime dependency.
- Exact Devpost form fields beyond the public rules/FAQ remain owner-side live-form evidence and are not fabricated in this checkpoint.

### Risks and missing evidence

- Repository, signed-download, public YouTube and optional Sites routes require separate owner decisions.
- Submission narrative, timed demo script, footage, captions and final form answers do not yet exist.
- README availability wording is stale and must be corrected before public use.
- No public action, Devpost submission, release upload, video upload, repository-visibility change or Sites-access change has occurred.

### Next entry state

- Ask the owner to choose the repository judging route first: public MIT repository, or private repository shared with the two official judge addresses. Then reconcile README status/boundary and draft submission copy against that access decision. Do not publish or submit.
