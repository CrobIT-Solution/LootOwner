-- LootOwner 0.0.12 CLEAN TEST for WoW Forever 1.60.1
-- Standalone addon: works with or without MobInfo2; never modifies MobInfo2.
-- No addon messages: other group members do NOT need this addon.
-- Important: CanLootUnit checks THIS player's loot access, not another player's identity.

local LABEL = "Beuterecht"
local UPDATE_INTERVAL = 0.25
local VIOLET = { 0.831, 0.361, 1.000 }  -- #D45CFF (own loot)
local RED    = { 1.000, 0.333, 0.333 }  -- #FF5555 (verified other owner)
local GREY   = { 0.718, 0.718, 0.765 }  -- #B7B7C3 (unknown / empty)

local function checked(fn, ...)
    if type(fn) ~= "function" then return nil, nil end
    local ok, first, second = pcall(fn, ...)
    if not ok then return nil, nil end
    if type(issecretvalue) == "function" then
        local safeA, isSecretA = pcall(issecretvalue, first)
        local safeB, isSecretB = pcall(issecretvalue, second)
        if (safeA and isSecretA) or (safeB and isSecretB) then return nil, nil end
    end
    return first, second
end

local function normalText(value)
    if type(value) ~= "string" then return nil end
    if type(issecretvalue) == "function" then
        local ok, secret = pcall(issecretvalue, value)
        if not ok or secret then return nil end
    end
    -- Strip formatting before matching a possible character name.
    return (value:gsub("|c%x%x%x%x%x%x%x%x", ""):gsub("|r", "")
        :gsub("^%s+", ""):gsub("%s+$", ""))
end

local function groupNames()
    local allowed = {}
    local ambiguous = {}
    local fullNames = {}

    local function add(unit)
        if checked(UnitExists, unit) ~= true then return end
        local name, realm = checked(UnitFullName, unit)
        if not name then name, realm = checked(UnitName, unit) end
        name, realm = normalText(name), normalText(realm)
        if not name or name == "" then return end
        local full = (realm and realm ~= "") and (name .. "-" .. realm) or name
        fullNames[full:lower()] = name
        local key = name:lower()
        if allowed[key] and allowed[key] ~= full then
            ambiguous[key] = true
        else
            allowed[key] = full
        end
    end

    add("player")
    if checked(IsInRaid) == true then
        local count = checked(GetNumGroupMembers)
        if type(count) == "number" then
            for index = 1, math.min(count, 40) do add("raid" .. index) end
        end
    elseif checked(IsInGroup) == true then
        local count = checked(GetNumGroupMembers)
        if type(count) == "number" then
            for index = 1, math.min(math.max(count - 1, 0), 4) do
                add("party" .. index)
            end
        end
    end

    local function matchName(value)
        value = normalText(value)
        if not value then return nil end
        -- Only exact roster names, not guessed taps / nearest attackers.
        local lower = value:lower()
        if fullNames[lower] then return fullNames[lower] end
        if not ambiguous[lower] and allowed[lower] then
            return value:match("^[^-]+")
        end
        return nil
    end
    return matchName
end

-- A genuine loot-right holder may be present in Blizzard's *original* tooltip.
-- In 2.3 this existed for grouped corpses; Forever's availability is not
-- guaranteed. Never read unrelated "UnitOwner" (the owner of a pet).
local OWNER_LABELS = {
    "^beuterecht:%s*(.+)$",
    "^plünderrecht:%s*(.+)$",
    "^pluenderrecht:%s*(.+)$",
    "^plünderberechtigt:%s*(.+)$",
    "^berechtigt zum plündern:%s*(.+)$",
    "^die beute gehört%s+(.+)$",
    "^loot rights:%s*(.+)$",
    "^looting rights:%s*(.+)$",
    "^lootable by:%s*(.+)$",
    "^looted by:%s*(.+)$",
    "^loot belongs to:%s*(.+)$",
    "^looting by%s+(.+)$",
    "^loot:%s*(.+)$",
    "^looter:%s*(.+)$",
}

local function nameFromLine(value, matchName)
    value = normalText(value)
    if not value then return nil end
    -- Lua's lowercasing is ASCII-only; umlauts in the middle remain intact.
    local lowercase = value:lower()
    -- WoW Forever supplies this precise line in the original corpse tooltip.
    -- It is already authoritative; it does not require a group roster lookup
    -- (which can lose Forever surnames). Never infer owners from combat data.
    local direct = lowercase:match("^plündern:%s*(.+)$")
        or lowercase:match("^pluendern:%s*(.+)$")
    if direct and #direct > 0 then
        return normalText(value:sub(#value - #direct + 1))
    end
    for _, pattern in ipairs(OWNER_LABELS) do
        local candidate = lowercase:match(pattern)
        if candidate then
            -- Obtain original case: remove the same number of prefix bytes.
            local original = value:sub(#value - #candidate + 1)
            local name = matchName(original)
            if name then return name end
        end
    end
    return nil
end

local function nameFromPair(left, right, matchName)
    left = normalText(left)
    if not left then return nil end
    local label = left:lower():gsub(":$", "")
    if label == "plündern" or label == "pluendern" then
        return normalText(right)
    end
    if label == "beuterecht" or label == "plünderrecht"
        or label == "pluenderrecht" or label == "loot rights"
        or label == "looting rights" or label == "looter"
        or label == "lootable by" then
        return matchName(right)
    end
    return nil
end

local function originalTooltipOwner(unit)
    local matchName = groupNames()
    -- Read the game's tooltip data directly, including when MobInfo2 hides
    -- the standard tooltip and draws MI2_TooltipFrame instead.
    if C_TooltipInfo and type(C_TooltipInfo.GetUnit) == "function" then
        local data = checked(C_TooltipInfo.GetUnit, unit)
        if type(data) == "table" and type(data.lines) == "table" then
            for _, entry in ipairs(data.lines) do
                if type(entry) == "table" then
                    local name = nameFromLine(entry.leftText, matchName)
                        or nameFromLine(entry.rightText, matchName)
                        or nameFromPair(entry.leftText, entry.rightText, matchName)
                    if name then return name end
                end
            end
        end
    end

    -- On some clients the original line may be available only on GameTooltip.
    -- Our own line never matches this loop: LABEL is displayed separately.
    local tooltipUnit = GameTooltip and type(GameTooltip.GetUnit) == "function"
        and select(2, checked(GameTooltip.GetUnit, GameTooltip))
    local sameUnit = tooltipUnit == unit
        or (type(tooltipUnit) == "string" and checked(UnitIsUnit, tooltipUnit, unit) == true)
    if GameTooltip and GameTooltip:IsShown() and sameUnit
        and type(GameTooltip.NumLines) == "function" then
        local count = checked(GameTooltip.NumLines, GameTooltip)
        if type(count) == "number" then
            for i = 2, math.min(count, 40) do
                local left = _G["GameTooltipTextLeft" .. i]
                local right = _G["GameTooltipTextRight" .. i]
                local name = left and nameFromLine(checked(left.GetText, left), matchName)
                if not name and right then
                    name = nameFromLine(checked(right.GetText, right), matchName)
                        or nameFromPair(left and checked(left.GetText, left),
                            checked(right.GetText, right), matchName)
                end
                if name then return name end
            end
        end
    end

    -- MobInfo2's custom tooltip copies the native lines into these frames.
    -- Only use the copy when its recorded GUID belongs to THIS mouseover
    -- corpse, not another corpse of the same species seen previously.
    local currentGUID = checked(UnitGUID, unit)
    local mi2 = _G.MI2_TooltipFrame
    if mi2 and type(mi2.IsShown) == "function" and mi2:IsShown()
        and type(currentGUID) == "string" and currentGUID ~= ""
        and _G.MI2_MouseoverIndex == currentGUID then
        for i = 1, 10 do
            local extra = _G["MI2TT_ExtraInfo" .. i]
            local owner = extra and nameFromLine(checked(extra.GetText, extra), matchName)
            if owner then return owner end
        end
    end
    return nil
end

-- UNIT_LOOT is a unit-wide state change, unlike CanLootUnit, which can
-- return false/false for loot that belongs to someone else. The original
-- tooltip (and MobInfo2's copy of it) can lag behind a corpse becoming empty.
-- Remember recent unit-wide loot events by GUID so that a stale owner line
-- cannot re-display our hint after UNIT_LOOT reports no loot.
-- The cache is bounded, ephemeral and is not stored in SavedVariables.
local lootState = {}
local lootOrder = {}
local MAX_TRACKED_CORPSES = 128
local function recordLootState(guid, hasLoot)
    if type(guid) ~= "string" or guid == "" or type(hasLoot) ~= "boolean" then
        return
    end
    if lootState[guid] == nil then
        lootOrder[#lootOrder + 1] = guid
        if #lootOrder > MAX_TRACKED_CORPSES then
            local oldest = table.remove(lootOrder, 1)
            lootState[oldest] = nil
        end
    end
    lootState[guid] = hasLoot
end

-- A native confirmed loot-owner name takes priority over CanLootUnit,
-- EXCEPT if UNIT_LOOT has since explicitly marked this specific corpse empty.
-- On WoW Forever, foreign *unlooted* corpses can still return false,false.
local function isOwnCharacter(owner)
    owner = normalText(owner)
    if not owner then return false end
    local candidate = owner:lower()
    local display = normalText(checked(GetUnitName, "player", true))
    local first, surname = checked(UnitFullName, "player")
    first, surname = normalText(first), normalText(surname)
    local fallback = normalText(checked(UnitName, "player"))
    if display and candidate == display:lower() then return true end
    if first and surname and surname ~= ""
        and candidate == (first .. " " .. surname):lower() then return true end
    if first and candidate == first:lower() then return true end
    if fallback and candidate == fallback:lower() then return true end
    return false
end

local function status(unit)
    if checked(UnitExists, unit) ~= true then return nil end
    if checked(UnitIsPlayer, unit) ~= false then return nil end
    if checked(UnitPlayerControlled, unit) == true then return nil end

    local dead = checked(UnitIsDeadOrGhost, unit)
    if dead == false then
        if checked(UnitIsTapDenied, unit) == true then
            return "Für Dich gesperrt (Besitzer unbekannt)", GREY
        end
        -- No owner has been verified for a living enemy.
        return nil
    end
    if dead ~= true then return nil end

    local guid = checked(UnitGUID, unit)
    -- A *unit-wide* no-loot notification beats even a stale native/MobInfo2
    -- "Plündern: Name" line. Do not infer emptiness from CanLootUnit(false).
    if type(guid) == "string" and lootState[guid] == false then
        return nil
    end
    local hasLoot, canLoot
    if type(guid) == "string" and guid ~= "" then
        hasLoot, canLoot = checked(CanLootUnit, guid)
    end

    -- A CURRENT explicit native "Plündern: Name" line is stronger evidence
    -- than hasLoot == false: that value is false for foreign group loot too.
    -- When the name disappears from the current tooltip, false suppresses
    -- the line on an empty corpse just as in 0.0.6.
    local owner = originalTooltipOwner(unit)
    if owner then
        if isOwnCharacter(owner) then
            return "Die Beute gehört Dir", VIOLET
        end
        return "Die Beute gehört " .. owner, RED
    end
    if hasLoot == false then return nil end

    if hasLoot == true and canLoot == true then
        return "Die Beute gehört Dir", VIOLET
    end

    -- 'No loot' is not proof that someone else owns the corpse.
    if hasLoot == true and canLoot == false then
        return "Für Dich gesperrt (Besitzer unbekannt)", GREY
    end
    if checked(UnitHasLootInteraction, unit) == true then
        return "Du darfst plündern", VIOLET
    end
    return "Beutebesitzer unbekannt", GREY
end

local function gameTooltipUnit(tooltip)
    if not tooltip or type(tooltip.GetUnit) ~= "function" then return nil end
    local _, unit = checked(tooltip.GetUnit, tooltip)
    if type(unit) == "string" then return unit end
    return nil
end

-- MobInfo2 is optional. In its default mode it draws MI2_TooltipFrame;
-- otherwise (including no MobInfo2 installed) use the native GameTooltip.
-- Do not infer MobInfo2 presence merely from stale SavedVariables.
local function useGameTooltipMode()
    local custom = _G.MI2_TooltipFrame
    return not (MobInfoConfig and custom and MobInfoConfig.UseGameTT ~= 1)
end

local function updateGameTooltip(tooltip)
    if tooltip ~= GameTooltip then return end
    if not useGameTooltipMode() then return end
    if not tooltip:IsShown() then return end
    local unit = gameTooltipUnit(tooltip)
    if not unit then return end

    local message, color = status(unit)
    for index = 2, tooltip:NumLines() do
        local left = _G["GameTooltipTextLeft" .. index]
        if left and checked(left.GetText, left) == LABEL then
            local right = _G["GameTooltipTextRight" .. index]
            if not message then
                -- GameTooltip has no supported RemoveLine API. Clearing
                -- both texts prevents a stale Beuterecht hint on empty mobs.
                left:SetText("")
                if right then right:SetText("") end
            elseif right then
                right:SetText(message)
                right:SetTextColor(color[1], color[2], color[3])
            end
            return
        end
    end
    if message then
        tooltip:AddDoubleLine(LABEL, message, 1, 0.82, 0, color[1], color[2], color[3])
        tooltip:Show()
    end
end

if TooltipDataProcessor and type(TooltipDataProcessor.AddTooltipPostCall) == "function"
    and Enum and Enum.TooltipDataType and Enum.TooltipDataType.Unit then
    TooltipDataProcessor.AddTooltipPostCall(Enum.TooltipDataType.Unit, updateGameTooltip)
elseif GameTooltip then
    GameTooltip:HookScript("OnTooltipSetUnit", updateGameTooltip)
end

-- MobInfo2 default mode uses a separate MI2_TooltipFrame. The non-clickable
-- status strip is anchored immediately below it; we never modify MI2's frame.
local panel = CreateFrame("Frame", nil, UIParent, "BackdropTemplate")
panel:SetFrameStrata("TOOLTIP")
panel:SetHeight(22)
panel:SetBackdrop({
    bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
    tile = true, tileSize = 16, edgeSize = 12,
    insets = { left = 3, right = 3, top = 3, bottom = 3 },
})
panel:SetBackdropColor(0, 0, 0, 0.88)
panel:SetBackdropBorderColor(0.5, 0.5, 0.5, 1)
panel:EnableMouse(false)
panel:Hide()
local text = panel:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
text:SetPoint("CENTER", panel, "CENTER", 0, 0)

local elapsed = 0
local updater = CreateFrame("Frame")
-- WoW Forever exposes the synchronous UNIT_LOOT(GUID, hasLoot) event.
-- This is the only new source of loot state in 0.0.9; we do not hook into
-- MobInfo2 or guess based on chat messages or group-member actions.
local lootEvents = CreateFrame("Frame")
lootEvents:RegisterEvent("UNIT_LOOT")
lootEvents:SetScript("OnEvent", function(_, event, guid, hasLoot)
    if event ~= "UNIT_LOOT" then return end
    if type(issecretvalue) == "function" then
        local okGuid, secretGuid = pcall(issecretvalue, guid)
        local okLoot, secretLoot = pcall(issecretvalue, hasLoot)
        if not okGuid or secretGuid or not okLoot or secretLoot then return end
    end
    recordLootState(guid, hasLoot)
    -- Refresh our visible UI immediately for the affected corpse, instead
    -- of waiting for the next cursor movement. Other corpses are untouched.
    if guid ~= checked(UnitGUID, "mouseover") then return end
    if useGameTooltipMode() then
        if GameTooltip and GameTooltip:IsShown() then
            updateGameTooltip(GameTooltip)
        end
    elseif hasLoot == false then
        panel:Hide()
    end
end)

updater:SetScript("OnUpdate", function(_, delta)
    elapsed = elapsed + delta
    if elapsed < UPDATE_INTERVAL then return end
    elapsed = 0

    if useGameTooltipMode() then
        panel:Hide()
        if GameTooltip and GameTooltip:IsShown() then updateGameTooltip(GameTooltip) end
        return
    end

    local mi2 = _G.MI2_TooltipFrame
    if not mi2 or not mi2:IsShown() then panel:Hide() return end
    local message, color = status("mouseover")
    if not message then panel:Hide() return end

    text:SetText(message)
    text:SetTextColor(color[1], color[2], color[3])
    panel:SetWidth(math.max(mi2:GetWidth(), text:GetStringWidth() + 20))
    panel:ClearAllPoints()
    panel:SetPoint("TOPLEFT", mi2, "BOTTOMLEFT", 0, -2)
    panel:Show()
end)
