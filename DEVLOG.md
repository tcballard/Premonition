# Premonition Dev Log

This is the human side of the Premonition build: what changed, why it mattered and what happens next. Every entry is derived from the matching factual entry in `BUILDLOG.md`; this diary is context, not evidence.

---

## P0 — The project began on paper

**Date:** 2026-07-12

Premonition started with a fairly sharp promise: copy an error and have a possible fix waiting before you have decided what to do next.

The first specification mapped the whole shape of that idea—the clipboard gate, repository allowlist, speculative patch, validation and human-controlled Apply path. It also proposed using Peripheral as the starting scaffold.

No application code existed yet. Neither did a repository or a captured Codex session. This was the plan before the build, not the build itself.

The next job was to make the specification genuinely standalone and implementation-ready.

**Source:** `BUILDLOG.md`, Entry P0

---

## P1 — Premonition became its own project

**Date:** 2026-07-13

The specification was rebuilt with GPT-5.6 Sol, and the biggest decision was subtraction: Peripheral is gone.

Premonition will now start from an empty repository with its own SwiftPM structure, native app-bundle scripts and process-running contract. Sol is pinned for runtime speculation, escalation and rationale. The direct API executor moved out of v0.1 before it could become a second authentication and privacy surface.

This was still planning, but it removed the parts most likely to make implementation ambiguous. It also made the provenance claim concrete: Sol is both the runtime engine and the build partner, with evidence required for both.

Next came turning that specification into something a fresh Sol session could operate without improvising.

**Source:** `BUILDLOG.md`, Entry P1

---

## P2 — Give Sol the map before asking it to drive

**Date:** 2026-07-13

The project now has an operator: `build-premonition`.

The skill does not duplicate the specification. It finds the authoritative copy, reads the current build state, protects the settled invariants and selects only the earliest eligible S0–S6 phase. It also routes macOS work to the right supporting playbooks without letting generic advice quietly replace Premonition's architecture.

There is still no application repository. That is the point of the next session, not something to blur into this one.

The next move remains S0: establish the repository, capture `/feedback`, pin the tool contracts and prove the scaffold.

**Source:** `BUILDLOG.md`, Entry P2

---

## P3 — We built the record before the app

**Date:** 2026-07-13

Premonition still has no application code. Deliberately.

If this is going to be described as something designed and built with Sol, that trail needs to exist before implementation—not be reconstructed afterwards when the submission asks awkward questions.

Today we created a dedicated build-log skill. It separates what Sol implemented, what the owner decided, what was actually verified and what the next session is allowed to assume.

The pleasingly recursive bit: its first real job was logging its own creation.

The machinery is in place. The app is not. Next comes S0: create the repository, capture the durable Sol session ID and establish the complete scaffold.

**Source:** `BUILDLOG.md`, Entry P3

---

## P4 — Two logs, two jobs

**Date:** 2026-07-13

The build log now has a companion.

`BUILDLOG.md` remains the thing a fresh Sol session can trust: exact outcomes, verification, provenance, deviations and the next legal move. `DEVLOG.md` gets to explain why the work mattered and what it felt like without quietly becoming evidence.

The logging skill now maintains both. Each material session gets one shared ID, the diary points back to its factual source, and the checker makes sure the two do not drift apart. Merge & Tell supplies the voice only after the facts are settled.

We also looked at the third record: the Sol ledger. The specification already treats stable session evidence and ledger rows as primary, with a `Co-developed-with` commit trailer as supporting metadata. No `[CODEX]` prefixes or harness changes were adopted today.

The next decision is whether to make richer Git trailers and an automated provenance-completeness check part of S0. Then, finally, the app.

**Source:** `BUILDLOG.md`, Entry P4

---

## P5 — The paper trail has somewhere to live

**Date:** 2026-07-13

Premonition now has a repository-authoritative specification—and a public history that begins before the app does.

Version 2.1 makes the provenance design binding. Sol-assisted commits keep ordinary useful subjects and carry structured trailers underneath. A repository checker will verify that the ledger, sessions, commits and paired logs agree, while stopping short of the impossible claim that metadata can prove who wrote a line of code.

The factual build log and this diary are now part of `tcballard/Premonition` alongside the specification and existing MIT licence. The baseline is intentionally honest: this is planning and project infrastructure. There is still no application implementation and no captured core-build Session ID.

That changes next. S0 starts from this record, captures `/feedback`, creates the Sol ledger and turns the empty project into a verified macOS scaffold.

**Source:** `BUILDLOG.md`, Entry P5

---

## P6 — I put it on main. That was wrong.

**Date:** 2026-07-13

The three project documents landed in the right repository through the wrong workflow. They were committed directly to `main` instead of arriving as a pull request.

That is now corrected without pretending it did not happen. The direct commit has an ordinary revert on `main`; no force-push, no tidied-up history. The documents now live on `agent/add-premonition-project-records` behind draft PR #1.

The factual log keeps P5 because it happened. P6 records the correction. Slightly uncomfortable is better than suspiciously perfect.

Next, the PR gets reviewed and merged deliberately. S0 still starts afterwards, with `/feedback`, the Sol ledger and the provenance checker—not before.

**Source:** `BUILDLOG.md`, Entry P6

---

## P7 — A PR is not yet the PR standard

**Date:** 2026-07-13

The correction got the documents off `main` and behind a draft PR. Then the owner supplied the actual house style: SortingHat #14.

It is more than a branch-versus-main rule. The work starts with a scoped issue, lives on a `codex/issue-…` branch, carries the issue into the commit and PR title, and gives the reviewer an explicit map: what is in, what is out, which decisions matter, what ran and where to read first.

Premonition now records that contract in the specification. The older `agent/` draft remains part of the audit trail but is closed, unmerged and superseded by issue #2 and draft PR #3. Codex identity stays visible in the branch and the richer Sol trailers, not stapled noisily onto every subject line.

The documents still are not on `main`. That only happens after review. Next is a deliberate look at PR #3, then S0 with the stable session, ledger, `AGENTS.md` and provenance checker.

**Source:** `BUILDLOG.md`, Entry P7
