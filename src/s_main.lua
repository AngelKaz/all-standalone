StandaloneFunctions = {}

local ESX, vRP, QBCore = nil
local FrameworkSetup = false

local function checkState()
    if FrameworkSetup == false then
        return false
    else
        return true
    end
end

CreateThread(function()
    setupFramework("qbcore")
end)

function setupFramework(framework)
    if string.lower(framework) == "vrp" then
        vRP = exports['vrp']:getfunc()
    elseif string.lower(framework) == "esx" then
        ESX = exports['es_extended']:getSharedObject()
    elseif string.lower(framework) == "qbcore" then
        QBCore = exports['qb-core']:GetCoreObject()
    end

    FrameworkSetup = true
end

StandaloneFunctions.getUser = function(src)
    if checkState() == false then return print("You need to setup framework first") end

    local promise = promise.new()
    local data = {}

    if vRP ~= nil then
        local user_id = vRP.getUserId({src})

        vRP.getUserIdentity({user_id, function(identity)

            data.id = src
            data.user_id = user_id
            data.firstname = identity.firstname
            data.lastname = identity.name
            data.age = identity.age
            data.phone = identity.phone
            data.registration = identity.registration

            promise:resolve({data, {}})
        end})
    elseif ESX ~= nil then
        local xPlayer = ESX.GetPlayerFromId(src)
        data.id = src
        data.firstname = xPlayer.PlayerData.firstname
        data.lastname = xPlayer.PlayerData.lastName
        data.age = xPlayer.PlayerData.dateofbirth

        promise:resolve({data, {}})
    elseif QBCore ~= nil then
        local Player = QBCore.Functions.GetPlayer(src)

        data.id = src
        data.firstname = Player.PlayerData.charinfo.firstname
        data.lastname = Player.PlayerData.charinfo.lastname
        data.age = Player.PlayerData.charinfo.birthdate
        data.phone = Player.PlayerData.charinfo.phone
        data.registration = Player.PlayerData.citizenid

        promise:resolve({data, {}})
    end

    local result, err = Citizen.Await(promise)
    return result[1], result[2]
end
