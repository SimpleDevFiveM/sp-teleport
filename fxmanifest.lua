fx_version 'cerulean'
games {'gta5'}

author 'Simple Team'
lua54 'yes'

client_script {
    'client.lua'
}

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua'
}

dependencies {
    'ox_lib'
}
