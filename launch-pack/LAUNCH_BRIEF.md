# Launch brief

- Product: Premonition
- Release: Premonition v0.1
- Version: 0.1.0
- Build: signed candidate from source `e93f44b`; notarisation submission `5aaf9cfe-b35a-4971-b18e-adece5eaa6ca`
- Release state: signed, notarised, stapled and owner-approved locally; unpublished
- Release date or window: Build Week submission due 2026-07-21 17:00 PDT / 2026-07-22 01:00 BST
- Authoritative source: `PREMONITION_SPEC.md`, verified signed artifact, acceptance register and append-only provenance logs

## Audience and outcome

- Primary audience: OpenAI Build Week Developer Tools judges
- User outcome: understand and test the copy-error-to-reviewed-patch loop without rebuilding or trusting an autonomous mutation
- Launch objective: submit a clear, evidence-backed Developer Tools entry
- Primary call to action: watch the product demo, inspect the repository evidence and use the judge testing path
- Canonical destination: Blocked pending owner repository and signed-download decisions

## Availability and boundaries

- Platforms and minimum versions: native macOS 14+; current signed binary is Apple Silicon
- Rollout or eligibility: local owner-approved candidate; no public release exists
- Pricing: no paid offering; repository licence is MIT
- Material limitations: heuristic gate; admitted errors leave verbatim; no secret redaction; `git apply --check` proves applicability only; live Sol output varies; macOS-only
- Required disclosures: pre-period planning boundary; Sol runtime/build-partner roles; no auto-Apply; no provider-retention claim; owner-only explainer access if linked

## Delivery contract

- Included channels: Devpost submission, repository front door, public YouTube demo candidate, judge download/testing path; owner-only Sites explainer only if qualified
- Deliberately omitted channels: social, community, press and Homebrew publication
- Format or submission constraints: English; one Developer Tools track; public YouTube video at or under three minutes with voiceover; repository public or shared privately with the two official judge addresses
- Accessibility requirements: accurate captions, readable on-screen type, intelligible narration, no colour-only proof and no private notifications
- Publication authority: Tom Ballard only; preparation does not authorise publication or submission

## Evidence summary

- Release artifact or verified build: signed/stapled local ZIP SHA-256 `3d48e5b06342ce8bd11dddf0fa7f8b318e7273dd3e453177b6a2b47ef8d03178`; installed candidate owner-approved
- Tests and measurements: 55-test suite and repository wrapper passed; Gatekeeper, stapler and clean-ZIP verification passed
- Specification and acceptance criteria: `PREMONITION_SPEC.md` §2, §9, §11 and §14
- Build logs and decisions: `BUILDLOG.md`, `DEVLOG.md`, `docs/build-week/sol-ledger.md`, S5 acceptance register
- Existing assets and copy: README, deterministic shallow/deep fixtures, demo panel/replay, owner-only Sites explainer and signed app
