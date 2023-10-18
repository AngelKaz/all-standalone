Standalone = {
    Functions = {}
}

---------------------------------------------------------
-------------------- Callbacks --------------------------
---------------------------------------------------------
-- Credits til Mohr for callbacks

Standalone.TriggerServerCallback = function(name, cb, ...)
    TriggerServerEvent("all-standalone:callback:TriggerServerCallback", name, ...)
    Standalone[name] = cb
end

RegisterNetEvent("all-standalone:callback:RecieveServerCallback")
AddEventHandler("all-standalone:callback:RecieveServerCallback", function(name, ...)
    Standalone[name](...)
end)