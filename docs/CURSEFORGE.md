# LootOwner – CurseForge Beta-Vorbereitung (nicht eingereicht)

**Stand:** 2026-11-11  
**Ziel:** erster öffentlicher **Beta**-Kandidat aus **0.0.12**, ohne Änderungen am geprüften Lua-Code.  
**Wichtig:** Kein CurseForge-Projekt erstellt, keine Datei hochgeladen, kein GitHub-Release, keine Lizenz vergeben.

## Vorgesehene Projektfelder

| Feld | Geplanter Inhalt |
|---|---|
| Game | World of Warcraft |
| Game Version / Flavor | **WoW Forever – 1.60.1** |
| Project name | **LootOwner** (Eindeutigkeit beim Einreichen erneut kontrollieren) |
| Author / Maintainer credits | **Blackiron** |
| Class | Addons |
| Main category | Tooltip |
| Summary | `Shows who can loot NPC corpses, with optional MobInfo2 support.` |
| License | **Offen – Auswahl des Rechteinhabers erforderlich** |
| Main file type | **Beta** |
| Recommended dependency | MobInfo2 **optional**, niemals als Required Dependency kennzeichnen |
| Project source | `CrobIT-Solution/LootOwner` ist noch privat; ein öffentlicher Source-Link würde nicht funktionieren |

## English project description (copy-ready)

**LootOwner** is a lightweight loot ownership tooltip addon for **World of Warcraft Forever (1.60.1)**.

It highlights your own confirmed loot in bright violet and displays the name of another owner in red when the game provides a verifiable owner name. LootOwner works on its own and also alongside **MobInfo2**. Other players and group members do **not** need to install LootOwner.

LootOwner does not loot automatically, communicate with other players, or collect personal data.

### Known beta limitation

After another group member completely loots a corpse, a previously displayed red ownership line may remain visible. The original WoW/MobInfo2 tooltip can retain an old owner's name without giving LootOwner a reliably attributable empty-loot signal. **An owner name does not guarantee that loot is still present.** LootOwner deliberately does not guess corpse loot states.

### Installation

Install the **LootOwner** folder into `World of Warcraft/_forever_/Interface/AddOns/`. Enable the addon in the game's AddOns menu. You can use `/reload` after replacing existing addon files when supported by the client.

### Compatibility

Targeted and tested for **Forever 1.60.1**. Other WoW variants have not been verified. **MobInfo2 is optional.**

## Proposed file upload fields

- File name: `LootOwner_0.0.12_BETA_CANDIDATE.zip`.
- Display name: `LootOwner 0.0.12 Beta (WoW Forever)`.
- File Type: **Beta** – **not Stable Release**.
- Supported Game Version: **Forever 1.60.1 only**.
- Related Projects: MobInfo2 optionally recommended, never required; only if CurseForge permits and the project relationship is useful.
- Installable ZIP root: exactly `LootOwner/`, containing `LootOwner.lua`, `LootOwner.toc`, `README.txt`, `CHANGELOG.txt`.
- **Do not upload** repository source ZIP, `docs/` or `scripts/` as the installable Addon.
- Create the ZIP locally with `scripts/New-LootOwnerPackage.ps1`; inspect and checksum before any upload.

### English file changelog (copy-ready)

**LootOwner 0.0.12 – First Beta Candidate**
- Standalone loot ownership tooltip for WoW Forever 1.60.1.
- Displays your confirmed loot in violet and identifiable other owners in red.
- Optional compatibility with MobInfo2; no group-member installation required.
- Removes development-only diagnostic commands.
- Known issue: red ownership lines may remain after another player finishes looting the corpse. Loot state is never guessed.

## Checklist – no publication before all gates

- [x] Source and beta description prepared.
- [x] WoW Forever 1.60.1 / Interface 16001 selected as target.
- [x] Known group-empty-corpse limitation clearly disclosed.
- [x] MobInfo2 not required by addon.
- [ ] **License** selected and `LICENSE` checked in; GitHub/CurseForge license entries consistent.
- [ ] **Source-rights / credits** reviewed.
- [ ] **Original project icon** prepared, minimum 400 × 400 pixels (CurseForge guidance).
- [ ] **Project name** availability confirmed on CurseForge.
- [ ] **Release ZIP** built from a pinned commit and its contents inspected; confirm actual SHA256.
- [ ] Game version / release-type form options confirmed at time of submission.
- [ ] Optional in-game screenshots chosen; don't present the known issue as fixed.
- [ ] Explicit **separate release approval** from the owner.
- [ ] Only then create/submit the CurseForge project and upload file for moderation.

CurseForge notes: An approved Beta file can be available to CurseForge App users who opt into Beta files; the default download behavior is associated with the Release channel. Project and file moderation are separate from GitHub hosting.

Official documentation:
- https://support.curseforge.com/support/solutions/articles/9000197241-creating-and-submitting-a-project
- https://support.curseforge.com/support/solutions/articles/9000197242
- https://support.curseforge.com/support/solutions/articles/9000199552
