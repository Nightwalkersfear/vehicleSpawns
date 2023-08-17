--============ Server Functions ============--

function DebugPrint(msg)
    if Config.Debug then
        print("["..GetCurrentResourceName().."] "..msg)
    end
end

-- Function to check if a vehicle is occupied
function IsVehicleOccupied(vehicle)
    for i = -1, 6 do
        local ped = GetPedInVehicleSeat(vehicle, i)
        if ped ~= 0 then
            return true
        end
    end
    return false
end