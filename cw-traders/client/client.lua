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

local function canInteract(trader, tradeName)
    local trade = exports['cw-trade']:getTrade(tradeName)
    if trade and trade.tokenValue then
        if useDebug then
           print(tradeName, 'has token trade:', trade.tokenValue)
        end
        local hasToken = exports['cw-tokens']:hasToken(trade.tokenValue)
        if hasToken then return checkTimeAvailability(trader) else return false end
    else
        return checkTimeAvailability(trader)
    end
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