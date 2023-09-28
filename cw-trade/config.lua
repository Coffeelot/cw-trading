Config = {}

Config.Inventory = 'ox'
Config.Debug = false
Config.UseTokens = true
Config.PoliceCallChance = 40

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

local SlipToTicket = {
    tradeName = 'Recycleticket',
    fromItems = {
        {name = 'recycleditem', amount = 20}
    },
    toItems = {
        { name = 'matticket', amount = 1 }
    },
}

local PhoneToCash = {
    tradeName = 'PhoneToCash',
    fromItems = {
        { name = 'phone', amount = 1 },
    },
    toMoneyType = 'cash',
    toMoney = { min = 10, max = 20 }
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

-----------------------------------------
-- Examples for trading with item info --
----------------------------------------
local RollsToMeth = {
    tradeName = 'RollsToMeth',
    fromItems = {
        { name = 'rolls', amount = 10 },
    },
    type = 'illegal',
    reptype = 'Street Reputation',
    rep = 0,
    toItems = {
        { name = 'meth', amount = 10 }
    },
}

local RollsToHeavyPistol = {
    tradeName = 'RollsToHeavyPistol',
    fromItems = {
        { name = 'rolls', amount = 100 },
    },
    type = 'illegal',
    reptype = 'Street Reputation',
    rep = 0,
    toItems = {
        { name = 'weapon_heavypistol', amount = 1, info = { serie = ""}}
    },
}

local RollsToUzi = {
    tradeName = 'RollsToUzi',
    fromItems = {
        { name = 'rolls', amount = 200 },
    },
    type = 'illegal',
    reptype = 'Street Reputation',
    rep = 0,
    toItems = {
        { name = 'weapon_microsmg', amount = 1, info = { serie = ""} }
    },
}

local NotesToThermite = {
    tradeName = 'NotesToThermite',
    fromItems = {
        { name = 'largenote', amount = 50, }
    },
    type = 'illegal',
    reptype = 'Street Reputation',
    rep = 1000,
    toItems = {
        { name = 'thermite', amount = 1}
    },
}

local NotesToSMGParts = {
    tradeName = 'NotesToSMGParts',
    fromItems = {
        { name = 'largenote', amount = 200, }
    },
    type = 'illegal',
    reptype = 'Street Reputation',
    rep = 250,
    toItems = {
        { name = 'smgparts', amount = 1}
    },
}

local NotesToRifleParts = {
    tradeName = 'NotesToRifleParts',
    fromItems = {
        { name = 'largenote', amount = 450, }
    },
    reptype = 'Street Reputation',
    rep = 500,
    type = 'illegal',
    toItems = {
        { name = 'rifleparts', amount = 1}
    },
}

------------------------------
-- RELATED TO CW-RGBPAINTER --
------------------------------
local CashToPaintGun = {
    tradeName = 'CashToPaintGun',
    fromMoney = 1000,
    fromMoneyType = 'cash',
    toItems = {
        { name = 'paint_gun', amount = 1 }
    },
}

local CashToPaintCanisters = {
    tradeName = 'CashToPaintCanisters',
    fromMoney = 100,
    fromMoneyType = 'cash',
    toItems = {
        { name = 'paint_canister', amount = 10 }
    },
}

local CashToPaintRemovalSpray = {
    tradeName = 'CashToPaintRemovalSpray',
    fromMoney = 80,
    fromMoneyType = 'cash',
    toItems = {
        { name = 'paint_removal_spray', amount = 10 }
    },
}

--------------------------
-- RELATED TO CW-TOKENS --
--------------------------
local TokenToUzi = {
    tradeName = 'TokenToUzi',
    fromItems = {
        { name = 'cw_token', amount = 1, }
    },
    tokenValue = 'tradeUzi',
    type = 'illegal',
    toItems = {
        { name = 'weapon_microsmg', amount = 1, info = { serie = ""}}
    },
}

local TokenToPistol = {
    tradeName = 'TokenToPistol',
    fromItems = {
        { name = 'cw_token', amount = 1, }
    },
    tokenValue = 'tradePistol',
    type = 'illegal',
    toItems = {
        { name = 'weapon_pistol', amount = 1, info = { serie = ""}}
    },
}

local TokenToSawedOff = {
    tradeName = 'TokenToSawedOff',
    fromItems = {
        { name = 'cw_token', amount = 1, }
    },
    tokenValue = 'tradeSawedOff',
    type = 'illegal',
    toItems = {
        { name = 'weapon_sawnoffshotgun', amount = 1, info = { serie = ""}}
    },
}

local TokenToMolotov = {
    tradeName = 'TokenToMolotov',
    fromItems = {
        { name = 'cw_token', amount = 1, }
    },
    tokenValue = 'tradeMolotov',
    type = 'illegal',
    toItems = {
        { name = 'weapon_molotov', amount = 1, info = { serie = ""}}
    },
}

local TokenToDoubleBarrel = {
    tradeName = 'TokenToDoubleBarrel',
    fromItems = {
        { name = 'cw_token', amount = 1, }
    },
    tokenValue = 'tradeDoubleBarrel',
    type = 'illegal',
    toItems = {
        { name = 'weapon_dbshotgun', amount = 1, info = { serie = ""}}
    },
}

local TokenToMilRifle = {
    tradeName = 'TokenToMilRifle',
    fromItems = {
        { name = 'cw_token', amount = 1, }
    },
    tokenValue = 'tradeMilRifle',
    type = 'illegal',
    toItems = {
        { name = 'weapon_militaryrifle', amount = 1,  info = { serie = ""}}
    },
}

local TokenToMeth = {
    tradeName = 'TokenToMeth',
    fromItems = {
        { name = 'cw_token', amount = 1, }
    },
    tokenValue = 'tradeMeth',
    type = 'illegal',
    toItems = {
        { name = 'crack_baggy', amount = 30}
    },
}

local TokenToCrack = {
    tradeName = 'TokenToCrack',
    fromItems = {
        { name = 'cw_token', amount = 1, }
    },
    tokenValue = 'tradeCrack',
    type = 'illegal',
    toItems = {
        { name = 'crack_baggy', amount = 30}
    },
}

Config.Trades = {
    ['SandwichToBeer'] = SandwichToBeer,
    ['PhoneToCash'] = PhoneToCash,
    ['BeerToMeth'] = BeerToMeth,
    ['FoodToGolfClub'] = FoodToGolfClub,
    ['RollsToMeth'] = RollsToMeth,
    ['RollsToHeavyPistol'] = RollsToHeavyPistol,
    ['RollsToUzi'] = RollsToUzi,
    ['CashToPaintGun'] = CashToPaintGun,
    ['CashToPaintCanisters'] = CashToPaintCanisters,
    ['CashToPaintRemovalSpray'] = CashToPaintRemovalSpray,
    ['TokenToUzi'] = TokenToUzi,
    ['TokenToPistol'] = TokenToPistol,
    ['TokenToSawedOff'] = TokenToSawedOff,
    ['TokenToMolotov'] = TokenToMolotov,
    ['TokenToDoubleBarrel'] = TokenToDoubleBarrel,
    ['TokenToCrack'] = TokenToCrack,
    ['TokenToMeth'] = TokenToMeth,
    ['NotesToThermite'] = NotesToThermite,
    ['TokenToMilRifle'] = TokenToMilRifle,
    ['NotesToSMGParts'] = NotesToSMGParts,
    ['NotesToRifleParts'] = NotesToRifleParts,
    ['SlipToTicket'] = SlipToTicket,
}