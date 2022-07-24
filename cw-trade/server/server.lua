local QBCore = exports['qb-core']:GetCoreObject() 

RegisterServerEvent('cw-trade:server:tradeItems', function(trade)
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)

    Player.Functions.RemoveItem(trade.fromItem, trade.fromAmount)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[trade.fromItem], "remove")

    if trade.toCash then
        local payout = math.random(trade.toCash.min, trade.toCash.max)
        Player.Functions.AddMoney('cash', tonumber(payout)) 
    elseif trade.toBills then
        print('Entered toBills server script')
        local info = {
            worth = math.random(trade.toBills.min, trade.toBills.max)
        }
        Player.Functions.AddItem('markedbills', math.random(1,2), false, info)
        TriggerClientEvent('inventory:client:ItemBox',src, QBCore.Shared.Items['markedbills'], "add")
    else
        Player.Functions.AddItem(trade.toItem, trade.toAmount)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[trade.toItem], "add")
    end
end)
