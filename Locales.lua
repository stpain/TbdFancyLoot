

local _, TbdFancyLoot = ...;

local Locales = {
    enUS = {

        INFO_ABOUT = "TbdFancyLoot takes care of looting for you. Use the settings to adjust what items you want and what to ignore.\n\nThe addon will scan any loot, check if it should be looted then check if the item is Blacklisted. |cffFFD200Blacklisted items will always override other settings.|r",

        TAB_LABEL_AUTO_LOOT = "Auto loot",
        TAB_LABEL_AUTO_LOOT_TRADESKILLS = "Tradeskills",
        --TAB_LABEL_AUTO_ROLL = "Auto rolls",
        TAB_LABEL_WHITELIST = "Whitelist",
        TAB_LABEL_BLACKLIST = "Blacklist",
        TAB_LABEL_SEARCH = "Search",

        TAB_DESC_AUTO_LOOT = "Control which items are automatically looted. Sometimes quest items don't show as quest items via the game API, you can use the Whitelist to auto loot these.",
        TAB_DESC_AUTO_LOOT_TRADESKILLS = "Select which tradeskill items should be auto looted.",
        TAB_DESC_AUTO_ROLL = "Select items to be auto looted.\n|cffFFD200Some quests involve collecting items which the game doesn't mark as 'Quest Items' for these you can Whitelist them while on the quest.|r",
        TAB_DESC_WHITELIST = "Whitelist items will be automatically looted. You can |cffFFD200Alt+Right Click|r the loot frame to add items or use the input box to add itemID's, add multiple using a ',' (csv)",
        TAB_DESC_BLACKLIST = "Blacklist items will not be shown or looted. You can |cffFFD200Ctrl+Right Click|r the loot frame to add items or use the input box to add itemID's, add multiple using a ',' (csv)",
        TAB_DESC_SEARCH = "",

        AUTO_LOOT_GOLD = "Gold",
        AUTO_LOOT_DUST_AND_SHARDS = "Enchanting Dust & Shards",
        AUTO_LOOT_HERBS = "Herbs",
        AUTO_LOOT_CLOTH = "Cloth",
        AUTO_LOOT_ORE_AND_STONE = "Ore and Stone",
        AUTO_LOOT_GEMS = "Gems",
        AUTO_LOOT_SKINS = "Skins",
        AUTO_LOOT_QUEST_ITEMS = "Quest Items",
        AUTO_LOOT_WHITE_LIST_ITEMS = "Auto Loot white list",
        AUTO_LOOT_BLACK_LIST_ITEMS = "Auto Loot black list",


    }
}


TbdFancyLoot.Locales = Locales[GetLocale()]