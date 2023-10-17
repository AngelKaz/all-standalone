# ALL-STANDALONE
Easiest way to make scripts for vRP, ESX & QBCore.

## # Import The Script
Import the user from the script
```lua
exports['all-standalone']:setFramework("vRP") -- vRP, ESX, QBCore
AllStandalone = export['all-standalone']:getStandalone()
```

## # If vRP Is Used
Put this in the bottom of the vrp->base.lua file:
```lua
exports("getfunc", function()
    return vRP
end)
```