local QBCore = exports['qb-core']:GetCoreObject()
local useDebug = Config.Debug

local function getQBItem(item)
    local qbItem = QBCore.Shared.Items[item]
    if qbItem then
        return qbItem
    else
        print('Someone forgot to add the item')
    end
end

local function addItem(item, amount, info, source)
    if Config.Inventory == 'qb' then
    	local Player = QBCore.Functions.GetPlayer(source)
        Player.Functions.AddItem(item, amount, nil, info)
        TriggerClientEvent('inventory:client:ItemBox', source, getQBItem(item), "add")
    elseif Config.Inventory == 'ox' then
        exports.ox_inventory:AddItem(source, item, amount, info)
    end
end

local function removeItem(item, amount, source)
    local Player = QBCore.Functions.GetPlayer(source)
    if Config.Inventory == 'qb' then
        Player.Functions.RemoveItem(item, amount, nil)
        TriggerClientEvent('inventory:client:ItemBox', source, getQBItem(item), "remove")
    elseif Config.Inventory == 'ox' then
        exports.ox_inventory:RemoveItem(source, item, amount, nil, nil)
    end
end

RegisterServerEvent('cw-trade:server:tradeItems', function(trade)
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)

    if Config.UseTokens and trade.tokenValue ~= nil then
        if useDebug then
           print('Doing token trade')
        end
        TriggerEvent('cw-tokens:server:TakeToken', src, trade.tokenValue)
        for i, item in pairs(trade.toItems) do
            if useDebug then
                print('adding items to pockets (from token trade)')
            end
            addItem(item.name, item.amount,nil, src)
        end
    else
        if trade.fromMoney then
            if useDebug then
                print('Handling a from money trade')
            end
            local moneyType = 'cash'
            if trade.fromMoneyType then
                moneyType = trade.fromMoneyType
            end
            Player.Functions.RemoveMoney(moneyType, trade.fromMoney, 'Cw-Trades')
        end
        if trade.fromItems then
            for i, item in pairs(trade.fromItems) do
                if useDebug then
                   print('removing items from pockets')
                end
                removeItem(item.name, item.amount, src)
            end
        end

        if trade.toMoney then
            if useDebug then
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
                if useDebug then
                   print('adding items to pockets')
                end
                addItem(item.name, item.amount, item.info, src)
            end
        end
        if trade.toBills then
            if useDebug then
               print('Doing Dirty Bills Trade')
            end
            local info = {
                worth = math.random(trade.toBills.min, trade.toBills.max)
            }
            addItem('markedbills', math.random(1,2), info, src)
        end
        if trade.toCrypto then
            if useDebug then
                print('Doing Crypto Trade')
             end
            local payout = math.random(trade.toCrypto.min, trade.toCrypto.max)
            Player.Functions.AddMoney('crypto', tonumber(payout))
        end
    end
    TriggerClientEvent('cw-trade:client:freeinventory', src)
end)

QBCore.Commands.Add('cwdebugtrade', 'toggle debug for trade', {}, true, function(source, args)
    useDebug = not useDebug
    print('debug is now:', useDebug)
    TriggerClientEvent('cw-trade:client:toggleDebug',source, useDebug)
end, 'dev')