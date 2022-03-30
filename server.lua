if Config.ESX then
ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
elseif Config.QB then
    QBCore =  exports['qb-core']:GetCoreObject()
end

RegisterServerEvent('setJob', function(job)
    local Player = nil
    if Config.ESX then
          Player = ESX.GetPlayerFromId(source) 
    elseif Config.QB then
          Player = QBCore.Functions.GetPlayer(source) 
    end
    for k, v in pairs(Config.Jobs) do
        if v == job then
            if Config.ESX then
            xPlayer.setJob(job, 0)
            print('Successfully set job: '..xPlayer.getName())
            xPlayer.showNotification('Hey, you have a new job, '..job)
            elseif Config.QB then
                local JobInfo = QBCore.Shared.Jobs[job]
                Player.Functions.SetJob(job, 0)
                TriggerClientEvent('QBCore:Notify', src, 'Congratulations with your new job! ('..JobInfo.label..')')
            end
        end
    end
end)
