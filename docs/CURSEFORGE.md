# CurseForge release preparation (not submitted)

- **Project name:** LootOwner
- **Summary:** Displays loot ownership in NPC tooltips, with or without MobInfo2.
- **Author / Maintainer:** Blackiron
- **Compatibility:** World of Warcraft Forever 1.60.1 only (as tested/targeted)
- **Release file:** packaged `LootOwner_0.0.12_BETA_CANDIDATE.zip` with root `LootOwner/`
- **Release channel:** Beta (not Stable)
- **MobInfo2 dependency:** Optional only
- **License:** Pending author selection

## Suggested English description

LootOwner is a lightweight World of Warcraft Forever addon displaying loot ownership in NPC corpse tooltips. Your own confirmed loot is highlighted in bright violet; other players' names appear in red when the game provides a reliable owner name. LootOwner runs with or without MobInfo2. Group members do not have to install it.

**Known beta limitation:** The red ownership line for another group member can remain visible even after that member has completely looted the corpse, because no reliably attributable empty-loot state has been confirmed. An owner name is not proof that loot remains. LootOwner does not guess loot states.

### Before publishing

- Choose a license and check source provenance.
- Check that the project name is available in CurseForge.
- Verify target game-version options and metadata in CurseForge's current form.
- Check that the upload contains the `LootOwner/` install folder, not the repository root or docs/scripts.
- Publish only after the maintainer's explicit approval.
