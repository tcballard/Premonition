# Provenance exceptions

Append-only. A row records a protected-branch merge that stripped already-verified trailers. It does not prove authorship and must not be used for ordinary commits.

| Commit | Pull request | Source commit | Phase | Session ID | BUILDLOG entry | Reason |
| --- | --- | --- | --- | --- | --- | --- |
| 27e4150163f669bef474aa6dbf9d5203f93e8f04 | #7 | 0d34b1803c8f18acb18cd70422d059977fde9a18 | S1 | 019f5f0f-a2dd-78e3-a5b3-413860708eab | S1.1 | GitHub squash merge retained the issue title but stripped the source commit trailers; rewriting protected main was rejected. |
