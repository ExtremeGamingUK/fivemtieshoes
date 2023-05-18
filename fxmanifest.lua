fx_version 'cerulean'
game 'gta5'
lua54 'yes'

shared_scripts {
	'config.lua'
}

client_scripts {
	'@es_extended/imports.lua', -- Uncomment if using esx
    'client/client.lua',
    'client/functions.lua'
} 
 
server_scripts {
	'@es_extended/imports.lua', -- Uncomment if using esx
    'server/server.lua'
} 

escrow_ignore {
  'client/functions.lua',  -- Only ignore one file
  'config.lua'
}