# Jot security and privacy review

Reviewed 2026-11-11 for the Makeitfuture distribution.

Disabled automatic and manual Apple Notes sync, exchange-rate fetching, and upstream update requests. Currency conversions use cached or built-in rates. Removed the cloud-sync menu item.

Verification: 5,450 existing logic/layout checks passed after the privacy changes.

Limits: Manually copying or sharing text is a deliberate user action. No live rate or cloud-note service is contacted.

All updates are installed through Makeitfuture Apps. This app contains no Sparkle framework. No app-originated external services are enabled. Deliberate user navigation is separate from transmitting stored application data. Source review, dependency scanning and regression tests do not establish the absence of every possible vulnerability.

Publication is blocked unless SECURITY_REVIEW.json matches the current source, build and immutable installer SHA-256. A source or installer change requires another review.

Final installation verification: all 17 catalogue checks passed, including nine real signed public downloads/isolated installs. Catalogue-managed feeds explicitly sign installer payloads even though app bundles contain no Sparkle metadata. Publication independently verifies each payload signature with CryptoKit.
