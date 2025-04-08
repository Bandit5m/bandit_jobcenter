if GetResourceState('es_extended') ~= 'started' then return end

ESX = exports.es_extended:getSharedObject()

function GetPlayer(source)
    return ESX.GetPlayerFromId(source)
end

function RegisterCallback(name, cb)
    ESX.RegisterServerCallback(name, cb)
end

--
-- Job Functions
--
function DoesJobExist(source, job, grade)
    return ESX.DoesJobExist(job, grade)
end

function SetJob(source, name, grade)
    local Player = GetPlayer(source)

    return Player.setJob(name, grade)
end