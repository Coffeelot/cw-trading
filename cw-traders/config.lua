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

Config.Traders = {
    smelterGuy,
}
