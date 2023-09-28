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
    else
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
            if trade.allowBatchTrade then
                local label = trade.tradeLabel.. ' (Menu)'
                if trade.batchTradeLabel then
                    label = trade.batchTradeLabel
                end
                local batchOption = {
                    type = "client",
                    event = "cw-traders:client:openBatchTrade",
                    icon = "fas fa-calculator",
                    gang = trader.gang,
                    label = label,
                    tradeName = trade.tradeName,
                    canInteract = function()
                        return canInteract(trader,trade.tradeName)
                    end
                }
                table.insert(options, batchOption)
            end
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
            if trader.allowBatchTrade then
                local label = trader.tradeLabel.. ' (Menu)'
                if trader.batchTradeLabel then
                    label = trader.batchTradeLabel
                end
                local batchOption = {
                    type = "client",
                    event = "cw-traders:client:openBatchTrade",
                    icon = "fas fa-calculator",
                    gang = trader.gang,
                    label = label,
                    tradeName = trader.tradeName,
                    canInteract = function()
                        return canInteract(trader,trader.tradeName)
                    end
                }
                table.insert(options, batchOption)
            end
    end
    return options
end

local function spawnPed(ped)
    local animation
    if ped.animation then
        animation = ped.animation
    else
        animation = "WORLD_HUMAN_STAND_IMPATIENT"
    end
    RequestModel(ped.model)
    while not HasModelLoaded(ped.model) do
        Wait(0)
    end
    
    local translateV = vector4(0.0, 0.0, -1.0, 0.0)

    local traderPed = CreatePed(4, ped.model, ped.coords + translateV, false, false)
    SetEntityAsMissionEntity(traderPed, true, true)
    SetPedHearingRange(traderPed, 0.0)
    SetPedSeeingRange(traderPed, 0.0)
    SetPedAlertness(traderPed, 0.0)
    SetPedFleeAttributes(traderPed, 0, 0)
    SetBlockingOfNonTemporaryEvents(traderPed, true)
    SetPedCombatAttributes(traderPed, 46, true)
    TaskStartScenarioInPlace(traderPed, animation, 0, true)
    SetEntityInvincible(traderPed, true)
    SetEntityCanBeDamaged(traderPed,false)
    SetEntityProofs(traderPed, true, true, true, true, true, true, 1, true)
    FreezeEntityPosition(traderPed, true)

    if Config.Sundown then
        exports['sundown-utils']:addPedToBanlist(traderPed)
    end

    exports['qb-target']:AddTargetEntity(traderPed, {
        options = getOptions(ped),
        distance = 2.0
    })

    Entities[#Entities+1] = traderPed
end

--- Create trader joes
CreateThread(function()
    for i,v in pairs(Config.Traders) do
        spawnPed(v)
    end
    if Config.UseTokens then
        for i,v in pairs(Config.TokenTraders) do
            spawnPed(v)
        end
    end
    if Config.UseRGB then
        for i,v in pairs(Config.RGBTraders) do
            spawnPed(v)
        end
    end

end)

local function calculateMaximumAmount(trade)
    local max = 0
    local noMore = false
    for multiplier=1,20 do
        for i, item in pairs(trade.fromItems) do
            if trade.fromMoney then
                local Player = QBCore.Functions.GetPlayerData()
                return Player.money[trade.fromMoneyType] >= trade.fromMoney*multiplier
            else
                for i,item in pairs(trade.fromItems) do
                    if hasItem(item.name , item.amount*multiplier) then
                        if useDebug then
                            print('Player has '..item.amount*multiplier..' '..item.name)
                        end
                        max = max + 1
                    else
                        if useDebug then
                            print('Player DOES NOT have '..item.amount*multiplier..' '..item.name)
                        end
                        noMore = true
                    end
                    if noMore then return max end
                end
            end
        end
    end
    return max
end

RegisterNetEvent('cw-traders:client:openBatchTrade', function(data)
    local trade =  exports['cw-trade']:getTrade(data.tradeName)
    local selectOptions = {}
    for a=1,calculateMaximumAmount(trade) do
        selectOptions[#selectOptions+1] = { value = a, text = tostring(a) }
    end

    if trade.fromItems then
        local dialog = exports['qb-input']:ShowInput({
            header = "Trade Menu",
            submitText = "Confirm",
            inputs = {{
                text ="Amount to trade", -- text you want to be displayed as a place holder
                name = "amount", -- name of the input should be unique otherwise it might override
                type = "select", -- type of the input - number will not allow non-number characters in the field so only accepts 0-9
                options = selectOptions,
                isRequired = true, -- Optional [accepted values: true | false] but will submit the form if no value is inputted
            }},
        })

        if dialog ~= nil then
            local modifier = dialog["amount"]
            TriggerEvent("cw-trade:client:attemptTrade", data, modifier)
        end
    else
        QBCore.Functions.Notify("This trade doesn't have items", "error")
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