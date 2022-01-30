ESX = nil
Username = nil
Password = nil
Opened = false
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

Open = function ()
    if (Opened == false) then
        SendNUIMessage({
            type = 'open'
        })
        Opened = true
        SetNuiFocus(true,true)
    else
        SendNUIMessage({
            type = 'close'
        })
        SetNuiFocus(false,false)
        Opened = false
    end
end            



Elso = true
AddEventHandler('playerSpawned', function()
   if Elso then
        Open()
        Elso = false
   end
end)


RegisterCommand("login", function ()
    Open()
end)


RegisterNUICallback('register', function(data, cb)
        Username = data.name
        Password = data.password
        print("Felhasznalonev " ..Username.. "| Password " ..Password.. " |")
        TriggerServerEvent('login:sendData',Username,Password)
end)


RegisterNUICallback('login', function (data,cb)
    Username = data.name
    Password = data.password
    TriggerServerEvent('login:tryLogin', Username,Password)
end)

RegisterNetEvent('login:youHaveAcc')
AddEventHandler('login:youHaveAcc', function ()
    print("Már van felhasználói fiókod")
    ESX.ShowNotification("Már van felhasználói fiókod")
end)


RegisterNetEvent('login:successLogin')
AddEventHandler('login:successLogin', function ()
    ESX.ShowNotification("Sikeres bejelentkezés")
    Open()
end)

RegisterNetEvent("login:noAccount")
AddEventHandler("login:noAccount", function ()
    print("Nincs ilyen felhasználói fiók / név")
end)