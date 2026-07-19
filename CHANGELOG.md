# Changelog

All notable Premonition changes are recorded here. The project follows
semantic versioning once the first release is published.

## [Unreleased]

### Added

- Native macOS 14+ menu-bar monitoring, paused, speculating and fix-ready
  states with keyboard, VoiceOver and Reduce Motion support.
- Local deterministic clipboard gate, allowlisted repository resolution,
  single-flight admission and persistent daily candidate cap.
- Codex execution pinned to GPT-5.6 Sol with one Low-effort attempt, one bounded
  Medium escalation and an optional post-validation rationale.
- Canonical unified-diff parsing, bounded path validation and non-mutating
  `git apply --check` verification.
- Explicit clean-tree Apply, Copy Patch, Dismiss and ten-minute expiry actions.
- Deterministic demo repository and offline fixture replay through the real
  gate, resolver, admission, validation and presentation pipeline.
- Specification-led Build Week provenance through paired BUILDLOG/DEVLOG
  entries and the Sol ledger.

### Security

- Concealed, transient and auto-generated pasteboard types are rejected before
  content reads.
- Normal persistence excludes clipboard text, prompts, diffs, rationales,
  model output and stderr.
- Candidate rationale execution is cancelled when Pause or any terminal
  review action releases the candidate.

### Release status

- Release verification and distribution metadata are being prepared in S5.
- A signed, notarised and stapled artifact is not yet available; publication
  remains owner-gated.
