--============ Script ============--

if Config.DisableNativeCopsAndCarsSpawning then
    Citizen.CreateThread(function()
        Citizen.Wait(5000)
        while true do
            Citizen.Wait(100)
            local plyPed = PlayerPedId()
            local plyLoc = GetEntityCoords(plyPed)
            ClearAreaOfCops(plyLoc.x, plyLoc.y, plyLoc.z, 424.0)
        end
    end)
end
    
