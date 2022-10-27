local QBCore = exports['qb-core']:GetCoreObject() 

RegisterNetEvent('cw-trade:client:attemptTrade', function(data)
    local tradeName = data.tradeName
    local trade = Config.Trades[tradeName]
    if Config.Debug then
        print('trade name: ', tradeName)
    end
    if trade then 
        local amountOfItemsPlayerHas = 0
        if Config.Debug then
           print('amount of From items:', #trade.fromItems)
        end
        for i,item in pairs(trade.fromItems) do
            if QBCore.Functions.HasItem(item.name , item.amount) then
                if Config.Debug then
                   print('Player has '..item.amount..' '..item.name)
                end
                amountOfItemsPlayerHas = amountOfItemsPlayerHas + 1
            else
                if Config.Debug then
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

        if Config.Debug then
           print('amountOfItemsPlayerHas', amountOfItemsPlayerHas, 'amount of from items:', #trade.fromItems )
        end
    
        if (amountOfItemsPlayerHas == #trade.fromItems) then
            TriggerEvent('animations:client:EmoteCommandStart', {"argue2"})
            QBCore.Functions.Progressbar("item_check", 'Discussing trade', 2000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
                }, {
                }, {}, {}, function() -- Done
                    if Config.Debug then
                       print('Tokens: ', Config.UseTokens)
                       print('Token value: ', trade.tokenValue)
                    end
                    if Config.UseTokens and trade.tokenValue ~= nil then
                        if Config.Debug then
                        print('Doing token trade')
                        end
                        local tokens = nil
                        local tokenName = trade.tokenValue
                        QBCore.Functions.TriggerCallback('cw-tokens:server:PlayerHasToken', function(result, value)
                            tokens = result
                        end)
                        Wait(100)
                        if tokens[tokenName] ~= nil then
                            if Config.Debug then
                            print('found a token with '..tokenName)
                            end
                            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                            TriggerServerEvent('cw-trade:server:tradeItems', trade)
                        else
                            TriggerEvent('animations:client:EmoteCommandStart', {"damn"})
                            QBCore.Functions.Notify('You do not have the right token on you.' , 'error')        
                        end
                    else
                        if Config.Debug then
                           print('Trade was initiated - calling server side')
                        end
                        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                        TriggerServerEvent('cw-trade:server:tradeItems', trade)
                    end
                end, function()
                    TriggerEvent('animations:client:EmoteCommandStart', {"damn"})
                    QBCore.Functions.Notify('You do not have the required items on you.' , 'error')
                end)
        end            
    else
        TriggerEvent('animations:client:EmoteCommandStart', {"damn"})
        QBCore.Functions.Notify('Trade doesnt exist', 'error')
    end 
end)