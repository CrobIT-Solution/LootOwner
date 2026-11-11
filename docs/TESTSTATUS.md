# Test status – LootOwner 0.0.12

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
