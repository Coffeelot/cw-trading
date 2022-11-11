Config = {}
Config.Debug = false


Config.UseTokens = false
Config.UseRGB = true

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
        { tradeLabel = 'Trade 10 rolls to 10 bags of meth', tradeName = 'RollsToMeth' },
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
    tradeLabel = 'Trade token for gear',
    tradeName = 'TokenToUzi',
    coords = vector4(139.08, -1921.67, 21.38, 298.39),
    animation = 'WORLD_HUMAN_DRUG_DEALER',
}
 

local milRifleGuy = {
    name = 'milRifleGuy',
    model = 'ig_old_man1a',
    tradeLabel = 'Trade token for gear',
    tradeName = 'TokenToMilRifle',
    coords = vector4(880.39, 2888.02, 56.51, 311.04),
    animation = 'WORLD_HUMAN_BINOCULARS',
}

Config.TokenTraders = {
    uziGuy,
    milRifleGuy
}


-- animation pastebin https://pastebin.com/6mrYTdQv