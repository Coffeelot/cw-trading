Config = {}

Config.UseTokens = false

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

Config.Traders = {
    smelterGuy,
    bumGuy
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