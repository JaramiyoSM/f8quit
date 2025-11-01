local disconnectNotices = {}

-- Dibujar texto 3D
local function DrawText3D(coords, lines)
    local x, y, z = table.unpack(coords)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local px, py, pz = table.unpack(GetGameplayCamCoords())
    local dist = #(vector3(px, py, pz) - vector3(x, y, z))

    if dist <= 15.0 and onScreen then -- 🔹 Solo dentro de 15 metros
        local spacing = 0.040
        for i, line in ipairs(lines) do
            local offset = (i - 1) * spacing
            SetTextScale(0.45, 0.45)
            SetTextFont(4)
            SetTextProportional(1)
            SetTextCentre(1)
            SetTextColour(255, 255, 255, 255)

            BeginTextCommandDisplayText("STRING")
            AddTextComponentSubstringPlayerName(line)
            EndTextCommandDisplayText(_x, _y + offset)
        end
    end
end

-- Evento cuando un jugador se desconecta
RegisterNetEvent("disconnect:showNotice", function(coords, lines)
    local expireTime = GetGameTimer() + (5 * 60 * 1000) -- 5 minutos
    table.insert(disconnectNotices, {coords = coords, lines = lines, expire = expireTime})
end)

-- Loop de dibujo
CreateThread(function()
    while true do
        Wait(0)
        local now = GetGameTimer()
        for i = #disconnectNotices, 1, -1 do
            local notice = disconnectNotices[i]
            if now < notice.expire then
                DrawText3D(vector3(notice.coords.x, notice.coords.y, notice.coords.z + 1.0), notice.lines)
            else
                table.remove(disconnectNotices, i)
            end
        end
    end
end)
