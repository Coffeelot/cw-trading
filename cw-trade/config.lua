Config = {}


Config.Debug = false
Config.UseTokens = false

local SandwichToBeer = {
    tradeName = 'SandwichToBeer',
    fromItem = 'sandwich',
    fromAmount = 2,
    toItem = 'beer',
    toAmount = 1,
}

local BeerToMeth = {
    tradeName = 'BeerToMeth',
    fromItem = 'beer',
    fromAmount = 5,
    toItem = 'meth',
    toAmount = 1,
}

local PhoneToCash = {
    tradeName = 'PhoneToCash',
    tradeLabel = 'Phone to cash',
    fromItem = 'phone',
    fromAmount = 1,
    toCash = { min = 10, max = 20 }, 
}

--------------------------
-- RELATED TO CW-TOKENS --
--------------------------
local TokenToUzi = {
    tradeName = 'TokenToUzi',
    tradeLabel = 'Trade token for gear',
    fromItem = 'cw_token',
    tokenValue = 'tradeUzi',
    fromAmount = 1,
    toItem = 'weapon_microsmg',
    toAmount = 1
}

local TokenToMilRifle = {
    tradeName = 'TokenToMilRifle',
    tradeLabel = 'Trade token for gear',
    fromItem = 'cw_token',
    tokenValue = 'tradeMilRifle',
    fromAmount = 1,
    toItem = 'weapon_militaryrifle',
    toAmount = 1
}


Config.Trades = {
    ['SandwichToBeer'] = SandwichToBeer,
    ['PhoneToCash'] = PhoneToCash,
    ['BeerToMeth'] = BeerToMeth,
    ['TokenToUzi'] = TokenToUzi,
    ['TokenToMilRifle'] = TokenToMilRifle,
}