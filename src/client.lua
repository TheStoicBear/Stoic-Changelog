local isOpen = false

RegisterNUICallback('close', function()
    SetDisplay(false)
end)

RegisterNUICallback('open', function()
    SetDisplay(true)
end)

-- Initialize UI on resource start
AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        SetDisplay(true)
        isOpen = true
    end
end)

AddEventHandler('playerSpawned', function()
    if not isOpen then
        SetDisplay(true)
        isOpen = true
    end
end)

RegisterCommand('openchangelog', function()
    SetDisplay(true)
    isOpen = true
end, false)

function SetDisplay(bool)
    isOpen = bool
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        type = 'open', -- Change the type to 'close' to match the HTML script
        status = bool
    })
end
