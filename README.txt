LootOwner 0.1.1 LANGUAGE TEST - WoW Forever 1.60.1
======================================================

LOCALIZATION / SPRACHAUSWAHL
The addon automatically follows your game client's language:
- German client (deDE): German tooltip messages.
- English client (enUS/enGB): English tooltip messages.
- Other client languages: English fallback.

Das Addon verwendet automatisch die Sprache des WoW-Clients:
- Deutsch (deDE): deutsche Tooltip-Meldungen.
- Englisch (enUS/enGB): englische Tooltip-Meldungen.
- Andere Sprachen: Englisch als Standardsprache.

This is a local TEST candidate, not an approved CurseForge release.

WHAT IT DOES
LootOwner adds loot ownership information to NPC corpse tooltips:
- Your own loot: "The loot belongs to you" (English),
  "Die Beute gehört Dir" (German), bright violet.
- Another confirmed owner: "The loot belongs to <Name>" (English),
  "Die Beute gehört <Name>" (German), red.
- No additional line on an empty corpse when that state can be established.

The addon works independently of MobInfo2. MobInfo2 is optional.
Other players do not need to install LootOwner. There is no automated
looting, player communication or persistent tracking database.
Owner names are shown only when a suitable WoW tooltip line is available.

IMPORTANT KNOWN LIMITATION
If a *group member* has fully looted a corpse, the red ownership hint may
remain on screen. The client may retain a stale native/MobInfo2 ownership
line and may not send a reliably attributable empty-loot event to this
client. The remaining text does NOT mean that loot is still available.
LootOwner does not infer or guess an empty state from chat loot messages.

INSTALLATION
1. Place the LootOwner folder in World of Warcraft/_forever_/Interface/AddOns.
2. Enable LootOwner in the AddOns menu. MobInfo2 is not required.
3. Use /reload after updating (where supported by your client).
4. Remove older versions of the LootOwner folder before installing.

TESTING
- Own-loot violet hint and disappearing after fully looting were
  confirmed in the WoW Forever client for version 0.0.12.
- 0.0.12 local simulated Lua tests cover standalone and MobInfo2 modes.
- The known limitation for group corpses remains unresolved.

CREDITS AND SCOPE
Maintainer/author: Blackiron.
Copyright (C) 2026 CrobIT-Solution for its original contributions.
License: GNU GPL version 3 only (GPL-3.0-only); see LICENSE.txt.
Source: https://github.com/CrobIT-Solution/LootOwner
LootOwner is an independent addon and contains no MobInfo2 source files.
0.1.1 Language Test modifies only displayed UI text, addon version
metadata and release documentation; loot-owner detection remains unchanged.

STATUS
LOCAL TEST CANDIDATE, not a stable release. Licensed under GPL-3.0-only.
Do not upload this file to CurseForge before in-game language acceptance.
