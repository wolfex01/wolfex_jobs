local cursorState = false
RegisterNUICallback('setJob', function(data) 
    cursorState = not cursorState
    SendNUIMessage({
        type = 'job'
    })
    SetNuiFocus(cursorState,cursorState)
    TriggerServerEvent('setJob', data.job)
end)

local openJobcenter = function() 
    cursorState = not cursorState
    SetNuiFocus(cursorState, cursorState)
    SendNUIMessage({
        type = 'job',
        jobs = Config.Jobs
    })
end    

CreateThread(function() 
    while true do 
        Citizen.Wait(5)
    local myCoords = GetEntityCoords(PlayerPedId())
    for k,v in ipairs(Config.JobCoords) do
        if GetDistanceBetweenCoords(myCoords.x, myCoords.y, myCoords.z, v[1].x, v[1].y, v[1].z) < 5 then
            DrawMarker(25, v[1].x, v[1].y, v[1].z -1, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 1.0, 1.0, 1.0, 255, 128, 0, 50, false, true, 2, nil, nil, false)
                if IsControlJustPressed(0,38) then
                    openJobcenter()
                end
            end
        end        
    end
end)

