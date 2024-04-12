fx_version 'bodacious'

game 'gta5'

author 'Alga11'

lua54 'yes'



client_scripts {
    'client.lua',
}

server_script 'server.lua'


shared_scripts {
    'config.lua',
    '@es_extended/imports.lua',
    '@ox_lib/init.lua',
    'Shared/*.lua'
}