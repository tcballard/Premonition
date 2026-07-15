# Premonition Sites Explainer Handoff

This prompt is for a future Premonition session near the end of the build, after the macOS app, README, demo flow, provenance logs, and release evidence are stable.

Do not use this prompt to start Sites work early.

## Handoff Prompt

You are helping build a lightweight Sites landing/explainer page for Premonition v0.1.

Context:
Premonition is a macOS menu-bar app for Build Week. Product promise: “Copy an error, and the fix is already waiting.” It watches the clipboard locally, gates for error-shaped text, resolves only against allowlisted Git repositories, asks Codex pinned to GPT-5.6 Sol for one bounded patch, validates it, and presents it for explicit human Apply / Copy Patch / Dismiss. It never auto-applies, stages, commits, runs tests, or sends ordinary clipboard content.

Goal:
Build a single-page explainer/landing page using Sites. This is not the product itself and must not distract from the macOS demo. It should help judges understand:
- the product promise;
- the safety spine;
- the privacy/egress contract;
- Sol as runtime engine;
- Sol as build partner;
- the provenance evidence: PREMONITION_SPEC.md, BUILDLOG.md, DEVLOG.md, docs/build-week/sol-ledger.md;
- what to watch for in the actual demo.

Use these skills/plugins if available:
- Sites connector/app: create/save/deploy the page.
- $authored-frontend-design: make it feel authored, restrained, and developer-tool specific, not generic SaaS.
- $build-premonition: read the current Premonition spec/logs and preserve the claims accurately.
- $maintain-premonition-build-log: only if this page work needs to be recorded back into Premonition provenance logs.
- $product-design:ideate: optional only if exploring 2-3 visual directions before implementation.
- $product-design:audit: optional after implementation to critique the page against the intended judge/demo flow.

Design direction:
Make it a calm judge-orientation page, almost like a field guide or exhibit label beside the app. Avoid startup-marketing gloss, fake dashboards, decorative gradients, generic AI cards, and overclaiming. The page should feel native-adjacent, precise, quiet, and provenance-rich.

Suggested structure:
1. Hero:
   “The fix was already waiting.”
   Short subcopy: “Premonition is the ambient interface layer for Codex: copy an error, review the validated patch, decide.”

2. The Loop:
   gate → resolve → admit → Sol drafts → validate → human decision.
   Keep this visual and compact.

3. Safety Spine:
   Local clipboard watching.
   Error-shaped gate.
   Allowlisted repos only.
   Daily cap.
   Read-only Sol speculation.
   Single candidate.
   `git apply --check`.
   Explicit human Apply.

4. Privacy Contract:
   Include or closely paraphrase the privacy constitution from PREMONITION_SPEC.md.
   Be careful: do not claim secret redaction or zero provider retention.

5. Sol Provenance:
   Explain the two uses of Sol:
   - runtime engine;
   - build partner.
   Link/point to BUILDLOG, DEVLOG, and sol-ledger.

6. Demo Guide:
   “What to watch for”:
   - ordinary clipboard content does nothing;
   - copying a traceback starts the loop;
   - the patch is reviewed before Apply;
   - dirty worktrees block Apply;
   - fixture replay supports judging.

7. Footer:
   Build Week / Developer Tools.
   MIT licence.
   Repo/download links can be placeholders if not public yet.

Important constraints:
- Do not imply Premonition proves patch correctness.
- Do not imply it redacts secrets.
- Do not imply it auto-applies.
- Do not publish publicly unless explicitly authorised.
- If deploying with Sites, clarify whether it is private/preview/owner-only or public before production deployment.
- Keep it single-page and shippable; avoid scope creep.

First steps:
1. Inspect PREMONITION_SPEC.md, BUILDLOG.md, DEVLOG.md, and docs/build-week/sol-ledger.md.
2. Draft the page copy from those sources.
3. Build the single-page Sites implementation.
4. Verify responsive layout and links.
5. Present for owner review before public deployment.
