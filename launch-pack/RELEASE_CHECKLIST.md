# Release checklist

| Gate | Requirement | Evidence or observation | Result | Owner | Next action |
| --- | --- | --- | --- | --- | --- |
| Release identity | Version, build, date and availability agree | Public GitHub `v0.1.0` release targets merged `main`; asset digest matches verified ZIP | Ready | Tom Ballard | Keep release link and checksum consistent |
| Claims | Every used claim is verified or visibly qualified | C01-C12 and C14 verified; optional public Sites claim C13 blocked | Draft | Tom Ballard | Omit C13 unless Sites access changes and is rechecked |
| Assets | Required outputs exist and open correctly | Signed app/ZIP and fixtures ready; narrative draft exists; demo script/video missing | Draft | Tom Ballard | Produce and verify demo outputs |
| Technical | Channel and submission constraints pass | Official rules and authenticated live form verified; final media and populated preview not yet checked | Draft | Tom Ballard | Verify final video and complete-form preview |
| Accessibility | Captions, contrast, text alternatives and readability pass | Requirements recorded only | Missing | Tom Ballard | Caption and review final demo at delivery size |
| Privacy | No secrets, private data or embargoed details leak | Fixture-only policy and claims boundary established | Draft | Tom Ballard | Inspect every screenshot/frame and output |
| Links | Destinations and calls to action work | Public repository and signed download verified; video unresolved; Sites owner-only | Draft | Tom Ballard | Resolve video and optional Sites routes |
| Provenance | Required source and model-contribution records exist | Feedback ID, ledger, BUILDLOG/DEVLOG and commits present | Ready | Tom Ballard | Select concise citations for outputs |
| Authority | Publisher and manual action are explicit | Owner authorised public repository and GitHub `v0.1.0` release only | Blocked | Tom Ballard | Grant video, Sites and Devpost actions separately |
