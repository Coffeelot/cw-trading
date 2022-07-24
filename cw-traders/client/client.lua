local QBCore = exports['qb-core']:GetCoreObject() 



function canInteract(trader) 
    if trader.available then
        if trader.available.from > trader.available.to then
            if GetClockHours() >= trader.available.from or GetClockHours() < trader.available.to then return true else return false end
        else
            if GetClockHours() >= trader.available.from and GetClockHours() < trader.available.to then return true else return false end
        end
    end
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

        exports['qb-target']:SpawnPed({
            model = v.model,
            coords = v.coords,
            minusOne = true,
            freeze = true,
            invincible = true,
            blockevents = true,
            scenario = animation,
            target = {
                options = {
                    { 
                        type = "client",
                        event = "cw-trade:client:attemptTrade",
                        icon = "fas fa-handshake",
                        label = v.tradeLabel,
                        tradeName = v.tradeName,
                        canInteract = function()
                            return canInteract(v)
                        end
                    },               
                },
                distance = 3.0 
            },
            spawnNow = true,
            currentpednumber = 0,
        })
    end

end)