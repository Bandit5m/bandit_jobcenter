if GetResourceState('qb-core') ~= 'started' then return end

QBCore = exports['qb-core']:GetCoreObject()

function ServerCallback(name, cb, ...)
    QBCore.Functions.TriggerCallback(name, cb, ...)
end

RegisterNetEvent('bandit_bridge:client:notification', function(message, type)
    return Config.Notify(message, type)
end)