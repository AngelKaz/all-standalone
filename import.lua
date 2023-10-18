local isServer = IsDuplicityVersion()

if isServer then
    exports("setFramework", function(frm)
        setupFramework(frm)
    end)

    exports("getStandalone", function()
        return Standalone.Functions
    end)

    exports("getCallbacks", function()
        return Standalone.RegisterServerCallback
    end)
else
    exports("getStandalone", function()
        return Standalone.Functions
    end)

    exports("getCallbacks", function()
        return Standalone.TriggerServerCallback
    end)
end