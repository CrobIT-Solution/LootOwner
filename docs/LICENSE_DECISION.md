# LootOwner – GNU GPL v3 license decision

**Decision (2026-11-11): GNU General Public License Version 3 only**, SPDX identifier `GPL-3.0-only`.

This matches the documented license decision for **CrobIT-Solution/WoW-Market**. The license permits use, modification and redistribution under its conditions, including copyleft obligations. **GPLv3 does not prohibit all commercial use.** Blizzard's separate rules for addons still apply.

## Implementation

- Complete license: [LICENSE](../LICENSE) in the public source repository.
- Complete license copy in `LICENSE.txt` shipped with the installable addon ZIP.
- `LootOwner.toc` declares `## X-License: GPL-3.0-only`.
- Copyright (C) 2026 CrobIT-Solution for its own original contributions.
- In-game developer/maintainer credit: Blackiron.
- `LootOwner.lua` is unchanged from the tested 0.0.12 beta candidate.
- Source repository: https://github.com/CrobIT-Solution/LootOwner

## Scope

LootOwner optionally reads MobInfo2 tooltip fields and does not bundle or modify MobInfo2 files. The LootOwner GPL license does not relicense MobInfo2, Blizzard trademarks, game artwork, client code or third-party data.

A review of the current files found no copied MobInfo2 source files or embedded external license headers; this is not a conclusive independent code-provenance audit. Appropriate third-party notices must be retained if any copyrighted material is introduced later.

## CurseForge submission checks

- [x] License chosen: GPL-3.0-only.
- [x] Full license text in the repository.
- [x] License text in the packaged addon as LICENSE.txt.
- [x] TOC license metadata.
- [ ] Verify the exact ZIP contents and SHA256 before uploading.
- [ ] Supply an original project icon (minimum 400x400px).
- [ ] Confirm the project fields and beta release type before submission.

Authoritative GPL text: https://www.gnu.org/licenses/gpl-3.0.html
