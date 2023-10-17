getStandalone = {
    TriggerServerCallback = function(self, name, cb, ...)
        TriggerServerEvent("all-standalone:callback:TriggerServerCallback", name, ...)
        self[name] = cb
    end,

    Functions = {}
}

Standalone.Functions.tpUser = function(c, person)
    if not c then return false end

    if not person then
        person = PlayerPedId()
    end

    print("Not TP'ed")
end



---------------------------------------------------------
-------------------- Callbacks --------------------------
---------------------------------------------------------
-- Credits til Mohr for callbacks

RegisterNetEvent("all-standalone:callback:RecieveServerCallback")
AddEventHandler("all-standalone:callback:RecieveServerCallback", function(name, ...)
    Standalone[name](...)
end)