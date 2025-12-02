

local addonName, TbdFancyLoot = ...

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
                    LootSlot(data.index)
                end

                if IsControlKeyDown() then
                    TbdFancyLoot.Api.UpdateList("autoLootBlackList", {data.itemID})
                end

            else
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