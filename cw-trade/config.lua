Config = {}


Config.Debug = false
Config.UseTokens = false

local SandwichToBeer = {
    tradeName = 'SandwichToBeer',
    fromItems = {
        { name = 'sandwich', amount = 2 },
    },
    toItems = {
        { name = 'beer', amount = 1 }
    },
}

local BeerToMeth = {
    tradeName = 'BeerToMeth',
    fromItems = {
        { name = 'beer', amount = 5 }
    },
    toItems = {
        { name = 'meth', amount = 1 }
    },
}

local PhoneToCash = {
    tradeName = 'PhoneToCash',
    fromItems = {
        { name = 'phone', amount = 1 },
    },
    toCash = { min = 10, max = 20 }, 
}

local FoodToGolfClub = {
    tradeName = 'FoodToGolfClub',
    fromItems = {
        { name = 'sandwich', amount = 2 },
        { name = 'coffee', amount = 1 }
    },
    toItems = {
        { name = 'weapon_golfclub', amount = 1 }
    },
}

--------------------------
-- RELATED TO CW-TOKENS --
--------------------------
local TokenToUzi = {
    tradeName = 'TokenToUzi',
    fromItems = {
        { name = 'cw_token', amount = 1 }
    },
    tokenValue = 'tradeUzi',
    toItems = {
        { name = 'weapon_microsmg', amount = 1 }
    },
}

local TokenToMilRifle = {
    tradeName = 'TokenToMilRifle',
    fromItems = {
        { name = 'cw_token', amount = 1 }
    },
    tokenValue = 'tradeMilRifle',
    toItems = {
        { name = 'weapon_militaryrifle', amount = 1 }
    },
}


Config.Trades = {
    ['SandwichToBeer'] = SandwichToBeer,
    ['PhoneToCash'] = PhoneToCash,
    ['BeerToMeth'] = BeerToMeth,
    ['FoodToGolfClub'] = FoodToGolfClub,
    ['TokenToUzi'] = TokenToUzi,
    ['TokenToMilRifle'] = TokenToMilRifle,
}