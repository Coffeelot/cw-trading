local QBCore = exports['qb-core']:GetCoreObject()
local useDebug = Config.Debug
local Entities = {}

local function checkTimeAvailability(trader)
    if trader.available then
        if trader.available.from > trader.available.to then
            if GetClockHours() >= trader.available.from or GetClockHours() < trader.available.to then return true else return false end
        else
            if GetClockHours() >= trader.available.from and GetClockHours() < trader.available.to then return true else return false end
        end
    else
        return true
    end
end

local function hasItem(item, amount)
    if Config.UseOxInv then
        local fromItem = exports.ox_inventory:Search('count', item)
        if fromItem < amount then return false end
        return true
    elseif Config.Inventory == 'ox' then
        return QBCore.Functions.HasItem(item, amount)
    end
end

local function verifyHasItems(trade)
    if Config.SecretTrades then
        local amountOfItemsPlayerHas = 0
        if trade.fromMoney then
            local Player = QBCore.Functions.GetPlayerData()
            return Player.money[trade.fromMoneyType] >= trade.fromMoney
        else
            for i,item in pairs(trade.fromItems) do
                if hasItem(item.name , item.amount) then
                    if useDebug then
                       print('Player has '..item.amount..' '..item.name)
                    end
                    amountOfItemsPlayerHas = amountOfItemsPlayerHas + 1
                else
                    if useDebug then
                       print('Player DOES NOT have '..item.amount..' '..item.name)
                    end
                    return false
                end
            end
        end
    end 
    return true
end

local function verifyRep(trade)
    if trade and trade.reptype then
        local rep = exports["mz-skills"]:GetCurrentSkill(trade.reptype).Current
        return rep > trade.rep
    end
    return true
end

local function verifyHasToken(trade)
    if trade and trade.tokenValue then
        local hasToken = exports['cw-tokens']:hasToken(trade.tokenValue)
        if hasToken then return true else return false end
    end
    return true
end

local function canInteract(trader, tradeName)
    local trade = exports['cw-trade']:getTrade(tradeName)
    if trade then
        local hasItems = verifyHasItems(trade)
        local hasToken = verifyHasToken(trade)
        local hasRep = verifyRep(trade)
        local hasTime = checkTimeAvailability(trader)
        return hasItems and hasToken and hasRep and hasTime
    else
        print('trade', tradeName, 'did not exist')
    end
    return false
end

local function getOptions(trader)
    local options = {}
    if trader.trades then
        for i,trade in pairs(trader.trades) do
            if useDebug then
               print(trade.tradeLabel)
            end
            local option = {
                type = "client",
                event = "cw-trade:client:attemptTrade",
                icon = "fas fa-handshake",
                gang = trader.gang,
                label = trade.tradeLabel,
                tradeName = trade.tradeName,
                canInteract = function()
                    return canInteract(trader,trade.tradeName)
                end
            }
            table.insert(options, option)
        end
    else
        options = {
            {
                type = "client",
                event = "cw-trade:client:attemptTrade",
                icon = "fas fa-handshake",
                gang = trader.gang,
                label = trader.tradeLabel,
                tradeName = trader.tradeName,
                canInteract = function()
                    return canInteract(trader, trader.tradeName)
                end
            }}
    end
    return options
end

--- Create trader joes
CreateThread(function()
    for i,v in pairs(Config.Traders) do
        local animation
        if v.animation then
            animation = v.animation
        else
            animation = "WORLD_HUMAN_STAND_IMPATIENT"
        end

        Entities[#Entities+1] =  exports['qb-target']:SpawnPed({
            model = v.model,
            coords = v.coords,
            minusOne = true,
            freeze = true,
            invincible = true,
            blockevents = true,
            scenario = animation,
            target = {
                options = getOptions(v),
                distance = 3.0
            },
            spawnNow = true,
            currentpednumber = 0,
        })
    end
    if Config.UseTokens then
        for i,v in pairs(Config.TokenTraders) do
            local animation
            if v.animation then
                animation = v.animation
            else
                animation = "WORLD_HUMAN_STAND_IMPATIENT"
            end

            Entities[#Entities+1] = exports['qb-target']:SpawnPed({
                model = v.model,
                coords = v.coords,
                minusOne = true,
                freeze = true,
                invincible = true,
                blockevents = true,
                scenario = animation,
                target = {
                    options = getOptions(v),
                    distance = 3.0
                },
                spawnNow = true,
                currentpednumber = 0,
            })
        end
    end
    if Config.UseRGB then
        for i,v in pairs(Config.RGBTraders) do
            local animation
            if v.animation then
                animation = v.animation
            else
                animation = "WORLD_HUMAN_STAND_IMPATIENT"
            end

            Entities[#Entities+1] =  exports['qb-target']:SpawnPed({
                model = v.model,
                coords = v.coords,
                minusOne = true,
                freeze = true,
                invincible = true,
                blockevents = true,
                scenario = animation,
                target = {
                    options = getOptions(v),
                    distance = 3.0
                },
                spawnNow = true,
                currentpednumber = 0,
            })
        end
    end

end)

RegisterNetEvent('cw-trade:client:toggleDebug', function(debug)
   print('Setting debug to',debug)
   useDebug = debug
end)

AddEventHandler('onResourceStop', function (resource)
   if resource ~= GetCurrentResourceName() then return end
   for i, entity in pairs(Entities) do
       print('deleting', entity)
       if DoesEntityExist(entity) then
          DeleteEntity(entity)
       end
    end
end)