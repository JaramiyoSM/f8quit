local QBCore = exports['qb-core']:GetCoreObject()

-- Mapear motivo
local function TranslateReason(reason)
    reason = string.lower(reason or "desconocido")
    if reason:find("exiting") then
        return "Exiting"
    elseif reason:find("disconnect") then
        return "Disconnect"
    elseif reason:find("crash") then
        return "Crash"
    else
        return "Desconectado"
    end
end

AddEventHandler("playerDropped", function(reason)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player then
        local name = ("%s %s"):format(Player.PlayerData.charinfo.firstname, Player.PlayerData.charinfo.lastname)
        local id = src
        local ped = GetPlayerPed(src)
        local coords = GetEntityCoords(ped)

        local motivo = TranslateReason(reason)

        -- Primera línea (colores mezclados con GTA codes)
        local firstLine = ("~w~Jugador ~b~[%s] ~y~%s ~b~%s ~w~HA DEJADO EL SERVIDOR"):format(id, name, "")

        -- Segunda línea
        local secondLine = ("~o~RAZÓN: ~r~%s"):format(motivo)

        TriggerClientEvent("disconnect:showNotice", -1, coords, {firstLine, secondLine})
    end
end)
