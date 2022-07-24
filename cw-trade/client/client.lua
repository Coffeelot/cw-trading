local QBCore = exports['qb-core']:GetCoreObject() 

RegisterNetEvent('cw-trade:client:attemptTrade', function(data)
    local tradeName = data.tradeName
    local trade = Config.Trades[tradeName]

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
                        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                        TriggerServerEvent('cw-trade:server:tradeItems', trade)
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