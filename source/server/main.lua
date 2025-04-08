RegisterNetEvent('bandit_jobcenter:server:select', function(job, grade)
    local Player = GetPlayer(source);

    if Player then
        if DoesJobExist(source, job, grade) then
            return SetJob(source, job, grade)
        else
            return Debug('This job doesn\'t currently exist inside the database.')
        end
    else
        return KickPlayer('You were kicked from the server for cheating.')
    end
end)

function KickPlayer(...)
    DropPlayer(source, ...)
end

function Debug(...)
    if Config.Debug then
        print('[DEBUG]', ...)
    end
end