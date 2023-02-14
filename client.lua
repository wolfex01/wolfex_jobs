local cursorState = false -- inicializáljuk a kurzor állapotát, és beállítjuk, hogy kezdetben inaktív
local jobCenterMarker = 25 -- egy konstans érték, amely a DrawMarker függvény marker típusának megadására szolgál
local jobCenterRadius = 5.0 -- a munkaközpont marker észleléséhez használt hatósugár

-- a "setJob" NUI callback függvény, amelyet a kliens oldalon hívunk meg a munka beállítására
RegisterNUICallback('setJob', function(data)
    cursorState = not cursorState -- a kurzor állapotának megváltoztatása
    SetNuiFocus(cursorState, cursorState) -- a NUI fókusz beállítása az aktuális kurzor állapot szerint
    SendNUIMessage({ type = 'job' }) -- elküldjük az üzenetet az NUI felületnek a "job" típussal
    TriggerServerEvent('setJob', data.job) -- elküldjük a szervernek a "setJob" eseményt adatainkkal
end)

-- a "job center" megnyitása
local openJobCenter = function()
    cursorState = not cursorState -- a kurzor állapotának megváltoztatása
    SetNuiFocus(cursorState, cursorState) -- a NUI fókusz beállítása az aktuális kurzor állapot szerint
    SendNUIMessage({ type = 'job', jobs = Config.Jobs }) -- elküldjük az üzenetet az NUI felületnek a "job" és "jobs" típusokkal
end

-- fő szál
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)

        local myCoords = GetEntityCoords(PlayerPedId())

        -- végigmegyünk a Config.JobCoords tömbön, és megjelenítjük a munkaközpontokat a játékban
        for _, jobCoord in ipairs(Config.JobCoords) do
            local jobCoordDistance = GetDistanceBetweenCoords(myCoords, jobCoord[1], true)

            -- ha a játékos elég közel van a markerhez, akkor megjelenítjük azt, és ha megnyomja az F kulcsot, akkor megnyitjuk a "job center"-t
            if jobCoordDistance <= jobCenterRadius then
                DrawMarker(jobCenterMarker, jobCoord[1], 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 1.0, 1.0, 1.0, 255, 128, 0, 50, false, true, 2, nil, nil, false)

            if IsControlJustPressed(0, 38) then
                 openJobCenter()
             end
            end
        end
    end
end)

