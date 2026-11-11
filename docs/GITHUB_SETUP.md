# GitHub repository – current setup

The repository **CrobIT-Solution/LootOwner** has been created as a **private** repository, with default branch `main`. The initial import is the 0.0.12 Beta Candidate. Maintainer: Blackiron.

- Repository: https://github.com/CrobIT-Solution/LootOwner
- Addon source: `LootOwner.lua` and `LootOwner.toc` in the repository root
- Release documentation: `README.md`, `CHANGELOG.md`, `docs/`
- Optional local packaging: `scripts/New-LootOwnerPackage.ps1`
- GitHub Actions / CI: none
- Public release: **not approved**
- License: **not yet selected**

## Working locally

With Git installed and authenticated:

```powershell
git clone https://github.com/CrobIT-Solution/LootOwner.git
cd LootOwner
.\scripts\New-LootOwnerPackage.ps1
```

The packaging script writes the addon ZIP under `dist/`. GitHub's automatic Source code ZIP is not the installable WoW addon ZIP.

## Before a public release

1. Confirm file rights and select a license.
2. Review the documented beta limitation in `docs/TESTSTATUS.md`.
3. Verify the release ZIP contains a single `LootOwner/` install folder.
4. Publish only on explicit maintainer approval.

No game account credentials, private SavedVariables, or other players' data belong in the repository.
