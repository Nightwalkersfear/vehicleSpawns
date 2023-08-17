--================ Client Functions ================--

function message(lineOne, lineTwo, lineThree, duration)
    BeginTextCommandDisplayHelp("THREESTRINGS")
    AddTextComponentSubstringPlayerName(lineOne)
    AddTextComponentSubstringPlayerName(lineTwo or "")
    AddTextComponentSubstringPlayerName(lineThree or "")
    EndTextCommandDisplayHelp(0, false, true, duration or 5000)
end

function notify(notificationText, notificationDuration, notificationPosition, notificationType)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(notificationText)
    DrawNotification(true, true)
end

function firstToUpper(str)
    return (str:gsub("^%l", string.upper))
end

function allToUpper(str)
    return (string.upper(str))
end

