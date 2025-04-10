fx_version 'cerulean'
game 'gta5'
author 'Bandit'
lua54 'yes'

shared_scripts {
  '@ox_lib/init.lua',
  'configuration.lua',
}

server_scripts {
  'bridge/**/server.lua',
  'source/server/*.lua',
}

client_scripts {
  'bridge/**/client.lua',
  'source/client/*.lua',
}