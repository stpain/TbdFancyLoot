

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

local LootItemFramePool;

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

local function CheckAutoLootRules(itemID, isQuestItem)

    local config = TbdFancyLootOptions;

    if (config.autoLootQuestItems == true) and (isQuestItem == true) then
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

    for _itemID, autoLoot in pairs(config.autoLootWhiteList) do
        if _itemID == itemID then
            return true
        end
    end

    return false;

end

local function GetTargetLoot()


    local t = {}

	-- if currencyID then 
	-- 	item, texture, quantity, itemQuality = CurrencyContainerUtil.GetCurrencyContainerInfo(currencyID, quantity, item, texture, itemQuality);
	-- end

    local numLoot = GetNumLootItems()
    for i = 1, numLoot do
        if LootSlotHasItem(i) then

            local texture, item, quantity, currencyID, itemQuality, locked, isQuestItem, questID, isActive = GetLootSlotInfo(i)
            
            if GetLootSlotType(i) == 1 then
                
                local link = GetLootSlotLink(i)
                local itemID, _, _, equipLoc, _, classID, subClassID = C_Item.GetItemInfoInstant(link)

                local showLoot = true;
                if CheckAutoLootRules(itemID, isQuestItem) == true then
                    LootSlot(i)
                    showLoot = false;
                end
                
                local isBlackList = false;
                if TbdFancyLootOptions and (type(TbdFancyLootOptions.autoLootBlackList) == "table") and (TbdFancyLootOptions.autoLootBlackList[itemID] == true) then
                    isBlackList = true
                end
                if (showLoot == true) and (isBlackList == false) then
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

            elseif GetLootSlotType(i) == 2 then

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







TbdFancyLootPersonalLootItemMixin = {}
function TbdFancyLootPersonalLootItemMixin:OnLoad()
    self:SetScript("OnLeave", function()
        GameTooltip_SetDefaultAnchor(GameTooltip, UIParent)
    end)
end

function TbdFancyLootPersonalLootItemMixin:SetLootItem(data)

    self.lootSlotData = data;

    if data.link then

        local itemID, _, _, _, icon, classID, subClassID = C_Item.GetItemInfoInstant(data.link)

        local item = Item:CreateFromItemLink(data.link)
        if not item:IsItemEmpty() then
            item:ContinueOnItemLoad(function()

                local qualityColour = item:GetItemQualityColor()

                if data.quantity > 1 then
                    self.Label:SetText(string.format("x%d %s%s|r", data.quantity, qualityColour.hex, item:GetItemName()))
                else
                    self.Label:SetText(string.format("%s%s|r", qualityColour.hex, item:GetItemName()))
                end
                local vendorPrice = select(11, C_Item.GetItemInfo(data.link))
                self.ItemVendorPriceLabel:SetText(C_CurrencyInfo.GetCoinTextureString(vendorPrice * data.quantity))
            end)
        end

        --self.ItemClassLabel:SetText(string.format("|cffffffff%s - %s", C_Item.GetItemClassInfo(classID), C_Item.GetItemSubClassInfo(classID, subClassID)))
        self.ItemClassLabel:SetText(string.format("|cffffffff%s", C_Item.GetItemSubClassInfo(classID, subClassID)))

        self:SetScript("OnEnter", function()
            GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
            GameTooltip:ClearLines()
            GameTooltip:SetHyperlink(data.link)
            GameTooltip:Show()

            --DevTools_Dump({data})
        end)
    end
    if data.icon then
        self.Icon:SetTexture(data.icon)
    end
    if data.copper then
        self.Label:SetText(C_CurrencyInfo.GetCoinTextureString(data.copper))
    end
    if data.isQuestItem then
        self.RightIcon:SetAtlas("QuestNormal")
    end
    if data.index then
        self:SetScript("OnMouseUp", function(_, hardwareButton)
            if hardwareButton == "RightButton" then

                if IsAltKeyDown() then
                    TbdFancyLoot.Api.UpdateList("autoLootWhiteList", {data.itemID})

                    --loot this as its now whitelisted
                    LootItemFramePool:Release(self)
                    LootSlot(data.index)
                end

                if IsControlKeyDown() then
                    TbdFancyLoot.Api.UpdateList("autoLootBlackList", {data.itemID})
                end

            else
                LootItemFramePool:Release(self)
                LootSlot(data.index)
            end
        end)
    end
end

function TbdFancyLootPersonalLootItemMixin:Clear()
    self.Icon:SetTexture(nil)
    self.RightIcon:SetTexture(nil)
    self.Label:SetText(nil)
    self.ItemClassLabel:SetText(nil)
    self.ItemVendorPriceLabel:SetText(nil)
    self:SetScript("OnMouseUp", nil)
    self.lootSlotData = nil
end








local Events = {
    "LOOT_OPENED",
    "LOOT_CLOSED",
    "LOOT_SLOT_CLEARED",
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
    --avoid a double call due to events firing more than once
    if slotIndex == lastSlotCleared then
        return
    end
    lastSlotCleared = slotIndex
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