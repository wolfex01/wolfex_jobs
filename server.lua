ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('setJob', function(job)
    local xPlayer = ESX.GetPlayerFromId(source) -- lekérjük a játékos objektumot az azonosító alapján

    -- végigmegyünk a Config.Jobs táblán, és beállítjuk a munkát, ha megtaláljuk azt
    for _, jobName in ipairs(Config.Jobs) do
        if jobName == job then
            xPlayer.setJob(job, 1) -- beállítjuk a játékos munkáját
            print('Successfully set job for ' .. xPlayer.getName()) -- naplózzuk az eseményt
            xPlayer.showNotification('Hey, you have a new job, ' .. job) -- küldünk egy értesítést a játékosnak a munka beállításáról
            break -- kilépünk a ciklusból, ha megtaláltuk a munkát
        end
    end
end)
