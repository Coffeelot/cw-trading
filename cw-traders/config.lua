Config = {}
Config.Debug = false
Config.UseOxInv = false -- toggle to true if you use ox inventory

Config.UseTokens = true
Config.UseRGB = true

Config.SecretTrades = true -- set this to true if you want trades to not show up if player does not have items

local smelterGuy = {
    name = 'smelterGuy',
    model = 's_m_m_lathandy_01',
    tradeName = 'SandwichToBeer',
    tradeLabel = 'Trade 2 sandwiches for a beer',
    coords = vector4(1081.15, -1980.33, 31.47, 144.61),
    animation = 'WORLD_HUMAN_JANITOR',
    available = {from = 9, to = 17}
}

local bumGuy = {
    name = 'bumGuy',
    model = 'u_m_y_militarybum',
    tradeName = 'BeerToMeth',
    tradeLabel = 'Trade 5 beers for a bag of meth',
    coords = vector4(934.5, -1903.48, 31.12, 89.13),
    animation = 'WORLD_HUMAN_BUM_STANDING',
    allowBatchTrade = true, -- example of how to enable batch trading
    batchTradeLabel = 'Trade multiple beers for meth'
}

local golfGuy = {
    name = 'golfGuy',
    model = 'a_f_y_golfer_01',
    tradeName = 'FoodToGolfClub',
    tradeLabel = 'Trade 1 coffee and 2 sandwiches for a golf club',
    coords = vector4(-1135.78, 1.76, 48.48, 121.0),
    animation = 'PROP_HUMAN_SEAT_BENCH',
}

local phoneGuy = {
    name = 'golfGuy',
    model = 'ig_lifeinvad_02',
    tradeName = 'PhoneToCash',
    tradeLabel = 'Trade 1 phone for cash',
    coords = vector4(1137.17, -472.37, 66.57, 254.41),
    animation = 'WORLD_HUMAN_AA_COFFEE',
}

local shadyGuy = { -- Note that this guy is NOT included in the below Config.Traders, as he uses items not included with stock qb-core (rolled bills)
    name = 'shadyGuy',
    model = 'g_m_y_famfor_01',
    trades = {
        { tradeLabel = 'Trade 10 rolls to 10 bags of meth', tradeName = 'RollsToMeth', batchTradeLabel = 'Trade multiple rolls to multiple bags of meth', allowBatchTrade = true }, -- example of how to enable batch trading per trade
        { tradeLabel = 'Trade 200 rolls to heavy pistol', tradeName = 'RollsToHeavyPistol' },
        { tradeLabel = 'Trade 300 rolls to uzi', tradeName = 'RollsToUzi' },
    }, 
    coords = vector4(1131.48, -2202.64, 31.7, 137.99),
    animation = 'WORLD_HUMAN_DRUG_DEALER_HARD', 
}

Config.Traders = {
    smelterGuy,
    bumGuy,
    golfGuy,
    phoneGuy,
}

------------------------------
-- RELATED TO CW-RGBPAINTER --
------------------------------

local paintGuy = {
    name = 'paintGuy',
    model = 's_m_m_gaffer_01',
    trades = {
        { tradeLabel = 'Trade cash to paint gun', tradeName = 'CashToPaintGun' },
        { tradeLabel = 'Trade cash to paint canisters', tradeName = 'CashToPaintCanisters' },
        { tradeLabel = 'Trade cash to paint remover', tradeName = 'CashToPaintRemovalSpray' },
    }, 
    coords = vector4(875.2, -1014.9, 31.1, 4.14),
    animation = 'WORLD_HUMAN_SEAT_WALL',
}
 
Config.RGBTraders = {
    paintGuy,
}
--------------------------
-- RELATED TO CW-TOKENS --
--------------------------
local uziGuy = {
    name = 'uziGuy',
    model = 'csb_ramp_gang',
    gang = 'ballas',
    trades = {
        { tradeLabel = 'Trade token for uzi', tradeName = 'TokenToUzi', },
        { tradeLabel = 'Trade token for pistol', tradeName = 'TokenToPistol' },
        { tradeLabel = 'Trade token for sawed off', tradeName = 'TokenToSawedOff' },
    },
    coords = vector4(139.08, -1921.67, 21.38, 298.39),
    animation = 'WORLD_HUMAN_DRUG_DEALER',
}

local hoboGuy = {
    name = 'hoboGuy',
    model = 'a_m_o_tramp_01',
    trades = {
        { tradeLabel = 'Trade token for molotov', tradeName = 'TokenToMolotov', },
        { tradeLabel = 'Trade token for double barrel sawed off', tradeName = 'TokenToDoubleBarrel' },
    },
    coords = vector4(1443.26, 6331.79, 23.98, 2.27),
    animation = 'WORLD_HUMAN_LEANING',
}

local milRifleGuy = {
    name = 'milRifleGuy',
    model = 'ig_old_man1a',
    tradeLabel = 'Trade token for gear',
    tradeName = 'TokenToMilRifle',
    coords = vector4(880.39, 2888.02, 56.51, 311.04),
    animation = 'WORLD_HUMAN_BINOCULARS',
}

local eastSideGuy = {
    name = 'eastSideGuy',
    model = 'a_f_m_tramp_01',
    trades = {
        { tradeLabel = 'Trade token for 30 meth baggies', tradeName = 'TokenToMeth', },
        { tradeLabel = 'Trade token for 30 crack baggies', tradeName = 'TokenToCrack' },
    },
    coords = vector4(931.56, -1499.05, 30.33, 40.57),
    animation = 'WORLD_HUMAN_BUM_STANDING',
}

local weedGuy = {
    name = 'weedGuy',
    model = 'a_m_m_hillbilly_02',
    trades = {
        { tradeLabel = 'Trade token for 5 AK seeds', tradeName = 'TokenToAKSeed' },
        { tradeLabel = 'Trade token for 5 Amnesia seeds', tradeName = 'TokenToAmnesiaSeed' },
        { tradeLabel = 'Trade token for 5 OG Kush seeds', tradeName = 'TokenToOGSeed' },
        { tradeLabel = 'Trade token for 5 Purple Haze seeds', tradeName = 'TokenToPurpleHazeSeed' },
        { tradeLabel = 'Trade token for 5 Skunk seeds', tradeName = 'TokenToSkunkSeed' },
        { tradeLabel = 'Trade token for 5 White Widow seeds', tradeName = 'TokenToWhiteWidowSeed' },
        { tradeLabel = 'Trade token for 10 bags of weed nutrition', tradeName = 'TokenToWeedNutrition' },
    },
    coords = vector4(2226.79, 5575.66, 53.64, 193.85),
    animation = 'WORLD_HUMAN_GARDENER_PLANT',
}

Config.TokenTraders = {
    uziGuy,
    milRifleGuy,
    hoboGuy,
    eastSideGuy,
    weedGuy
}


-- animation pastebin https://pastebin.com/6mrYTdQv