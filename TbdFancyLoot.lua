

local addonName, TbdFancyLoot = ...;

local WrathCloth = {
    [2589] = true,
    [2592] = true,
    [4306] = true,
    [4338] = true,
    [14047] = true,
    [21877] = true,
    [33470] = true,
}

local WrathEnchantingDustsShards = {
    [34054] = true,
    [16204] = true,
    [22445] = true,
    [46849] = true,
    [22449] = true,
    [34052] = true,
    [6338] = true,
    [14344] = true,
    [16206] = true,
    [22446] = true,
    [16203] = true,
    [25844] = true,
    [34057] = true,
    [10939] = true,
    [25845] = true,
    [41745] = true,
    [11137] = true,
    [16207] = true,
    [16202] = true,
    [10938] = true,
    [11176] = true,
    [11083] = true,
    [22461] = true,
    [44452] = true,
    [22462] = true,
    [10940] = true,
    [20725] = true,
    [22463] = true,
    [11174] = true,
    [11134] = true,
    [22447] = true,
    [11175] = true,
    [11128] = true,
    [34056] = true,
    [10998] = true,
    [11145] = true,
    [25843] = true,
    [22448] = true,
    [34053] = true,
    [6339] = true,
    [22450] = true,
    [6218] = true,
    [11144] = true,
    [11178] = true,
    [11082] = true,
    [11135] = true,
    [11139] = true,
    [14343] = true,
    [11177] = true,
    [11138] = true,
    [10978] = true,
    [11084] = true,
    [11130] = true,
    [6217] = true,
    [44451] = true,
    [41741] = true,
    [49640] = true,
    [6216] = true,
    [6374] = true,
    [36898] = true,
    [206759] = true,
}

local WrathHerbs = {
    [22788] = true,
    [36908] = true,
    [36903] = true,
    [3820] = true,
    [22792] = true,
    [36905] = true,
    [8838] = true,
    [8831] = true,
    [36907] = true,
    [3369] = true,
    [22790] = true,
    [2452] = true,
    [2450] = true,
    [3355] = true,
    [3357] = true,
    [4625] = true,
    [13465] = true,
    [2449] = true,
    [8153] = true,
    [8839] = true,
    [765] = true,
    [3356] = true,
    [3821] = true,
    [36904] = true,
    [8845] = true,
    [36906] = true,
    [8836] = true,
    [22791] = true,
    [2453] = true,
    [13463] = true,
    [36901] = true,
    [22786] = true,
    [2447] = true,
    [8846] = true,
    [13468] = true,
    [37921] = true,
    [13464] = true,
    [785] = true,
    [3358] = true,
    [13467] = true,
    [22785] = true,
    [3818] = true,
    [3819] = true,
    [22789] = true,
    [13466] = true,
    [22787] = true,
    [22794] = true,
    [22793] = true,
    [36902] = true,
    [19727] = true,
    [22797] = true,
    [19726] = true,
    [22710] = true,
}

local WrathMetalAndStone = {
    [18567] = true,
    [22203] = true,
    [2775] = true,
    [2771] = true,
    [2770] = true,
    [3857] = true,
    [23425] = true,
    [23426] = true,
    [3858] = true,
    [23424] = true,
    [7912] = true,
    [2776] = true,
    [2835] = true,
    [36910] = true,
    [10620] = true,
    [36912] = true,
    [2838] = true,
    [2772] = true,
    [2836] = true,
    [23427] = true,
    [12365] = true,
    [11370] = true,
    [22202] = true,
    [7911] = true,
    [36909] = true,
    [12809] = true,
    [17203] = true,
    [18562] = true,
    [41163] = true,
    [36913] = true,
    [36916] = true,
    [2842] = true,
    [37663] = true,
    [2840] = true,
    [23449] = true,
    [2841] = true,
    [23446] = true,
    [6037] = true,
    [23445] = true,
    [23447] = true,
    [3577] = true,
    [12360] = true,
    [7966] = true,
    [3576] = true,
    [12359] = true,
    [3859] = true,
    [3860] = true,
    [3575] = true,
    [35128] = true,
    [23573] = true,
    [23448] = true,
    [17771] = true,
    [11371] = true,
    [3470] = true,
    [3486] = true,
    [12644] = true,
    [3478] = true,
    [12655] = true,
    [11099] = true,
    [37706] = true,
    [36914] = true,
    [36911] = true,
    [36915] = true,
    [3861] = true,
}

local WrathGems = {
    [36784] = true,
    [7971] = true,
    [42225] = true,
    [36783] = true,
    [36918] = true,
    [13926] = true,
    [36917] = true,
    [36930] = true,
    [36932] = true,
    [36923] = true,
    [5500] = true,
    [36919] = true,
    [1529] = true,
    [36922] = true,
    [5498] = true,
    [36921] = true,
    [7910] = true,
    [12363] = true,
    [36929] = true,
    [1206] = true,
    [12799] = true,
    [1210] = true,
    [36920] = true,
    [36931] = true,
    [36927] = true,
    [23436] = true,
    [36926] = true,
    [12364] = true,
    [12800] = true,
    [45883] = true,
    [23112] = true,
    [36934] = true,
    [12361] = true,
    [818] = true,
    [36928] = true,
    [11382] = true,
    [3864] = true,
    [36933] = true,
    [36924] = true,
    [1705] = true,
    [23439] = true,
    [7909] = true,
    [36925] = true,
    [23079] = true,
    [24478] = true,
    [774] = true,
    [24479] = true,
    [45862] = true,
    [23441] = true,
    [45882] = true,
    [45987] = true,
    [23440] = true,
    [23077] = true,
    [30548] = true,
    [23117] = true,
    [32227] = true,
    [32249] = true,
    [45879] = true,
    [45880] = true,
    [21929] = true,
    [30549] = true,
    [23438] = true,
    [30550] = true,
    [32229] = true,
    [30574] = true,
    [30589] = true,
    [23107] = true,
    [30546] = true,
    [30583] = true,
    [30587] = true,
    [30588] = true,
    [30602] = true,
    [32230] = true,
    [30552] = true,
    [32228] = true,
    [30551] = true,
    [45881] = true,
    [23437] = true,
    [30573] = true,
    [30584] = true,
    [30593] = true,
    [30603] = true,
    [30606] = true,
    [30559] = true,
    [30572] = true,
    [30600] = true,
    [30604] = true,
    [41450] = true,
    [41492] = true,
    [41497] = true,
    [24029] = true,
    [30547] = true,
    [30553] = true,
    [30556] = true,
    [30558] = true,
    [30560] = true,
    [30563] = true,
    [30565] = true,
    [30566] = true,
    [30575] = true,
    [30581] = true,
    [30582] = true,
    [30585] = true,
    [30586] = true,
    [30590] = true,
    [30592] = true,
    [30594] = true,
    [30601] = true,
    [30605] = true,
    [30607] = true,
    [32231] = true,
    [41452] = true,
    [41468] = true,
    [30554] = true,
    [30555] = true,
    [30591] = true,
    [30608] = true,
    [32195] = true,
    [34831] = true,
    [41466] = true,
    [30564] = true,
}

local WrathSkins = {
    [44128] = true,
    [8170] = true,
    [38425] = true,
    [4304] = true,
    [21887] = true,
    [38558] = true,
    [33568] = true,
    [4234] = true,
    [25700] = true,
    [38557] = true,
    [38561] = true,
    [2319] = true,
    [4235] = true,
    [2318] = true,
    [8150] = true,
    [8154] = true,
    [4461] = true, 
    [2934] = true,
    [4232] = true,
    [8165] = true,
    [15409] = true, 
    [23793] = true,
    [783] = true,
    [8167] = true,
    [25649] = true,
    [5784] = true,
    [7392] = true,
    [29548] = true,
    [4236] = true,
    [29539] = true,
    [4233] = true, 
    [4289] = true,
    [12810] = true,
    [15407] = true,
    [17012] = true, 
    [29547] = true,
    [8172] = true,
    [15416] = true, 
    [15419] = true, 
    [33567] = true, 
    [15417] = true,
    [15415] = true, 
    [25699] = true,
    [25707] = true,
    [6471] = true,
    [15408] = true,
    [20498] = true,
    [20381] = true,
    [8171] = true,
    [4231] = true,
    [6470] = true,
    [8168] = true,
    [15412] = true,
    [25708] = true,
    [5082] = true,
    [5785] = true,
    [15410] = true,
    [7286] = true,
    [8169] = true,
    [17967] = true,
    [19768] = true,
    [20501] = true,
    [15414] = true,
    [20500] = true,
    [36987] = true,
    [49334] = true,
    [19767] = true, 
    [5116] = true,
}

local LootItemFramePool;

local function ScanPlayerBags()

    local ret = {
        numSlotsFree = 0,
        items = {},
    }

    for bag = 0, 4 do
        for slot = 1, C_Container.GetContainerNumSlots(bag) do
            local slotInfo = C_Container.GetContainerItemInfo(bag, slot)
            if slotInfo == nil then
                ret.numSlotsFree = ret.numSlotsFree + 1
            else
                if slotInfo.itemID then
                    
                end
            end
        end
    end

    return ret;
end

local function SortLoot(loot)
    table.sort(loot, function(a, b)
        if a.classID and b.classID then
            if a.classID == b.classID then
                if a.subClassID == b.subClassID then
                    if a.vendorPrice and b.vendorPrice then
                        return a.vendorPrice > b.vendorPrice
                    else
                        return a.index > b.index
                    end
                else
                    return a.subClassID < b.subClassID
                end
            else
                return a.classID < b.classID
            end
        else
            if a.vendorPrice and b.vendorPrice then
                return a.vendorPrice < b.vendorPrice
            else
                return a.index < b.index
            end
        end
    end)
end

local function RemoveLootSlotFrame(index)
    for frame in LootItemFramePool:EnumerateActive() do
        if frame.lootSlotData and (frame.lootSlotData.index == index) then
            LootItemFramePool:Release(frame)
        end
    end
end

--[[
    TODO:
    iter the pool, add frames to a local table
    loop the frames to perform a sort func
    loop again to anchor and position
]]

local function UpdateLootFramePositions()
    local lastFrame;
    for frame in LootItemFramePool:EnumerateActive() do
        frame:ClearAllPoints()
        if lastFrame == nil then
            frame:SetPoint("BOTTOM", 0, 0)
            lastFrame = frame;
        else
            frame:SetPoint("BOTTOM", lastFrame, "TOP", 0, 0)
            lastFrame = frame
        end
    end
end

local function CheckAutoLootRules(itemID, isQuestItem, itemQuality)

    local config = TbdFancyLootOptions;

    if (config.autoLootQuestItems == true) and (isQuestItem == true) then
        return true
    end

    if itemQuality > 1 then
        return true
    end

    if config.autoLootCloth == true then
        if WrathCloth[itemID] then
            return true
        end
    end

    if config.autoLootEnchantingDustShards == true then
        if WrathEnchantingDustsShards[itemID] then
            return true
        end
    end

    if config.autoLootHerbs == true then
        if WrathHerbs[itemID] then
            return true
        end
    end

    if config.autoLootOreAndStone == true then
        if WrathMetalAndStone[itemID] then
            return true
        end
    end

    if config.autoLootGems == true then
        if WrathGems[itemID] then
            return true
        end
    end

    if config.autoLootSkins == true then
        if WrathSkins[itemID] then
            return true
        end
    end

    for _itemID, autoLoot in pairs(config.autoLootWhiteList) do
        if _itemID == itemID then
            return true
        end
    end

    return false;

end

local function GetTargetLoot()

    --local playerBagInfo = ScanPlayerBags()
	-- if currencyID then 
	-- 	item, texture, quantity, itemQuality = CurrencyContainerUtil.GetCurrencyContainerInfo(currencyID, quantity, item, texture, itemQuality);
	-- end

    local t = {}
    local link, itemName, equipLoc, itemID, classID, subClassID, texture, quantity, currencyID, itemQuality, isQuestItem, questID, locked, startsQuest
    local showLoot, shouldAutoLoot, isBlackList

    local numLoot = GetNumLootItems()
    for i = 1, numLoot do
        if LootSlotHasItem(i) then

            texture, itemName, quantity, currencyID, itemQuality, locked, isQuestItem, questID, startsQuest = GetLootSlotInfo(i)
            
            if GetLootSlotType(i) == Enum.LootSlotType.Item then
                
                link = GetLootSlotLink(i)
                itemID, _, _, equipLoc, _, classID, subClassID = C_Item.GetItemInfoInstant(link)

                showLoot = true;
                shouldAutoLoot = CheckAutoLootRules(itemID, isQuestItem, itemQuality)

                --LootSlot(i)

                isBlackList = false;
                if TbdFancyLootOptions and (type(TbdFancyLootOptions.autoLootBlackList) == "table") and (TbdFancyLootOptions.autoLootBlackList[itemID] == true) then
                    isBlackList = true
                end

                --[[
                if (isBlackList == false) and (playerBagInfo.numSlotsFree > 0) and (shouldAutoLoot == true) then
                    LootSlot(i)
                    playerBagInfo = ScanPlayerBags() --get new bag info, kinda sucks but for now just full scan the bags
                    showLoot = false;
                end
                ]]

                if (isBlackList == true) then
                    --do nothing
                    showLoot = false
                else
                    if (shouldAutoLoot == true) then

                        --there are a few reasons why looting could fail
                        --leave the showLoot flag as true, when the slot is cleared it'll clean up the UI
                        --could maybe try to mask the show/hide if its unsightly
                        LootSlot(i)
                    end
                end


                if (showLoot == true) then
                    table.insert(t, {
                        link = link,
                        itemID = itemID,
                        quality = itemQuality,
                        icon = texture,
                        quantity = quantity,
                        index = i,
                        isQuestItem = isQuestItem,
                        questID = questID,
                        vendorPrice = 0,
                        classID = classID,
                        subClassID = subClassID,
                    })
                end

            elseif GetLootSlotType(i) == Enum.LootSlotType.Money then

                local info = GetLootInfo()
                if info[1] and info[1].item then
                    local money, c, s, g = {}, 0, 0, 0
					for word in string.gmatch(info[1].item, "%w+" ) do 
                        table.insert(money, word) 
                            
                        end
					for k, v in pairs(money) do
						if v == 'Copper' then
							c = money[k-1]
						elseif v == 'Silver' then
							s = money[k-1]
						elseif v == 'Gold' then
							g = money[k-1]
						end
					end
					local lootMoney = tonumber(c + (s * 100) + (g * 10000))

                    if (TbdFancyLootOptions.autoLootGold == true) then
                        LootSlot(i)
                    else
                        table.insert(t, {
                            copper = lootMoney,
                            index = i,
                            icon = texture,
                        })
                    end
                end
            end
        end
    end
    
    return t;
end










--[[
    Main Loot Window
]]

local Events = {
    "LOOT_OPENED",
    "LOOT_CLOSED",
    "LOOT_SLOT_CLEARED",
    --"BAG_UPDATE"
}

TbdFancyLootPersonalLootMixin = {}
function TbdFancyLootPersonalLootMixin:OnLoad()

    self:RegisterForDrag("LeftButton")

    for _, event in ipairs(Events) do
        self:RegisterEvent(event)
    end

    local LootItemResetFunc = function(_, frame)
        frame.lootSlotData = nil
        frame:Clear()
        frame:ClearAllPoints()
        frame:Hide()
    end

    LootItemFramePool = CreateFramePool("Frame", self, "TbdFancyLootPersonalLootItemTemplate", LootItemResetFunc)

    --should add a setting to allow the user to place the loot in a static location on the screen
    self:HookScript("OnShow", function()
        local uiScale, x, y = UIParent:GetEffectiveScale(), GetCursorPosition()
        self:ClearAllPoints()
        self:SetPoint("BOTTOMRIGHT", nil, "BOTTOMLEFT", x / uiScale, y / uiScale)
    end)

end

function TbdFancyLootPersonalLootMixin:OnEvent(event, ...)
    if self[event] then
        self[event](self, ...)
    end
end

function TbdFancyLootPersonalLootMixin:LoadLoot()

    LootItemFramePool:ReleaseAll()
    local loot = GetTargetLoot()

    if #loot == 0 then
        CloseLoot()
        return;
    end

    SortLoot(loot)

    for k, item in ipairs(loot) do
        local f = LootItemFramePool:Acquire()
        f:SetLootItem(item)
        f:Show()
    end

    UpdateLootFramePositions()

    self:Show()

end


local lastSlotCleared;
function TbdFancyLootPersonalLootMixin:LOOT_SLOT_CLEARED(...)
    local slotIndex = ...;
    --avoid a double call due to events firing twice
    if slotIndex == lastSlotCleared then
        return
    end
    lastSlotCleared = slotIndex
    RemoveLootSlotFrame(slotIndex)
    UpdateLootFramePositions()
end

function TbdFancyLootPersonalLootMixin:LOOT_CLOSED(...)
    self:Hide()
    LootItemFramePool:ReleaseAll()
end

function TbdFancyLootPersonalLootMixin:LOOT_OPENED(...)

    lastSlotCleared = nil

    self.currentCopper = GetMoney()

    local autoLoot, isFromItem = ...;

    LootFrame:ClearAllPoints()
    LootFrame:SetClampedToScreen(false)
    LootFrame:SetPoint("RIGHT", UIParent, "LEFT", -10, 0)

    -- local target = UnitName("target") or ""
    -- local mapID = C_Map.GetBestMapForUnit("player")
    -- local mapName = ""
    -- if mapID then
    --     mapName = C_Map.GetMapInfo(mapID).name
    -- else
    --     mapName = GetMinimapZoneText()
    -- end

    if autoLoot then
        
    else
        self:LoadLoot()
    end
end