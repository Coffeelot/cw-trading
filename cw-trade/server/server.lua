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
            if Config.Debug then
                print('adding items to pockets (from token trade)')
             end
            Player.Functions.AddItem(item.name, item.amount)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item.name], "add")
        end
    else
        if trade.fromMoney then
            if Config.Debug then
                print('Handling a from money trade')
            end
            local moneyType = 'cash'
            if trade.fromMoneyType then
                moneyType = trade.fromMoneyType
            end
            Player.Functions.RemoveMoney(moneyType, trade.fromMoney)
        end
        if trade.fromItems then
            for i, item in pairs(trade.fromItems) do
                if Config.Debug then
                   print('removing items from pockets')
                end
                Player.Functions.RemoveItem(item.name, item.amount)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item.name], "remove")
            end
        end

        if trade.toMoney then
            if Config.Debug then
                print('Doing To Money Trade')
            end
            local moneyType = 'cash'
            if trade.toMoneyType then
                moneyType = trade.toMoneyType
            end
            local payout = math.random(trade.toMoney.min, trade.toMoney.max)
            Player.Functions.AddMoney(moneyType, tonumber(payout))
        end

        if trade.toItems then
            for i, item in pairs(trade.toItems) do
                if Config.Debug then
                   print('adding items to pockets')
                end
                if item.info then
                    Player.Functions.AddItem(item.name, item.amount, nil, item.info)
                else
                    Player.Functions.AddItem(item.name, item.amount)
                end
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item.name], "add")
            end
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
