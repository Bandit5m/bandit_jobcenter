Config = {
    Debug = false,

    Locations = {
        points = {
            {
                blip = { enabled = true, label = 'Job Center', sprite = 525, colour = 1, scale = 1.0 },
    
                interact = {
                    coords = vec3(-545.3022, -203.6989, 37.2152),
                    heading = 210.1800,
                    ped = `a_m_y_business_02`,
                },
    
                jobs = {
                    { label = 'Taxi', description = 'Become a taxi driver.', job = 'taxi', grade = 0, blacklisted = false },
                    { label = 'Unemployed', description = 'Be an bum.', job = 'unemployed', grade = 0, blacklisted = false },
                }
            },
        }
    },

    Notify = function(message, type)
        lib.notify({
            title = 'Job Center',
            description = message,
            type = type or 'inform',
        })
    end,
}