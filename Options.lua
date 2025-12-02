

local addonName, TbdFancyLoot = ...;


--[[
    Helper Factory Functions
]]
local function CreateListbox(parent, name)
    local Listbox = CreateFrame("Frame")
    Listbox:SetParent(parent)
    Listbox.ScrollBox = CreateFrame("Frame", name.."ScrollBox", Listbox, "WowScrollBoxList")
    Listbox.ScrollBox:SetPoint("TOPLEFT", Listbox, "TOPLEFT", 0, 0)
    Listbox.ScrollBox:SetPoint("BOTTOMRIGHT", Listbox, "BOTTOMRIGHT", 0, 0)

    Listbox.ScrollBar = CreateFrame("EventFrame", name.."SrollBar", Listbox, "MinimalScrollBar")
    Listbox.ScrollBar:SetPoint("TOPRIGHT", -8, -4)
    Listbox.ScrollBar:SetPoint("BOTTOMRIGHT", -8, 4)

    Listbox.ScrollView = CreateScrollBoxListLinearView()

    ScrollUtil.InitScrollBoxListWithScrollBar(Listbox.ScrollBox, Listbox.ScrollBar, Listbox.ScrollView)

    return Listbox
end

local function CreateTabDescription(parent, text)
    local fs = parent:CreateFontString(nil, "OVERLAY", "GameFontWhite")
    fs:SetPoint("TOPLEFT", 16, -16)
    fs:SetPoint("TOPRIGHT", -32, -16)
    fs:SetHeight(40)
    fs:SetJustifyH("LEFT")
    fs:SetJustifyV("TOP")
    fs:SetText(text)
end

local function CreateInputbox(parent, helptip)
    local Inputbox = CreateFrame("EditBox", nil, parent, "InputBoxTemplate")
    Inputbox.Helptip = Inputbox:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
    Inputbox.Helptip:SetPoint("LEFT", 5, 0)
    Inputbox.Helptip:SetText(helptip)
    Inputbox.Helptip:SetTextColor(0.5,0.5,0.5)
    Inputbox:SetAutoFocus(false)
    Inputbox:SetScript("OnTextChanged", function()
        if Inputbox:GetText() == "" then
            Inputbox.Helptip:Show()
        else
            Inputbox.Helptip:Hide()
        end
    end)
    Inputbox.ConfirmButton = CreateFrame("Button", nil, Inputbox, "UIPanelButtonTemplate")
    Inputbox.ConfirmButton:SetPoint("LEFT", Inputbox, "RIGHT", 10, 0)
    Inputbox.ConfirmButton:SetSize(100, 20)
    Inputbox.ConfirmButton:SetText("OK")

    return Inputbox
end


local TabNineSlice = {
    TopLeftCorner =	{ atlas = "optionsframe-nineslice-cornertopleft", x = -10, y = 12, },
    TopRightCorner =	{ atlas = "optionsframe-nineslice-cornertopright", x = 0, y = 12, },
    BottomLeftCorner =	{ atlas = "optionsframe-nineslice-cornerbottomleft", x = -10, y = 0, },
    BottomRightCorner =	{ atlas = "optionsframe-nineslice-cornerbottomright", x = 0, y = 0, },
    TopEdge = { atlas = "_optionsframe-nineslice-edgetop", },
    BottomEdge = { atlas = "_optionsframe-nineslice-edgebottom", },
    LeftEdge = { atlas = "!OptionsFrame-NineSlice-EdgeLeft", },
    RightEdge = { atlas = "!OptionsFrame-NineSlice-EdgeRight", },
}

local Callbacks = CreateFromMixins(CallbackRegistryMixin)
Callbacks:OnLoad()
Callbacks:GenerateCallbackEvents({
    "OnSettingChanged",
    "OnDefaultSettingsReset",
    "OnSettingsLoaded",
    "Blacklist_OnChanged",
    "Whitelist_OnChanged",
})


local ConfigDefaults = {
    autoLootGold = true,
    autoLootCloth = true,
    autoLootEnchantingDustShards = true,
    autoLootOreAndStone = true,
    autoLootGems = true,
    autoLootHerbs = true,
    autoLootSkins = true,
    autoLootQuestItems = true,
    autoLootWhiteList = {},
    autoLootBlackList = {},

    lootDb = {},

    --potential to auto roll greens/blues etc
    --maybe use a function/macrostring or something?
    --filters for armor type, slot id, stats?
}





--[[
    Settings API

    Use the addon namespace for this as they might get called in another file
]]
TbdFancyLoot.Api = {}

function TbdFancyLoot.Api.OnSettingChanged(setting, newVal)
    if TbdFancyLootOptions and (TbdFancyLootOptions[setting] ~= nil) then
        TbdFancyLootOptions[setting] = newVal
        Callbacks:TriggerEvent("OnSettingChanged")
    end
end

function TbdFancyLoot.Api.GetSetting(setting)
    return TbdFancyLootOptions[setting]
end

function TbdFancyLoot.Api.UpdateList(list, items, remove)

    --DevTools_Dump({items})

    if TbdFancyLootOptions and (TbdFancyLootOptions[list] ~= nil) then
        if type(items) == "table" then
            if remove == true then
                for _, itemID in ipairs(items) do
                    TbdFancyLootOptions[list][itemID] = nil
                end
            else
                for _, itemID in ipairs(items) do
                    if tonumber(itemID) then
                        TbdFancyLootOptions[list][tonumber(itemID)] = true
                    end
                end
            end

            --only need to update the shown list
            if list == "autoLootBlackList" then
                Callbacks:TriggerEvent("Blacklist_OnChanged")
            elseif list == "autoLootWhiteList" then
                Callbacks:TriggerEvent("Whitelist_OnChanged")
            end
        end
    end
end

function TbdFancyLoot.Api.GetList(list)
    if TbdFancyLootOptions and type(TbdFancyLootOptions[list]) == "table" then
        local t = {}
        for itemID, _ in pairs(TbdFancyLootOptions[list]) do
            table.insert(t, itemID)
        end
        return t
    end
end






local function UpdateDefaultConfig()
    if TbdFancyLootOptions then
        for k, v in pairs(ConfigDefaults) do
            if TbdFancyLootOptions[k] == nil then
                TbdFancyLootOptions[k] = v
            end
        end
    end
end

local function ResetDefaultConfig()
    TbdFancyLootOptions = {}
    UpdateDefaultConfig()
    Callbacks:TriggerEvent("OnDefaultSettingsReset")
end

local function MakePlayerFrameMenuEntry()
    Menu.ModifyMenu("MENU_UNIT_SELF", function(ownerRegion, rootDescription, contextData)
        -- Append a new section to the end of the menu.
        -- rootDescription:CreateDivider()
        -- rootDescription:CreateTitle(addonName)
        -- rootDescription:CreateButton("Appended button", function() print("Clicked the appended button!") end)

        -- Insert a new section at the start of the menu.
        -- local title = MenuUtil.CreateTitle(addonName)
        -- rootDescription:Insert(title, 1)
        -- local button = MenuUtil.CreateButton("Inserted button", function() print("Clicked the inserted button!") end)
        -- rootDescription:Insert(button, 2)
        -- local divider = MenuUtil.CreateDivider()
        -- rootDescription:Insert(divider, 3)



        local menuParent = MenuUtil.CreateButton(addonName, function() 
            Settings.OpenToCategory(TbdFancyLoot.SettingsCategoryID)
        end)
        rootDescription:Insert(menuParent, 7)

        -- local openToOptions = MenuUtil.CreateButton(OPTIONS, function ()
        --     Settings.OpenToCategory(TbdFancyLoot.SettingsCategoryID)
        -- end)
        -- local autoLootCopper = MenuUtil.CreateButton("autoLootCopper", function ()
            
        -- end)
        
        -- menuParent:Insert(openToOptions)
        -- menuParent:Insert(autoLootCopper)

    end)
end

local isInitialized = false;
local function Initialize()
    if isInitialized == false then
        MakePlayerFrameMenuEntry()
        UpdateDefaultConfig()
        Callbacks:TriggerEvent("OnSettingsLoaded")
        isInitialized = true;
    end
end

--create the frame and header section
local SettingsPanel = CreateFrame("Frame", nil, UIParent)

--add to the blizzard addon options ui
local category = Settings.RegisterCanvasLayoutCategory(SettingsPanel, addonName)
Settings.RegisterAddOnCategory(category)
TbdFancyLoot.SettingsCategoryID = category:GetID()

local header = SettingsPanel:CreateFontString(nil, "OVERLAY", "GameFontHighlightHuge")
header:SetJustifyH("LEFT")
header:SetPoint("TOPLEFT", 8, -22)
header:SetText(addonName)

local divider = SettingsPanel:CreateTexture(nil, "OVERLAY")
divider:SetAtlas("Options_HorizontalDivider", true)
divider:SetPoint("TOP", 0, -50)

SettingsPanel.DefaultsButton = CreateFrame("Button", nil, SettingsPanel, "UIPanelButtonTemplate")
SettingsPanel.DefaultsButton:SetPoint("TOPRIGHT", -36, -15)
SettingsPanel.DefaultsButton:SetSize(96, 22)
SettingsPanel.DefaultsButton:SetText(DEFAULTS)
SettingsPanel.DefaultsButton:SetScript("OnClick", ResetDefaultConfig)

local logo = SettingsPanel:CreateTexture(nil, "ARTWORK")
logo:SetTexture("Interface/AddOns/TbdFancyLoot/Logo.png")
logo:SetPoint("TOPRIGHT", -27, -70)
logo:SetSize(110, 110)
logo:SetMask("Interface\\CharacterFrame\\TempPortraitAlphaMask")

local logoBorder = SettingsPanel:CreateTexture(nil, "OVERLAY")
logoBorder:SetAtlas("charactercreate-ring-metallight")
logoBorder:SetPoint("CENTER", logo, "CENTER", 0, -2)
logoBorder:SetSize(210, 210)

local infoAbout = SettingsPanel:CreateFontString(nil, "OVERLAY", "GameFontWhite")
infoAbout:SetPoint("TOPLEFT", 12, -70)
infoAbout:SetPoint("TOPRIGHT", logo, "TOPLEFT", -20, 0)
infoAbout:SetHeight(100)
infoAbout:SetJustifyH("LEFT")
infoAbout:SetJustifyV("TOP")
infoAbout:SetText(TbdFancyLoot.Locales.INFO_ABOUT)

SettingsPanel:RegisterEvent("PLAYER_ENTERING_WORLD")

SettingsPanel:SetScript("OnEvent", function(self, event, ...)
    if self[event] then
        self[event](self, ...)
    end
end)


function SettingsPanel:PLAYER_ENTERING_WORLD(...)
    if TbdFancyLootOptions == nil then
        TbdFancyLootOptions = {}
    end
    Initialize()
end



--Settings UI tables
local autoLootCheckboxes = {
    {
        setting = "autoLootGold",
        label = TbdFancyLoot.Locales.AUTO_LOOT_GOLD,
    },
    {
        setting = "autoLootQuestItems",
        label = TbdFancyLoot.Locales.AUTO_LOOT_QUEST_ITEMS,
    },
}

local autoLootTradeskillsCheckboxes = {
    {
        setting = "autoLootEnchantingDustShards",
        label = TbdFancyLoot.Locales.AUTO_LOOT_DUST_AND_SHARDS,
    },
    {
        setting = "autoLootOreAndStone",
        label = TbdFancyLoot.Locales.AUTO_LOOT_ORE_AND_STONE,
    },
    {
        setting = "autoLootGems",
        label = TbdFancyLoot.Locales.AUTO_LOOT_GEMS,
    },
    {
        setting = "autoLootHerbs",
        label = TbdFancyLoot.Locales.AUTO_LOOT_HERBS,
    },
    {
        setting = "autoLootCloth",
        label = TbdFancyLoot.Locales.AUTO_LOOT_CLOTH,
    },
    {
        setting = "autoLootSkins",
        label = TbdFancyLoot.Locales.AUTO_LOOT_SKINS,
    },
}

local widgetVertOffset = -110

function SettingsPanel:CreateSettingsUI()

    self.TabPanel = CreateFrame("Frame", nil, self, "TBDTabFrameTemplate")
    self.TabPanel:SetPoint("TOPLEFT", 10, -210)
    self.TabPanel:SetPoint("BOTTOMRIGHT", -10, 0)

    NineSliceUtil.ApplyLayout(self.TabPanel, TabNineSlice)

    --[[
        Auto loot options
    ]]
    self.TabPanel.AutoLoot = CreateFrame("Frame", nil, self.TabPanel)
    self.TabPanel.AutoLoot:SetAllPoints()

    CreateTabDescription(self.TabPanel.AutoLoot, TbdFancyLoot.Locales.TAB_DESC_AUTO_ROLL)

    local lastCheckBox;
    for k, checkbox in ipairs(autoLootCheckboxes) do
        local cb = CreateFrame("CheckButton", nil, SettingsPanel.TabPanel.AutoLoot, "MinimalCheckboxTemplate")
        cb.Label = cb:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        cb.Label:SetPoint("LEFT", cb, "LEFT", -253, 0)
        cb.Label:SetText(checkbox.label)

        cb:SetScript("OnClick", function(cbx)
            TbdFancyLoot.Api.OnSettingChanged(checkbox.setting, cbx:GetChecked())
        end)

        Callbacks:RegisterCallback("OnSettingsLoaded", function()
            cb:SetChecked(TbdFancyLoot.Api.GetSetting(checkbox.setting))
        end)
        Callbacks:RegisterCallback("OnDefaultSettingsReset", function()
            cb:SetChecked(TbdFancyLoot.Api.GetSetting(checkbox.setting))
        end)

        if k == 1 then
            cb:SetPoint("TOP", -20, widgetVertOffset)
            lastCheckBox = cb
        else
            cb:SetPoint("TOP", lastCheckBox, "BOTTOM", 0, -6)
            lastCheckBox = cb
        end

    end
    --End


    --[[
        Auto loot tradeskills
    ]]
    self.TabPanel.AutoLootTradeskills = CreateFrame("Frame", nil, self.TabPanel)
    self.TabPanel.AutoLootTradeskills:SetAllPoints()
    self.TabPanel.AutoLootTradeskills:Hide()

    CreateTabDescription(self.TabPanel.AutoLootTradeskills, TbdFancyLoot.Locales.TAB_DESC_AUTO_LOOT_TRADESKILLS)

    lastCheckBox = nil;
    for k, checkbox in ipairs(autoLootTradeskillsCheckboxes) do
        local cb = CreateFrame("CheckButton", nil, SettingsPanel.TabPanel.AutoLootTradeskills, "MinimalCheckboxTemplate")
        cb.Label = cb:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        cb.Label:SetPoint("LEFT", cb, "LEFT", -253, 0)
        cb.Label:SetText(checkbox.label)

        cb:SetScript("OnClick", function(cbx)
            TbdFancyLoot.Api.OnSettingChanged(checkbox.setting, cbx:GetChecked())
        end)

        Callbacks:RegisterCallback("OnSettingsLoaded", function()
            cb:SetChecked(TbdFancyLoot.Api.GetSetting(checkbox.setting))
        end)
        Callbacks:RegisterCallback("OnDefaultSettingsReset", function()
            cb:SetChecked(TbdFancyLoot.Api.GetSetting(checkbox.setting))
        end)

        if k == 1 then
            cb:SetPoint("TOP", -20, widgetVertOffset)
            lastCheckBox = cb
        else
            cb:SetPoint("TOP", lastCheckBox, "BOTTOM", 0, -6)
            lastCheckBox = cb
        end

    end
    --end

    --self.TabPanel.AutoRoll = CreateFrame("Frame", nil, self.TabPanel)
    --self.TabPanel.AutoRoll:SetAllPoints()



    --[[
        Both white and black list can use this init func
    ]]

    --use this to determine the active list
    self.TabPanel.Selectedlist = nil;
    local function RemoveItemFromList(itemID)
        if self.TabPanel.Selectedlist then
            TbdFancyLoot.Api.UpdateList(self.TabPanel.Selectedlist, {itemID}, true)
        end
    end

    local function AddItemsToList(items)
        local tOut = {}
        if string.find(items, ",", nil, true) then
            local t = {strsplit(",", items)}
            if type(t) == "table" then
                for k, v in ipairs(t) do
                    if tonumber(v) then
                        table.insert(tOut, tonumber(v))
                    end
                end
            end
        else
            if tonumber(items) then
                table.insert(tOut, tonumber(items))
            end
        end
        --DevTools_Dump(tOut)
        if self.TabPanel.Selectedlist then
            TbdFancyLoot.Api.UpdateList(self.TabPanel.Selectedlist, tOut)
        end
    end

    --frames are passed an itemID as data
    local function LoadListItem(frame, data)
        --print("ItemID:", data)
        local item = Item:CreateFromItemID(data)
        if not item:IsItemEmpty() then
            item:ContinueOnItemLoad(function()
                frame.Icon:SetTexture(item:GetItemIcon())
                frame.Label:SetText(item:GetItemLink())
                frame.Delete:SetScript("OnClick", function()
                    RemoveItemFromList(data)
                end)
            end)
        end
    end

    local function ResetListItem(frame)
        frame.Icon:SetTexture(nil)
        frame.Label:SetText(nil)
        frame.Delete:SetScript("OnClick", nil)
    end

    local function LoadlistItems(widget, data)
        local DataProvider = CreateDataProvider(data)
        widget.Listbox.ScrollView:SetDataProvider(DataProvider)
        local i = 1;
        widget.Listbox.ScrollView:ForEachFrame(function(f, d)
            if i % 2 == 0 then
                f.Background:Show()
            else
                f.Background:Hide()
            end
            i = i + 1;
        end)
    end


    --[[
        Whitelist
    ]]
    self.TabPanel.Whitelist = CreateFrame("Frame", nil, self.TabPanel)
    self.TabPanel.Whitelist:SetAllPoints()
    self.TabPanel.Whitelist:Hide()

    CreateTabDescription(self.TabPanel.Whitelist, TbdFancyLoot.Locales.TAB_DESC_WHITELIST)

    self.TabPanel.Whitelist.InputBox = CreateInputbox(self.TabPanel.Whitelist, "Try 1234,3456")
    self.TabPanel.Whitelist.InputBox:SetPoint("TOPLEFT", 20, -65)
    self.TabPanel.Whitelist.InputBox:SetSize(400, 22)
    
    self.TabPanel.Whitelist.InputBox.ConfirmButton:SetScript("OnClick", function()
        AddItemsToList(self.TabPanel.Whitelist.InputBox:GetText())
    end)

    self.TabPanel.Whitelist.Listbox = CreateListbox(self.TabPanel.Whitelist, string.format("%sOptionsWhitelistListbox", addonName))
    self.TabPanel.Whitelist.Listbox:SetPoint("TOPLEFT", 15, widgetVertOffset)
    self.TabPanel.Whitelist.Listbox:SetPoint("BOTTOMRIGHT", -15, 15)

    self.TabPanel.Whitelist.Listbox.ScrollView:SetElementInitializer("TbdFancyLootListItemTemplate", GenerateClosure(LoadListItem))
    self.TabPanel.Whitelist.Listbox.ScrollView:SetElementResetter(GenerateClosure(ResetListItem))
    self.TabPanel.Whitelist.Listbox.ScrollView:SetPadding(1, 1, 1, 1, 1);
    self.TabPanel.Whitelist.Listbox.ScrollView:SetElementExtent(22)

    self.TabPanel.Whitelist:SetScript("OnShow", function()
        self.TabPanel.Selectedlist = "autoLootWhiteList";
        LoadlistItems(self.TabPanel.Whitelist, TbdFancyLoot.Api.GetList("autoLootWhiteList")) --fix the dummyData return for release!
    end)

    Callbacks:RegisterCallback("Whitelist_OnChanged", function()
        LoadlistItems(self.TabPanel.Whitelist, TbdFancyLoot.Api.GetList("autoLootWhiteList"))
    end)
    
    --End
    
    
    --[[
        Blacklist
    ]]
    self.TabPanel.Blacklist = CreateFrame("Frame", nil, self.TabPanel)
    self.TabPanel.Blacklist:SetAllPoints()
    self.TabPanel.Blacklist:Hide()

    CreateTabDescription(self.TabPanel.Blacklist, TbdFancyLoot.Locales.TAB_DESC_BLACKLIST)

    self.TabPanel.Blacklist.InputBox = CreateInputbox(self.TabPanel.Blacklist, "Try 1234,3456")
    self.TabPanel.Blacklist.InputBox:SetPoint("TOPLEFT", 20, -65)
    self.TabPanel.Blacklist.InputBox:SetSize(400, 22)
    
    self.TabPanel.Blacklist.Listbox = CreateListbox(self.TabPanel.Blacklist, string.format("%sOptionsBlacklistListbox", addonName))
    self.TabPanel.Blacklist.Listbox:SetPoint("TOPLEFT", 15, widgetVertOffset)
    self.TabPanel.Blacklist.Listbox:SetPoint("BOTTOMRIGHT", -15, 15)

    self.TabPanel.Blacklist.Listbox.ScrollView:SetElementInitializer("TbdFancyLootListItemTemplate", GenerateClosure(LoadListItem))
    self.TabPanel.Blacklist.Listbox.ScrollView:SetElementResetter(GenerateClosure(ResetListItem))
    self.TabPanel.Blacklist.Listbox.ScrollView:SetPadding(1, 1, 1, 1, 1);
    self.TabPanel.Blacklist.Listbox.ScrollView:SetElementExtent(22)

    self.TabPanel.Blacklist:SetScript("OnShow", function()
        self.TabPanel.Selectedlist = "autoLootBlackList";
        LoadlistItems(self.TabPanel.Blacklist, TbdFancyLoot.Api.GetList("autoLootBlackList")) --fix the dummyData return for release!
    end)

    Callbacks:RegisterCallback("Blacklist_OnChanged", function()
        LoadlistItems(self.TabPanel.Blacklist, TbdFancyLoot.Api.GetList("autoLootBlackList"))
    end)
    --End
    
    
    self.TabPanel.Search = CreateFrame("Frame", nil, self.TabPanel)
    self.TabPanel.Search:SetAllPoints()

    
    local tabs = {
        {
            label = TbdFancyLoot.Locales.TAB_LABEL_AUTO_LOOT,
            panel = self.TabPanel.AutoLoot,
            width = 80,
        },
        {
            label = TbdFancyLoot.Locales.TAB_LABEL_AUTO_LOOT_TRADESKILLS,
            panel = self.TabPanel.AutoLootTradeskills,
            width = 80,
        },
        -- {
        --     label = TbdFancyLoot.Locales.TAB_LABEL_AUTO_ROLL,
        --     panel = self.TabPanel.AutoRoll,
        --     width = 80,
        -- },
        {
            label = TbdFancyLoot.Locales.TAB_LABEL_WHITELIST,
            panel = self.TabPanel.Whitelist,
            width = 80,
        },
        {
            label = TbdFancyLoot.Locales.TAB_LABEL_BLACKLIST,
            panel = self.TabPanel.Blacklist,
            width = 80,
        },
        -- {
        --     label = TbdFancyLoot.Locales.TAB_LABEL_SEARCH,
        --     panel = self.TabPanel.Search,
        --     width = 80,
        -- },
    }

    self.TabPanel:CreateTabButtons(tabs)


end




SettingsPanel:CreateSettingsUI()