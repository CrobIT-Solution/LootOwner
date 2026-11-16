# Test status – LootOwner 0.1.1 localization TEST (feature branch)

**2026-11-15:** 13 local Lua simulation scenarios passed: German and English own loot, verified foreign-owner name, gray states, no-loot hiding, enGB and non-DE locale English fallbacks. The tests use a stubbed WoW tooltip API with Lua 5.4, not the real client. Tooltip logic is otherwise unchanged from 0.1.0. **No 0.1.1 in-game test and no CurseForge submission.**

## Extended local English tests – 2026-11-16

- **32 synthetic Lua scenarios executed against the exact 0.1.1 test-package source** (Git blob `75bbcdf9739d836163b47cf363d29e0c6f596c64`); **28 expected cases passed, 0 unexpected failures, 4 exploratory input patterns exposed detection gaps**.
- Tested German and English locale output, `enGB`/other locales with English fallback, colored own/other/unknown messages, exact English owner strings supplied by simulated tooltip data, MobInfo2 custom tooltip and stale GUID rejection, and `UNIT_LOOT` empty-state and unrelated-GUID behavior.
- For hypothesized English original lines `Loot: Mojo Burner` without a matching full-name party roster, `Loot: Mojo Burner` with only `Mojo` on the roster, `Looting: Mojo Burner`, and a split `Loot` / `Mojo Burner` native line, **the synthetic addon returned no owner**. These inputs are *hypotheses*, not authentic observations of WoW Forever's English client.
- This establishes a **coverage gap**: English tooltip parsing has not been confirmed for all possible real client formats. Do **not** infer that the addon is broken in the genuine English client without an observed source string.
- **No gameplay code modifications**; no English in-game acceptance and no additional tests from other players. The user will only test with their installed **German WoW client**.
- ZIP SHA-256 checked: `3a2ee9d9c8825fa69ac7efb9031e5fe33246fe0e9be2b1ddfdb0d0361056cc24`.
- Language test is **not ready to claim complete English in-game verification**. UX gate remains **Noch nicht geprüft**.
- `main` remains pinned at `5309b129e506f99b26ff8cf35ec3beb6b43dfc07`. No CI, merges, tags, or CurseForge updates.

## Historical evidence: LootOwner 0.1.0 Beta r1

The actual Lua gameplay code is unchanged from 0.0.12. The new 0.1.0 ZIP is a release candidate; prior in-game checks are not new 0.1.0 test results.

This records user-observed in-game results and earlier reported simulations. It is **not a claim of full compatibility**.

| Scenario | Status | Evidence/qualification |
|---|---|---|
| Own loot displays in violet | **Passed (in game)** | User confirmed 0.0.12 |
| Own loot hint disappears after full looting | **Passed (in game)** | User confirmed 0.0.12 |
| `/reload` after an update | **Passed (in game)** | User previously confirmed 0.0.6; not a new 0.0.12 test |
| Runs without MobInfo2 | **Observed (in game)** | Previous version 0.0.6 confirmed; 0.0.12 code path unchanged in intent |
| Name of another eligible group player | **Observed in tests** | Earlier builds observed correct names; depends on actual tooltip |
| Hint disappears after *another group member* loots | **Known issue / failed** | Hint may persist on a fully looted corpse |
| Local Lua simulated checks | **Reported passed** | Previous 0.0.12 work reported 20/20; synthetic, not an in-client test |

Do **not** invent loot ownership or infer an empty corpse from a loot chat event without a reliable corpse GUID and verified state. No additional tests involving other players are requested at this stage.
