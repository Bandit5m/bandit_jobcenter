if GetResourceState('qb-core') ~= 'started' then return end

QBCore = exports['qb-core']:GetCoreObject()

function GetPlayer(source)
    return QBCore.Functions.GetPlayer(source)
end

function RegisterCallback(name, cb)
    QBCore.Functions.CreateCallback(name, cb)
end

--
-- Job Functions
--
function DoesJobExist(source, job, grade)
    return true
end

function SetJob(source, job, grade)
    local Player = GetPlayer(source)

    return Player.Functions.SetJob(job, grade)
end