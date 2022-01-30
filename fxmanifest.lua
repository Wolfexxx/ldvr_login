fx_version 'bodacious'
game 'gta5'
client_script 'client.lua'
server_scripts {
    "@mysql-async/lib/MySQL.lua",
    'server.lua'
} 

shared_script 'config.lua'
author 'wolfex'
ui_page 'html/index.html'


files {
    'html/index.html',
    'html/style.css',
    'html/script.js',
}


