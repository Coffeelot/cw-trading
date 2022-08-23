local QBCore = exports['qb-core']:GetCoreObject() 

RegisterNetEvent('cw-trade:client:attemptTrade', function(data)
    local tradeName = data.tradeName
    local trade = Config.Trades[tradeName]
    if Config.Debug then
       print(tradeName)
    end
    if trade then 
        local qbFromItem = QBCore.Shared.Items[trade.fromItem]
        if qbFromItem then 
            QBCore.Functions.TriggerCallback('QBCore:HasItem', function(result)
                if result then
                    TriggerEvent('animations:client:EmoteCommandStart', {"argue2"})
                    QBCore.Functions.Progressbar("item_check", 'Discussing trade', 2000, false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                        }, {
                        }, {}, {}, function() -- Done
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
                                TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                                TriggerServerEvent('cw-trade:server:tradeItems', trade)
                            end
                        end, function()
                            TriggerEvent('animations:client:EmoteCommandStart', {"damn"})
                            QBCore.Functions.Notify('You do not have enough '..qbFromItem.label.. ' on you.' , 'error')
                        end)
                else
                    TriggerEvent('animations:client:EmoteCommandStart', {"damn"})
                    QBCore.Functions.Notify('You do not have the items needed', 'error')
                end
            end, qbFromItem.name , trade.fromAmount)
        else
            TriggerEvent('animations:client:EmoteCommandStart', {"damn"})
            QBCore.Functions.Notify('Item doesnt exist', 'error')
        end

    else
        TriggerEvent('animations:client:EmoteCommandStart', {"damn"})
        QBCore.Functions.Notify('Trade doesnt exist', 'error')
    end 
end)