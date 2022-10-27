local QBCore = exports['qb-core']:GetCoreObject() 

RegisterServerEvent('cw-trade:server:tradeItems', function(trade)
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)

    if Config.UseTokens and trade.tokenValue ~= nil then
        if Config.Debug then
           print('Doing token trade')
        end
        TriggerEvent('cw-tokens:server:TakeToken', src, trade.tokenValue)
        for i, item in pairs(trade.toItems) do
            Player.Functions.AddItem(item.name, item.amount)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item.name], "add")
        end
    else
        for i, item in pairs(trade.fromItems) do
            Player.Functions.RemoveItem(item.name, item.amount)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item.name], "remove")
        end
        for i, item in pairs(trade.toItems) do
            Player.Functions.AddItem(item.name, item.amount)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item.name], "add")
        end
    
        if trade.toCash then
            if Config.Debug then
                print('Doing Cash Trade')
             end
            local payout = math.random(trade.toCash.min, trade.toCash.max)
            Player.Functions.AddMoney('cash', tonumber(payout))
        end
        if trade.toBills then
            if Config.Debug then
               print('Doing Dirty Bills Trade')
            end
            local info = {
                worth = math.random(trade.toBills.min, trade.toBills.max)
            }
            Player.Functions.AddItem('markedbills', math.random(1,2), false, info)
            TriggerClientEvent('inventory:client:ItemBox',src, QBCore.Shared.Items['markedbills'], "add")
        end
        if trade.toCrypto then
            if Config.Debug then
                print('Doing Crypto Trade')
             end
            local payout = math.random(trade.toCrypto.min, trade.toCrypto.max)
            Player.Functions.AddMoney('crypto', tonumber(payout)) 
        end    
    end

end)
