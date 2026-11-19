# Jot — Makeitfuture build

Read `../../.agents/agent.md` from this directory for shared signing, notarization and FTPS policy. Based on https://github.com/lsuryatej/jot at `f862606d2895b7a11af552eec12750701088b073`. Preserve upstream attribution, licenses and user data.

Bundle ID `com.makeitfuture.Jot`, team `3J929KZ29B`, developer `tsocaci@makeitfuture.com`. Release configuration is public in `release-config.json`; Updates are managed only by Makeitfuture Apps. No Sparkle framework or self-updater is embedded. Release payloads reuse the existing `com.makeitfuture.Apps` signing key in Keychain; do not generate another key. Shared notary profile `InputStudio`.

Build with `./scripts/build-makeitfuture.sh`. Release with `NOTARY_PROFILE=InputStudio ./scripts/release-makeitfuture.sh`. Shared implementation in `../.agents/distribution/` prepares a catalogue-managed app and signs/notarizes with the shared identity. Publish matching source archives alongside immutable installers. Do not use upstream release/publish scripts: they may target other accounts or modify installed apps.

Feed: https://public.makeitfuture.eu/jot/appcast.xml
Installer: https://public.makeitfuture.eu/jot/Jot-3.dmg

Validation and actual publication outcomes will be recorded here when complete.

User policy confirmed 2026-11-11: only the catalogue embeds Sparkle. Other apps link to the catalogue to manage updates. All new payloads use the catalogue’s existing public key. Old per-app keys remain untouched for historical releases. Signing uses the stable Developer ID-signed tool at `~/.local/share/makeitfuture/sparkle/2.10.1/bin/generate_appcast`. Keychain password dialogs are handled by the user.

Publication requires the source/artifact-matched security gate in `../.agents/distribution/security_gate.py`. User policy: no app-originated external service calls. See `SECURITY_REVIEW.json` and `SECURITY_REVIEW.md` for the current audit and functional limitations.

## Reviewed release — 2026-11-11

Version 1.6.0, build 3. Catalogue-managed only; no embedded Sparkle. Payload signing reuses `com.makeitfuture.Apps`.

App notarization `3ab78ec0-f4a2-42e1-9b3d-78c800f4b2d6`; DMG notarization `21c860b9-4134-4bb9-a259-828fab661c91`: Accepted. Stapling, strict signatures and app Gatekeeper passed. Installer SHA-256 `6fe78d415fef8dfb8a05c3a07306962959c7296f3f41c693c62c297c8a01b53f`.

Installer: https://public.makeitfuture.eu/jot/Jot-3.dmg
Source: https://public.makeitfuture.eu/jot/Jot-3-source.zip

Security review: `SECURITY_REVIEW.md` and source/artifact-matched `SECURITY_REVIEW.json`. Publication and actual catalogue installation checks are recorded after final verification.

Final verification: canonical HTTPS installer/feed/source uploads matched local bytes. Corrected enclosure signatures verified independently with CryptoKit against the catalogue's existing public key. `MIF_INSTALLER_INTEGRATION=1 swift test` in Makeitfuture Apps passed all 17 checks: eight core regressions and nine real public-download/install/cancellation checks, including all six new apps. Copies were installed only in isolated temporary folders. Existing signed-copy replacement was also checked where an eligible installed copy existed. No real Pesty/Stats/Jot/ActivityWatch installation or user data was modified by those tests.

The app's own runtime contains no Sparkle. App Eraser's UI was opened for a read-only check; no removal was executed. Finicky's task-created installed copy was separately corrected to reviewed build 3, with the previous task-created copy retained under build/*.previous; its user configuration and default browser handlers were preserved.

## GitHub fork — 2026-11-19

Source fork: https://github.com/makeitfutureDev/jot, branch `makeitfuture`. `origin` points to the Makeitfuture fork; `upstream` preserves lsuryatej/jot. The branch saves the current local Makeitfuture changes and preserves upstream history/licenses. Release artifacts, credentials and signing material remain excluded. Shared release helpers in the parent workspace’s `.agents/distribution/` are required and are not part of this app repository. This source backup does not publish a new installer or renew a historical security review.
