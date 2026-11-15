# LootOwner

**Independent loot ownership tooltip addon for World of Warcraft Forever.**  
Current development status on this feature branch: **0.1.1 localization TEST (unreleased)**. The previous 0.1.0 Beta r1 package is unchanged.

LootOwner adds a compact loot-ownership hint to NPC corpse tooltips. It works **with or without MobInfo2** and does not require other players to install the addon.

## Language support (0.1.1 test)

The addon automatically displays German text on a `deDE` client, English on `enUS` / `enGB` clients, and English as a fallback for other client locales. This includes the loot-rights tooltip heading, own/other owner messages and neutral messages. There is no language menu and no player setting. **Localization is only simulated-tested so far; the 0.1.1 version still needs in-game acceptance.**

Deutsch: Das Addon verwendet die Sprache des WoW-Clients für die Tooltip-Meldungen (Deutsch oder Englisch). Die frühere Version 0.1.0 bleibt als eigenständiger Beta-Stand erhalten.

## Features

- **Your own loot:** `Die Beute gehört Dir` in bright violet (`#D45CFF`).
- **Confirmed other owner:** `Die Beute gehört <Player Name>` in red (`#FF5555`) when a reliable owner name is present in the game's tooltip.
- **Empty corpse:** hides the added hint if a trustworthy empty-loot state is available.
- Works independently of MobInfo2; no change to MobInfo2 files.
- No automatic looting, no player communication, no personal data collection or persistent database.

## Known beta limitation

When **another group member** completely loots a corpse, the red ownership hint can **remain visible**. The original tooltip can keep the old owner name even after the corpse is empty; a reliably attributable empty-loot event has not been confirmed for this case. **An ownership hint is not proof that loot remains.** LootOwner deliberately does not guess or infer corpse state from chat loot messages.

## Compatibility

- Confirmed target: **WoW Forever 1.60.1** (`## Interface: 16001`).
- Other WoW variants/builds: **not verified**.
- MobInfo2: **optional**, not a dependency.

## Installation

Install the **release ZIP**, not GitHub's automatically generated *Source code* ZIP:

1. Extract the included `LootOwner` folder to `World of Warcraft/_forever_/Interface/AddOns/`.
2. Enable **LootOwner** in the addon list.
3. After replacing its files, run `/reload` (tested in WoW Forever).
4. If updating, replace the old `LootOwner` folder; do not run older test builds alongside it.

## Status and tests

- Version 0.0.12: own-loot message and its removal after looting **confirmed by in-game test**.
- Previous testing: owner-name rendering was observed with MobInfo2 and standalone; behavior can depend on available game tooltip data.
- Earlier reported local Lua simulation tests: **20/20** passed for 0.0.12; these are not equivalent to live group tests.
- **Unresolved:** reliable disappearance of the *other player's* ownership hint after another group member finishes looting.
- The 0.1.0 Beta r1 package keeps the exact Lua gameplay code from 0.0.12; only metadata, documentation and packaging change.

See [test status](docs/TESTSTATUS.md) for details.

## Source and release packaging

The repository root contains `LootOwner.lua` and `LootOwner.toc`. The installable release archive must include a **single `LootOwner/` folder** containing five addon files (`LootOwner.lua`, `LootOwner.toc`, `README.txt`, `CHANGELOG.txt`, `LICENSE.txt`).

Optional Windows PowerShell 5.1+ helper:

```powershell
.\scripts\New-LootOwnerPackage.ps1
```

On this feature branch, the script prepares `Loot-Owner_b_0.1.1_r1_TEST.zip` under `dist/` for local testing only. No GitHub Actions, external tools or paid services are required to package it.

## Development and contributions

Maintainer / addon author: **Blackiron**. The original MobInfo2 source is **not bundled** and is **not modified** by this project. Please report issues with the WoW Forever build, whether MobInfo2 was active, reproduction steps, and any Lua errors. Do not upload personal account information or private game data.

## License status

**GNU General Public License version 3 only (`GPL-3.0-only`).** The original LootOwner code is licensed under the [GNU GPL v3](LICENSE), consistent with WoW-Market. Copyright (C) 2026 CrobIT-Solution for its own contributions; developer/maintainer: **Blackiron**. A complete copy ships in the installable addon as `LICENSE.txt`. Blizzard assets, MobInfo2 and third-party game data are not relicensed. See [license scope](docs/LICENSE_DECISION.md).

---

## Deutsch – Kurzfassung

LootOwner zeigt im Tooltip an, **wem die Beute gehört**: eigene bestätigte Beute in leuchtendem Violett, namentlich bestätigte fremde Besitzer in Rot. Das Addon funktioniert **mit und ohne MobInfo2**, ohne dass Gruppenmitglieder es installieren müssen.

**Bekannte Beta-Einschränkung:** Bei vollständig geplünderten **Gruppenleichen** kann die rote Besitzeranzeige bestehen bleiben. Sie beweist dann **nicht**, dass noch Beute vorhanden ist. Ohne eindeutig zugeordneten Leerzustand werden keine Aussagen geraten.

Installiere nur das **Installations-ZIP** (mit einem Ordner `LootOwner/`) nach `_forever_/Interface/AddOns/` und nutze anschließend `/reload`.

**Projektstand dieses Testbranches:** 0.1.1 Sprachtest, `GPL-3.0-only`. Noch kein bestätigter WoW-Ingame-Test für 0.1.1 und keine Freigabe zur CurseForge-Veröffentlichung dieser Version.
