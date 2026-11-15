# Changelog

## 0.1.1 – Localization test (2026-11-15, unreleased)

- Client-language tooltips: German (`deDE`) and English (`enUS`/`enGB`), English fallback.
- Tooltip heading and all added status messages are localized; colors are unchanged.
- Original native/MobInfo2 owner-name parsing and corpse-loot detection stay unchanged.
- 13 synthetic locale/UI cases passed; **no 0.1.1 in-game acceptance yet**.
- Existing issue: foreign group corpse owner hint can persist after fully looted.
- Separate test package: `Loot-Owner_b_0.1.1_r1_TEST.zip`.

## 0.1.0 – Beta r1 (2026-11-11)

- First public beta candidate, ZIP: `Loot-Owner_b_0.1.0_r1.zip`.
- Lua gameplay code unchanged from 0.0.12; TOC version updated to 0.1.0.

## 0.0.12 – Internal beta candidate (2026-11-11)

- License: **GPL-3.0-only**; full license text bundled as `LICENSE.txt`.

- First proposed public beta; release preparation only, **not yet published**.
- Preserves the proven gameplay functionality of the 0.0.12 test version.
- Works with or without MobInfo2.
- Confirmed own loot shown in violet; confirmed other owner shown in red.
- Drops diagnostic-only commands found in earlier test builds.
- **Known issue:** hint for another player's loot may persist after a group member finishes looting; no guessed loot state.
- Gameplay Lua and TOC remain unchanged from the already prepared 0.0.12 beta candidate.

Previous development versions 0.0.6–0.0.11 were internal tests and diagnostics, not public releases.
