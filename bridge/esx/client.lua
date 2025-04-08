if GetResourceState('es_extended') ~= 'started' then return end

ESX = exports.es_extended:getSharedObject()

function ServerCallback(name, cb, ...)
    ESX.TriggerServerCallback(name, cb, ...)
end

RegisterNetEvent('bandit_bridge:client:notification', function(message, type)
    return Config.Notify(message, type)
end)