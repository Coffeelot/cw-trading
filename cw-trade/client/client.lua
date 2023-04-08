local QBCore = exports['qb-core']:GetCoreObject()
local useDebug = Config.Debug
local rep = nil

local function PoliceCall()
    if Config.PoliceCallChance >= math.random(1, 100) then
        TriggerServerEvent('police:server:policeAlert', 'Suspicous activity')
    end
end


local function hasItem(item, amount)
    if Config.Inventory == 'qb' then
        return QBCore.Functions.HasItem(item, amount)
    elseif Config.Inventory == 'ox' then
        local fromItem = exports.ox_inventory:Search('count', item)
        if fromItem < amount then return false end
        return true
    end
end

local function attemptTrade(trade)
    TriggerEvent('animations:client:EmoteCommandStart', {"argue2"})
    if trade.type == 'illegal' then
        PoliceCall()
    end

    QBCore.Functions.Progressbar("item_check", 'Discussing trade', 2000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
        }, {
        }, {}, {}, function() -- Done
            if useDebug then
               print('Tokens: ', Config.UseTokens)
               print('Token value: ', trade.tokenValue)
            end
            if Config.UseTokens and trade.tokenValue ~= nil then
                if useDebug then
                print('Doing token trade')
                end
                local tokens = nil
                local tokenName = trade.tokenValue
                QBCore.Functions.TriggerCallback('cw-tokens:server:PlayerHasToken', function(result, value)
                    tokens = result
                end)
                Wait(100)
                if tokens[tokenName] ~= nil then
                    if useDebug then
                    print('found a token with '..tokenName)
                    end
                    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                    TriggerServerEvent('cw-trade:server:tradeItems', trade)
                else
                    TriggerEvent('animations:client:EmoteCommandStart', {"damn"})
                    QBCore.Functions.Notify('You do not have the right token on you.' , 'error')
                end
            else
                if useDebug then
                   print('Trade was initiated - calling server side')
                end
                TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                TriggerServerEvent('cw-trade:server:tradeItems', trade)
            end
        end, function()
            TriggerEvent('animations:client:EmoteCommandStart', {"damn"})
            QBCore.Functions.Notify('You do not have the required items on you.' , 'error')
        end)
    LocalPlayer.state.invBusy = false
end

RegisterNetEvent('cw-trade:client:attemptTrade', function(data)
    local tradeName = data.tradeName
    local trade = Config.Trades[tradeName]
    if useDebug then
        print('trade name: ', tradeName)
    end

    if trade then
        LocalPlayer.state.invBusy = true
        local amountOfItemsPlayerHas = 0
        if trade.fromItems then
            if useDebug then
               print('amount of From items:', #trade.fromItems)
            end
            for i,item in pairs(trade.fromItems) do
                if hasItem(item.name , item.amount) then
                    if useDebug then
                       print('Player has '..item.amount..' '..item.name)
                    end
                    amountOfItemsPlayerHas = amountOfItemsPlayerHas + 1
                else
                    if useDebug then
                       print('Player doesnt have '..item.amount..' '..item.name)
                    end
                    if not QBCore.Shared.Items[item.name] then
                        print('Item does not exist in qbcore shared items!', item.name)
                    else
                        TriggerEvent('animations:client:EmoteCommandStart', {"shrug"})
                        QBCore.Functions.Notify('You do not have enough '..QBCore.Shared.Items[item.name].label.. ' on you.' , 'error')
                    end
                end
            end

            if useDebug then
               print('amountOfItemsPlayerHas', amountOfItemsPlayerHas, 'amount of from items:', #trade.fromItems )
            end

            if (amountOfItemsPlayerHas == #trade.fromItems) then
                local Player = QBCore.Functions.GetPlayerData()

                attemptTrade(trade)
            end
        else
            LocalPlayer.state.invBusy = true
            if useDebug then
                print('Handling a cash trade without items')
                print('Amount: ', trade.fromMoney)
            end
            local Player = QBCore.Functions.GetPlayerData()
            if Player.money[trade.fromMoneyType] >= trade.fromMoney then
                attemptTrade(trade)
            else
                QBCore.Functions.Notify('You do not have enough '..trade.fromMoneyType.. ' on you.' , 'error')
            end
        end
    else
        TriggerEvent('animations:client:EmoteCommandStart', {"damn"})
        QBCore.Functions.Notify('Trade doesnt exist', 'error')
    end
end)

RegisterNetEvent('cw-trade:client:toggleDebug', function(debug)
   print('Setting debug to',debug)
   useDebug = debug
end)

function getTrade(tradeName)
    if Config.Trades[tradeName] then
        return Config.Trades[tradeName]
    else
        return nil
    end
end

RegisterNetEvent('cw-trade:client:freeinventory', function()
    LocalPlayer.state.invBusy = false
end)