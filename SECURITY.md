# Security policy

## Supported version

Premonition v0.1 is currently unreleased. Security fixes are prepared against
the latest repository version until a signed release is published. No older
binary receives a support guarantee.

## Report a vulnerability

Please do not disclose a suspected vulnerability, copied error, repository
content, credential or exploit detail in a public issue.

Use GitHub private vulnerability reporting if the repository Security tab
offers it. Otherwise contact the repository owner privately through the owner’s
GitHub profile and request a private reporting channel. Include the smallest
reproduction that demonstrates the boundary failure, but replace real secrets,
clipboard content and source code with synthetic data.

Useful reports identify:

- the Premonition version or commit;
- the macOS and Codex CLI versions;
- whether the issue affects gate, allowlist, cap, model invocation, diff
  validation, Apply, persistence or fixture replay;
- expected and observed behaviour;
- a synthetic reproduction and impact assessment.

Do not send authentication files, notary credentials, signing material or raw
Codex session data.

## Security and privacy boundary

Premonition treats clipboard text, extracted paths, repository contents,
fixture data and model output as untrusted.

- Concealed, transient and auto-generated pasteboard items are rejected before
  content is read. Other text is size-limited, deduplicated and passed through
  a local heuristic error gate.
- A candidate proceeds only when extracted paths resolve beneath a root the
  owner explicitly allowlisted. Single-flight and the daily cap are checked
  before the first model call.
- Live execution is pinned to `gpt-5.6-sol` and invokes Codex with read-only,
  no-approval, ephemeral and ignore-user-config flags.
- One canonical diff parser rejects malformed, binary, absolute, traversal,
  `.git` and symlink-escape paths. `git apply --check` validates without
  mutation.
- Apply is an explicit human action. It rechecks a literally clean worktree,
  revalidates the patch, and uses only `git apply`. It does not stage, commit,
  test, run hooks or execute post-apply commands.
- Normal persistence is limited to configuration, daily date/count state and
  content-free verdict metadata with owner-only file permissions.

## Important non-guarantees

- v0.1 does not redact secrets. An admitted copied error is sent verbatim to
  Codex and may contain sensitive data.
- Ephemeral CLI mode is a client-side invocation contract. Premonition does not
  claim control over operating-system swap or provider-side retention.
- The gate is heuristic and is not a security classifier.
- `git apply --check` proves applicability, not correctness or safety.
- Read-only model execution limits direct mutation; it does not make repository
  content trustworthy or model output correct.
- Local users or processes with equivalent account privileges remain outside
  Premonition’s protection boundary.

The maintained architecture and residual-risk analysis are in
[docs/architecture.md](docs/architecture.md) and
[docs/threat-model.md](docs/threat-model.md).
