 ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


--- Regisztrálás

RegisterServerEvent('login:sendData')
AddEventHandler('login:sendData', function (Username,Password)
    local xPlayer = ESX.GetPlayerFromId(source)
    local src = source
    local username = MySQL.Sync.fetchAll("SELECT username FROM login WHERE identifier = @identifier", {
        ['@identifier'] = xPlayer.getIdentifier()
    })
    local password = MySQL.Sync.fetchAll("SELECT password FROM login WHERE identifier = @identifier", {
        ['@identifier'] = xPlayer.getIdentifier()
    })
        -- Checkeli hogy van e már fiókja az adott játékosnak!
    if (#username > 0 and #password > 0) then
        TriggerClientEvent("login:youHaveAcc", src)
    else
        MySQL.Async.insert("INSERT INTO login (identifier,username, password) VALUES(@identifier, @username, @password)", {
            ['@identifier'] = xPlayer.getIdentifier(),
            ['@username'] = Username,
            ['@password'] = Password,
        })
        
    end
end)


-- Bejelentkezés

RegisterServerEvent('login:tryLogin')
AddEventHandler('login:tryLogin', function (Username,Password)
    local xPlayer = ESX.GetPlayerFromId(source)
    local src = source
    local username = MySQL.Sync.fetchAll("SELECT username FROM login WHERE identifier = @identifier AND username = @username", {
        ['@username'] = Username,
        ['@identifier'] = xPlayer.getIdentifier()
    })
    local password = MySQL.Sync.fetchAll("SELECT password FROM login WHERE identifier = @identifier AND password = @password", {
        ['@password'] = Password,
        ['@identifier'] = xPlayer.getIdentifier(),
    })
    if (#username > 0 and #password > 0) then
        TriggerClientEvent("login:successLogin", src)
    else
        TriggerClientEvent("login:noAccount", src)
    end
end)
