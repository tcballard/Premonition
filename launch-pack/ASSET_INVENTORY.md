# Asset inventory

| ID | Asset | Purpose | Source or provenance | Constraints | Output path | Status | Blocker or next action |
| --- | --- | --- | --- | --- | --- | --- | --- |
| A01 | Signed Premonition 0.1.0 ZIP | Judge-runnable artifact | S5 notarisation and clean extraction verification | Local only; SHA-256 fixed; do not upload without authority | `dist/release/Premonition-0.1.0.zip` | Ready | Choose and verify download route |
| A02 | Installed signed app | Product review and footage | Exact S5 candidate in `/Applications` | Apple Silicon; preserve signed bundle | `/Applications/Premonition.app` | Ready | Use for final footage |
| A03 | Shallow/deep fixtures and replay | Deterministic judging path | Repository fixtures and A12 | Must remain visibly labelled fixture replay | `Fixtures/`, demo repository script | Ready | Stage clean demo repository |
| A04 | README front door | Setup, safety and provenance | Merged repository README | Signed-artifact status is stale | `README.md` | Draft | Update and verify dated links |
| A05 | Submission narrative | Devpost description and field copy | Claims ledger and evidence | English; exact form limits not yet inspected | `launch-pack/outputs/submission-narrative.md` | Missing | Draft after owner access choice |
| A06 | Timed demo script and shot list | Three-minute narrated demonstration | Product-demo workflow | Must cover product, Codex and GPT-5.6; captions required | `launch-pack/outputs/demo-script.md` | Missing | Draft and time before recording |
| A07 | Public YouTube video | Mandatory submission demo | Real captured signed app footage | Three minutes or under; public; voiceover; no unlicensed assets | External URL plus local master | Missing | Requires owner upload authority |
| A08 | Sites explainer | Optional judge orientation | Sites version 2 from exact source commit | Owner-only sign-in; not a public submission link | owner-review Sites URL | Qualified | Include only with visible access qualification or omit |
| A09 | Provenance records | Evidence of Sol build partnership | Spec, BUILDLOG, DEVLOG, Sol ledger and commits | Do not overclaim authorship proof | Repository | Ready | Link selectively from narrative |
| A10 | Repository access route | Judge source/testing access | GitHub repository | Public or shared with official judge addresses | Blocked owner decision | Blocked | Resolve first owner decision |
