# GitHub repository – current setup

The repository **CrobIT-Solution/LootOwner** is available as a **public** repository, with default branch `main`. The first public beta candidate is 0.1.0 Beta r1, using the unchanged 0.0.12 Lua gameplay code. Maintainer: Blackiron.

- Repository: https://github.com/CrobIT-Solution/LootOwner
- Addon source: `LootOwner.lua` and `LootOwner.toc` in the repository root
- Release documentation: `README.md`, `CHANGELOG.md`, `docs/`
- Optional local packaging: `scripts/New-LootOwnerPackage.ps1`
- GitHub Actions / CI: none
- CurseForge beta release: **preparation in progress, not yet uploaded**
- License: **GNU GPL v3 only (`GPL-3.0-only`)**

## Working locally

With Git installed and authenticated:

```powershell
git clone https://github.com/CrobIT-Solution/LootOwner.git
cd LootOwner
.\scripts\New-LootOwnerPackage.ps1
```

The packaging script writes `Loot-Owner_b_0.1.0_r1.zip` under `dist/`. GitHub's automatic Source code ZIP is not the installable WoW addon ZIP.

## Before a public release

1. Confirm the license text is present in the addon ZIP and third-party rights remain respected.
2. Review the documented beta limitation in `docs/TESTSTATUS.md`.
3. Verify the release ZIP contains a single `LootOwner/` install folder.
4. Publish only on explicit maintainer approval.

No game account credentials, private SavedVariables, or other players' data belong in the repository.
