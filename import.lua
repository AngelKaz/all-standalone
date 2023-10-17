local isServer = IsDuplicityVersion()

if isServer then
    exports("setFramework", function(frm)
        setupFramework(frm)
    end)

    exports("getStandalone", function()
        return Standalone.Functions
    end)
else
    exports("getStandalone", function()
        return Standalone.Functions
    end)
end