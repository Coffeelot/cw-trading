Config = {}

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
