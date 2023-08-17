-- Note: Use Visual Studio Code to read and edit this file, makes life easier -> https://code.visualstudio.com/download

Config = {

    Debug = true,

    --====================== General Settings ======================--

    AllowReplacingVehicles = true,          -- Replace vehicles when they're off their spawn point or just at the start of the script?
    IntervalToReplaceVehicles = 60,         -- Seconds. Default: every minute.
    SpawnPointRangeCheck = 2.5,             -- 2.5 GTA meters. Checks every spawn point. If empty, within 2.5m range it will spawn the vehicle there again.
    DisableNativeCopsAndCarsSpawning = true,-- Optional, prevents cops and cop cars spawning at Mission Row for example.

    Commands = {
        RefreshVehicles = "rv",
    },

    --====================== Vehicle Spawn Settings ======================--

    -- Parameters explained: 
    -- 1. modelHash: The model of vehicle to spawn e.g. "blista".
    -- 2. vehType: Can be one of these: automobile, bike, boat, heli, plane, submarine, trailer, and (potentially), train. This should be the same type as the type field in vehicles.meta.
    VehiclesToSpawn = {
        -- Mission Row
        {modelHash = "police", vehType = "automobile", coords = vector3(427.7334, -1026.7738, 28.9805), heading = 1.2852},
        {modelHash = "police2", vehType = "automobile", coords = vector3(431.3383, -1027.0730, 28.9174), heading = 1.2852},
        {modelHash = "police3", vehType = "automobile", coords = vector3(434.6604, -1027.0732, 28.8578), heading = 1.2852},

        -- Paleto bay
        {modelHash = "police", vehType = "automobile", coords = vector3(-482.6453, 6024.7119, 31.3405), heading = 225.5428},
        {modelHash = "police2", vehType = "automobile", coords = vector3(-479.3979, 6028.1226, 31.3405), heading = 225.5428},
        {modelHash = "police3", vehType = "automobile", coords = vector3(-475.7478, 6031.5063, 31.3405), heading = 225.5428},
        {modelHash = "policeb", vehType = "bike", coords = vector3(-472.6721, 6035.6211, 31.3406), heading = 225.5428},

        -- Hospital Downtown
        {modelHash = "ambulance", vehType = "automobile", coords = vector3(326.5033, -542.2238, 28.7440), heading = 177.9715},
        {modelHash = "ambulance", vehType = "automobile", coords = vector3(329.4675, -541.5283, 28.7440), heading = 177.9715},
        {modelHash = "ambulance", vehType = "automobile", coords = vector3(332.2330, -541.5080, 28.7440), heading = 177.9715},
        {modelHash = "ambulance", vehType = "automobile", coords = vector3(335.0405, -541.5497, 28.7441), heading = 177.9715},

        -- Add more here by following the formatted text below...
        -- {modelHash = "ambulance", vehType = "automobile", coords = vector3(326.5033, -542.2238, 28.7440), heading = 177.9715},
        -- {modelHash = "ambulance", vehType = "automobile", coords = vector3(329.4675, -541.5283, 28.7440), heading = 177.9715},
        -- {modelHash = "ambulance", vehType = "automobile", coords = vector3(332.2330, -541.5080, 28.7440), heading = 177.9715},
        -- {modelHash = "ambulance", vehType = "automobile", coords = vector3(335.0405, -541.5497, 28.7441), heading = 177.9715},
    },
}

