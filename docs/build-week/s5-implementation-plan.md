# S5 Hardening and Release-Ready Plan

**Status:** At owner credential gate; all non-credential implementation and verification complete
**Issue:** #17 — S5: harden and prepare release-ready evidence
**Branch:** `codex/issue-17-release-hardening`
**Phase boundary:** S5 only

## Objective

Turn the merged S4 product into a security-reviewed, fully evidenced and owner-verifiable v0.1 release candidate. Prepare every distribution surface without publishing, submitting, promoting or beginning S6.

## Entry evidence

- PR #16 was squash merged as `44a541114b5a2be69567688536b2696651eb7823`.
- The squash commit retains the S4.2 and S4.3 model, session, phase and BUILDLOG trailers.
- Local `main` is clean and identical to `origin/main`.
- Paired-log validation reports 36 BUILDLOG and 36 DEVLOG entries.
- The repository provenance checker reports `provenance record complete`.
- Issue #15 is closed; issue #17 defines the bounded S5 scope.

## Workstreams and order

### 1. Evidence-first acceptance sweep

Create `docs/build-week/s5-acceptance-register.md` before changing runtime or release code. Map A1–A14 to:

- deterministic automated evidence;
- installed-app owner observation;
- live Codex evidence;
- owner-assisted signing/notarisation evidence;
- an explicit blocker where evidence is unavailable.

Add missing deterministic coverage before relying on a manual claim. In particular, exercise the full negative clipboard corpus and a representative normal-workday simulation while asserting zero executor calls and zero egress events.

### 2. Final Sol security and privacy review

Review the merged S4 tree for:

- admission ordering and single-flight/cap lifecycle;
- exact Codex model, sandbox, approval and ephemeral flags;
- prompt/output/persistence boundaries;
- untrusted clipboard, path, diff and fixture handling;
- click-time clean-tree and `git apply` mutation controls;
- rationale timing and model-call ceiling;
- cancellation, expiry, focus and accessibility behaviour;
- misleading claims in user-visible copy and documentation.

Update `docs/architecture.md` and `docs/threat-model.md` to describe the actual S4 product. Record every finding and its resolution in the acceptance register; do not quietly downgrade a release blocker.

### 3. Required repository front door

Create:

- `README.md` with the complete §2.1 privacy constitution verbatim, install/run/demo instructions, exact egress and Apply contracts, limitations, Sol runtime/build provenance and prior/new boundary;
- `SECURITY.md` with supported-version, vulnerability-reporting and safety-boundary guidance that does not promise secret redaction or patch correctness;
- `CHANGELOG.md` with a factual unreleased v0.1 entry.

Keep S6 submission prose and public promotion out of these files.

### 4. Release tooling without publication

Implement and test:

- `scripts/sign-and-notarise.sh` — explicit Developer ID identity and notary profile inputs; hardened runtime; ordered nested signing if required; validation, notary submission/wait, stapling and post-staple checks; no upload except Apple's notarisation service and no release publication;
- `scripts/verify-release.sh` — independent bundle structure, version, executable, resources, codesign, Gatekeeper, staple and fixture checks with an explicit unsigned-local mode where appropriate;
- `packaging/homebrew/` — prepared, syntactically checked cask/formula with clearly unresolved release URL and checksum placeholders; never push to a tap.

Missing credentials must fail before mutation and remain an evidence-backed owner gate.

### 5. Owner-assisted release candidate

Only after the owner supplies or confirms:

- a `Developer ID Application` signing identity;
- a configured `notarytool` Keychain profile;
- the intended local artifact/output location;

build from a stable local snapshot, sign, notarise, staple and verify the judge artifact. Never echo credential material or record it in repository files.

### 6. Final review and handoff

- Run the full A1–A14 register and prescribed repository commands.
- Run the final Sol invariant, privacy, accessibility and misleading-copy review.
- Validate README requirements mechanically where useful.
- Audit BUILDLOG, DEVLOG, Sol ledger and commit trailers.
- Present the installed/release candidate for owner review.
- Commit, push and open a draft PR; do not merge or enable auto-merge.

## Required verification

- `swift test`
- `scripts/test.sh`
- `scripts/build-app.sh release`
- `script/build_and_run.sh --verify`
- `scripts/verify-release.sh <artifact>` with the appropriate signed/unsigned expectation
- `codesign --verify --deep --strict --verbose=2 <artifact>` for the signed candidate
- `spctl --assess --type execute --verbose=4 <artifact>` for the signed candidate
- `xcrun stapler validate <artifact>` for the notarised candidate
- Homebrew syntax/audit command available on the build machine, without publication
- `python3 scripts/check_buildlog.py BUILDLOG.md --devlog DEVLOG.md`
- `python3 scripts/check-provenance.py`
- `git diff --check`

## Explicit stop gates

- Do not infer signing credentials, identity names or notary profile names.
- Do not publish a GitHub release or upload release assets.
- Do not publish or push a Homebrew tap/cask.
- Do not change repository visibility.
- Do not start Devpost, Sites, demo publication, social or other S6 work.
- Do not merge the S5 PR or enable auto-merge.

## Completion checklist

- [x] A1–A14 acceptance register complete with evidence classes.
- [x] Negative corpus and normal-workday zero-egress evidence complete.
- [x] Final Sol security/privacy/accessibility review resolved.
- [x] Architecture and threat model match the merged v0.1 product.
- [x] README, SECURITY and CHANGELOG complete.
- [x] Signing/notarisation and independent verification scripts complete.
- [x] Homebrew surface prepared and syntactically/style checked, not published.
- [ ] Owner signing/notarisation inputs confirmed.
- [ ] Signed, notarised, stapled judge artifact independently verified.
- [x] Full repository verification passes; paired-log, ledger and provenance checks are rerun at the final checkpoint.
- [ ] Installed/release candidate owner review complete.
- [ ] Draft PR opened for owner review; no merge or publication.
