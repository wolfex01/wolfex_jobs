ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('setJob', function(job) 
    local xPlayer = ESX.GetPlayerFromId(source)
    for k, v in pairs(Config.Jobs) do
        if v == job then
            xPlayer.setJob(job, 1)
            print('Successfully set jobbed'..xPlayer.getName())
            xPlayer.showNotification('Hey, you have a new job, '..job)
        end
    end
end)