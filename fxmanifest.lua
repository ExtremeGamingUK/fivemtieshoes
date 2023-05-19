fx_version 'cerulean'
game 'gta5'
lua54 'yes'

shared_scripts {
	'config.lua'
}

client_scripts {
	'@es_extended/imports.lua', -- Uncomment if using esx
    'client.lua',
    'functions.lua'
} 
 
server_scripts {
	'@es_extended/imports.lua', -- Uncomment if using esx
    'server.lua'
} 

escrow_ignore {
  'functions.lua',  -- Only ignore one file
  'config.lua'
}
