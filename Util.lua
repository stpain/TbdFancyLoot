

local InventorySlots = {
    {
        slot = "HEADSLOT",
        icon = 136516,
    },
    {
        slot = "NECKSLOT",
        icon = 136519,
    },
    {
        slot = "SHOULDERSLOT",
        icon = 136526,
    },
    {
        slot = "BACKSLOT",
        icon = 136521,
    },
    {
        slot = "SHIRTSLOT",
        icon = 136525,
    },
    {
        slot = "CHESTSLOT",
        icon = 136512,
    },
    {
        slot = "WAISTSLOT",
        icon = 136529,
    },
    {
        slot = "LEGSSLOT",
        icon = 136517,
    },
    {
        slot = "FEETSLOT",
        icon = 136513,
    },
    {
        slot = "WRISTSLOT",
        icon = 136530,
    },
    {
        slot = "HANDSSLOT",
        icon = 136515,
    },
    {
        slot = "FINGER0SLOT",
        icon = 136514,
    },
    {
        slot = "FINGER1SLOT",
        icon = 136523,
    },
    {
        slot = "TRINKET0SLOT",
        icon = 136528,
    },
    {
        slot = "TRINKET1SLOT",
        icon = 136528,
    },
    {
        slot = "MAINHANDSLOT",
        icon = 136518,
    },
    {
        slot = "SECONDARYHANDSLOT",
        icon = 136524,
    },
    {
        slot = "RANGEDSLOT",
        icon = 136520,
    },
    {
        slot = "TABARDSLOT",
        icon = 136527,
    },
    -- {
    --     slot = "RELICSLOT",
    --     icon = 136522,
    -- },
}


--local link = GetInventoryItemLink('player', GlobalNameToInvSlot[equipLoc])


local GlobalNameToInvSlot = {
    ["INVTYPE_HEAD"] = 1,
    ["INVTYPE_SHOULDER"] = 3,
    ["INVTYPE_BODY"] = 4,
    ["INVTYPE_CHEST"] = 5,
    ["INVTYPE_ROBE"] = 5,
    ["INVTYPE_WAIST"] = 6,
    ["INVTYPE_LEGS"] = 7,
    ["INVTYPE_FEET"] = 8,
    ["INVTYPE_WRIST"] = 9,
    ["INVTYPE_HAND"] = 10,
    ["INVTYPE_CLOAK"] = 15,
    ["INVTYPE_MAINHAND"] = 16,
    ["INVTYPE_OFFHAND"] = 17,
    ["INVTYPE_RANGED"] = 18,
    ["INVTYPE_RANGEDRIGHT"] = 18,
    ["INVTYPE_TABARD"] = 19,
    ["INVTYPE_WEAPON"] = {16, 17},
    ["INVTYPE_2HWEAPON"] = 16,
    ["INVTYPE_WEAPONMAINHAND"] = 16,
    ["INVTYPE_WEAPONOFFHAND"] = 17,
    ["INVTYPE_SHIELD"] = 17,
    ["INVTYPE_HOLDABLE"] = 17,
    ["INVTYPE_FINGER"] = {11, 12},
    ["INVTYPE_TRINKET"] = {13, 14},
}

local ClassIdArmorType = {
    [1] = 4, --warrior
    [2] = 4, --paladin
    [3] = 3, --hunter
    [4] = 2, --rogue
    [5] = 1, --priest
    [6] = 4, --dk
    [7] = 3, --shaman
    [8] = 1, --mage
    [9] = 1, --warlock
    [10] = 2, --monk
    [11] = 2, --druid
    [12] = 2, --dh
}

local ClassSkillSpellId = {
    DualWield = 674,
    Shields = 9116,
}

local ItemSubClassIdToArmorSkillSpellId = {
    [Enum.ItemArmorSubclass.Cloth] = 9078,
    [Enum.ItemArmorSubclass.Leather] = 9077,
    [Enum.ItemArmorSubclass.Mail] = 8737,
    [Enum.ItemArmorSubclass.Plate] = 750,
}

local ItemSubClassIdToWeaponSkillSpellId = {
    [Enum.ItemWeaponSubclass.Polearm] = 200,
    [Enum.ItemWeaponSubclass.Sword1H] = 201,
    [Enum.ItemWeaponSubclass.Sword2H] = 202,
    [Enum.ItemWeaponSubclass.Axe1H] = 196,
    [Enum.ItemWeaponSubclass.Axe2H] = 197,
    [Enum.ItemWeaponSubclass.Mace1H] = 198,
    [Enum.ItemWeaponSubclass.Mace2H] = 199,
    [Enum.ItemWeaponSubclass.Staff] = 227,
    [Enum.ItemWeaponSubclass.Dagger] = 1180,
    [Enum.ItemWeaponSubclass.Wand] = 5009,
    [Enum.ItemWeaponSubclass.Fishingpole] = 7738,
    [Enum.ItemWeaponSubclass.Guns] = 266,
    [Enum.ItemWeaponSubclass.Bows] = 264,
    [Enum.ItemWeaponSubclass.Crossbow] = 5011,
}


--https://warcraft.wiki.gg/wiki/ItemType
local classIdOrder = {
    [0] = 6, --consumable
    [1] = 6, --container
    [2] = 6, --weapon
    [3] = 6, --gem
    [4] = 6, --armor
    [5] = 6, --reagent
    [6] = 6, --ammo
    [7] = 6, --trade
    [8] = 6, --item enhance
    [9] = 6, --recipe
    [10] = 6, --token
    [11] = 6, --quiver
    [12] = 6, --quest
    [13] = 6, --key
    [14] = 6, --permanent
    [15] = 6, --misc
    [16] = 6, --glyph
    [17] = 6, --battlepets
    [18] = 6, --wow token
    [19] = 6, --profession
}