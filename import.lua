local isServer = IsDuplicityVersion()

if isServer then
    exports("setFramework", function(frm)
        setupFramework(frm)
    end)

    exports("getStandalone", function()
        return StandaloneFunctions
    end)
else
    exports("getStandalone", function()
        return StandaloneFunctions
    end)
end