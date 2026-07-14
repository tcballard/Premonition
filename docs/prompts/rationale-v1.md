# Rationale prompt v1

After a patch has passed the canonical parser, bounds validator and `git apply --check`, ask GPT-5.6 Sol for at most two short plain-text lines explaining the change from the first ten error lines and the validated diff.

Rationale output is optional, capped at 240 characters, rejected when code-shaped and never delays presentation.
