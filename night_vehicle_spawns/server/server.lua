--============ Variables ============--

local firstSpawn = true
local refreshing = false -- Future
local spawnedVehicles = {}
local keysToRemove = {}

--============ Script ============--

local vehicleCount = 1

-- Network stuff
local count = 0
Citizen.CreateThread(function()
    Citizen.Wait(5000)
    while true do
        local players = GetPlayers()
        if #players >= 1 and not refreshing then
            DebugPrint("[^5INFO^7] "..(#players).." Player(s) online, attempting to spawn vehicles...")
            for k, v in pairs(Config.VehiclesToSpawn) do
                local doesVehicleExist = false
                local existingVehicle = nil

                for _, spawnedVehicleNetID in ipairs(spawnedVehicles) do
                    local spawnedVehicle = NetworkGetEntityFromNetworkId(spawnedVehicleNetID)
                    if DoesEntityExist(spawnedVehicle) then
                        local existingCoords = GetEntityCoords(spawnedVehicle)
                        local distance = #(existingCoords - v.coords)
                        if distance < Config.SpawnPointRangeCheck then
                            doesVehicleExist = true
                            existingVehicle = spawnedVehicle
                            DebugPrint("[^5INFO^7] Existing vehicle found at coords, skipping spawn.")
                            break
                        end
                    end
                end

                if not doesVehicleExist then
                    if Config.AllowReplacingVehicles or firstSpawn then
                        local vehicle = CreateVehicleServerSetter(v.modelHash, v.vehType, v.coords.x, v.coords.y, v.coords.z, v.heading)
                        local vehicleNetID = NetworkGetNetworkIdFromEntity(vehicle)
                        table.insert(spawnedVehicles, vehicleNetID)
                        count = count +1
                        DebugPrint("[^5INFO^7] New vehicle spawned with count: "..count)
                        
                    end
                end

                Citizen.Wait(50)
            end

            -- Remove non-existent network IDs from the spawnedVehicles table
            for i = #spawnedVehicles, 1, -1 do
                if not DoesEntityExist(NetworkGetEntityFromNetworkId(spawnedVehicles[i])) then
                    table.remove(spawnedVehicles, i)
                    DebugPrint("[^5INFO^7] Removed a vehicle from the spawnedVehicles list")
                end
            end

            firstSpawn = false
        else
            DebugPrint("[^5INFO^7] No players online or refreshing the vehicles, skipping vehicle spawn.")
        end
        Citizen.Wait(Config.IntervalToReplaceVehicles * 1000)
    end
end)

RegisterCommand(Config.Commands.RefreshVehicles, function(source, args, rawCommand)
    DeleteExistingVehicles()
end, false)

function DeleteExistingVehicles()
    local delCount = 0
    if not refreshing then
        refreshing = true
        for _, spawnedVehicleNetID in ipairs(spawnedVehicles) do
            local spawnedVehicle = NetworkGetEntityFromNetworkId(spawnedVehicleNetID)
            if DoesEntityExist(spawnedVehicle) then
                DeleteEntity(spawnedVehicle)
                delCount = delCount + 1
            end
        end
        spawnedVehicles = {}
        refreshing = false
    end
    if delCount ~= 0 then
        DebugPrint("[^2INFO^7] Done deleting "..delCount.." vehicles.")
    else
        DebugPrint("[^1ERROR^7] There were no vehicles to delete.")
    end
end