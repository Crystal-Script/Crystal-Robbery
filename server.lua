RegisterServerEvent('log')
AddEventHandler('log', function()
    TriggerEvent("esx:server:CreateLog", "robbery", "LOG ROBBERY", "orange", ' Hai iniziato una rapina: ')
end)

RegisterServerEvent('rapina:finita')
AddEventHandler('rapina:finita', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addAccountMoney('black_money', math.random(5000, 15000))
end)


RegisterServerEvent('rapina:finita1')
AddEventHandler('rapina:finita1', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addAccountMoney('money', math.random(5000, 15000))
end)

RegisterServerEvent('togli:lockpick')
AddEventHandler('togli:lockpick', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem('lockpick', 1)
end)