-- Resource Metadata
fx_version 'cerulean'
games { 'gta5' }

author 'Nights Software'
description 'Vehicle Spawns for FiveM'
version '1.0.0'
url 'https://store.ea-rp.com'
lua54 'yes'

client_scripts {
    'client/*.lua',
}

server_scripts {
    'server/*.lua',
}

shared_scripts {
    'config/*.lua',
}

escrow_ignore {
    'config/*.lua',
    'client/*.lua',
    'server/*.lua'
}