if Config.Framework == 'ESX' then
    ESX = nil
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
elseif Config.Framework == 'QB' then
    QBCore = exports['qb-core']:GetCoreObject()
end

RegisterServerEvent('setJob', function(job)
    for _, jobName in ipairs(Config.Jobs) do
        if jobName == job then
            if Config.Framework == 'ESX' then
                local xPlayer = ESX.GetPlayerFromId(source)
                xPlayer.setJob(job, 0)
                xPlayer.showNotification('Hey, you have a new job, ' .. job)
            elseif Config.Framework == 'QB' then
                local Player = QBCore.Functions.GetPlayer(source)
                Player.Functions.SetJob(job, 0)
                TriggerClientEvent('QBCore:Notify', source, 'Hey, you have a new job, ' .. job)
            end
            break
        end
    end
end)
