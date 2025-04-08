local SpawnedPeds = {}

CreateThread(function()
    for k, v in pairs(Config.Locations) do
        local point = lib.points.new({
            coords = v.interact.coords,
            distance = 2.5
        })

        function point:onEnter()
            CreateInteraction(k)
        end

        function point:onExit()
            DeleteInteraction(k)
        end

        if v.blip.enabled then
            CreateBlip(k)
        end
    end
end)

function CreateInteraction(index)
    local data = Config.Locations[index];
    local model = data.interact.ped;
    local location = data.interact.coords;
    local heading = data.interact.heading;

    lib.requestModel(model, 3000)
    ped = CreatePed(5, model, location.x, location.y, location.z, heading, false, true)
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)

    if GetResourceState('ox_target') == 'started' then
        local options = {
            {
                name = 'interact',
                icon = 'fas fa-user-secret',
                label = 'Interact',
                onSelect = function()
                    BrowseJobs(index)
                end
            }
        }

        exports.ox_target:addBoxZone({
            coords = location,
            size = data.size,
            rotation = data.interact.w,
            debug = Config.Debug,
            options = options
        })
    end

    SpawnedPeds[index] = ped
    return ped
end

function DeleteInteraction(index)
    local data = Config.Locations[index];
    local ped = SpawnedPeds[index];
    local model = GetEntityModel(ped);

    if GetResourceState('ox_target') == 'started' then
        exports.ox_target:removeLocalEntity(ped, 'interact', index)
    end

    SetModelAsNoLongerNeeded(model)
    DeletePed(ped)
    SetPedAsNoLongerNeeded(ped)

    SpawnedPeds[index] = nil
end

function CreateBlip(index)
    local data = Config.Locations[index];
    local blip = AddBlipForCoord(data.interact.coords);

    SetBlipSprite(blip, data.blip.sprite)
    SetBlipColour(blip, data.blip.colour)
    SetBlipScale(blip, data.blip.scale)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentString(data.blip.label)
    EndTextCommandSetBlipName(blip)

    return blip
end

function BrowseJobs(index)
    local data = Config.Locations[index];
    local Options = {};

    for _, data in ipairs(data.jobs) do
        table.insert(Options, {
            title = data.label,
            description = data.description,
            disabled = data.blacklisted,
            onSelect = function()                
                local success = lib.alertDialog({
                    header = 'Are you sure?',
                    content = 'Do you want to select this job?',
                    centered = true,
                    cancel = false
                })

                if success then
                    return TriggerServerEvent('bandit_jobcenter:server:select', data.job, data.grade)
                end
            end
        })

        lib.registerContext({
            id = 'job_center',
            title = 'Available Job Offers',
            options = Options
        })
    
        lib.showContext('job_center')
    end
end