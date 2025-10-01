

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