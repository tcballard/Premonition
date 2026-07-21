# Asset inventory

| ID | Asset | Purpose | Source or provenance | Constraints | Output path | Status | Blocker or next action |
| --- | --- | --- | --- | --- | --- | --- | --- |
| A01 | Signed Premonition 0.1.0 ZIP | Judge-runnable artifact | S5 notarisation plus S6.3 public-download and clean-extraction verification | Apple Silicon; SHA-256 fixed | `https://github.com/tcballard/Premonition/releases/download/v0.1.0/Premonition-0.1.0.zip` | Ready | Use as the signed judging route |
| A02 | Installed signed app | Product review and footage | Exact S5 candidate in `/Applications` | Apple Silicon; preserve signed bundle | `/Applications/Premonition.app` | Ready | Use for final footage |
| A03 | Shallow/deep fixtures and replay | Deterministic judging path | Repository fixtures and A12 | Must remain visibly labelled fixture replay | `Fixtures/`, demo repository script | Ready | Stage clean demo repository |
| A04 | README front door | Setup, safety and provenance | Repository evidence and verified boundary commits | Public source and signed-release routes are explicit | `README.md` | Ready | Keep availability wording aligned downstream |
| A05 | Submission narrative | Devpost description and field copy | Claims ledger, repository evidence and authenticated live form inspection | English; owner must rewrite the generated draft in their own voice | `launch-pack/outputs/submission-narrative.md` | Draft | Owner rewrite, personal declarations, video URL and final approval remain |
| A06 | Timed demo script and shot list | Three-minute narrated demonstration | Product-demo workflow | Must cover product, Codex and GPT-5.6; captions required | `launch-pack/outputs/demo-script.md` | Missing | Draft and time before recording |
| A07 | Public YouTube video | Mandatory submission demo | Real captured signed app footage | Three minutes or under; public; voiceover; no unlicensed assets | External URL plus local master | Missing | Requires owner upload authority |
| A08 | Sites explainer | Optional judge orientation | Sites version 2 from exact source commit | Owner-only sign-in; not a public submission link | owner-review Sites URL | Qualified | Include only with visible access qualification or omit |
| A09 | Provenance records | Evidence of Sol build partnership | Spec, BUILDLOG, DEVLOG, Sol ledger and commits | Do not overclaim authorship proof | Repository | Ready | Link selectively from narrative |
| A10 | Repository access route | Judge source/testing access | Owner-confirmed public GitHub repository | MIT source and signed release | `https://github.com/tcballard/Premonition` | Ready | Use as the official judging repository |
