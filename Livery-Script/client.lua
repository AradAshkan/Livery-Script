RegisterCommand('livery', function(source, args)
    if not args[1] then
        TriggerEvent('chat:addMessage', {color = { 255, 0, 0}, multiline = true, args = {"SYSTEM", "^0Please specify a livery number."}})
        return
    end

    local livery = tonumber(args[1])
    if not livery then
        TriggerEvent('chat:addMessage', {color = { 255, 0, 0}, multiline = true, args = {"SYSTEM", "^0You can only enter numbers for livery."}})
        return
    end

    local ped = GetPlayerPed(-1)

    if IsPedSittingInAnyVehicle(ped) then
        local vehicle = GetVehiclePedIsIn(ped, false)
        
        if GetVehicleLiveryCount(vehicle) > 0 then
            SetVehicleLivery(vehicle, livery)
            TriggerEvent('chat:addMessage', {color = { 0, 255, 0}, multiline = true, args = {"SYSTEM", "^0Livery set to " .. livery}})
        else
            TriggerEvent('chat:addMessage', {color = { 255, 0, 0}, multiline = true, args = {"SYSTEM", "^0This vehicle does not support liveries."}})
        end
    else

        local vehicle = ESX.Game.GetVehicleInDirection(4)
        if vehicle ~= 0 then
            NetworkRequestControlOfEntity(vehicle)
            while not NetworkHasControlOfEntity(vehicle) do
                Citizen.Wait(100)
            end
            
            if GetVehicleLiveryCount(vehicle) > 0 then
                SetVehicleLivery(vehicle, livery)
                TriggerEvent('chat:addMessage', {color = { 0, 255, 0}, multiline = true, args = {"SYSTEM", "^0Livery set to " .. livery}})
            else
                TriggerEvent('chat:addMessage', {color = { 255, 0, 0}, multiline = true, args = {"SYSTEM", "^0This vehicle does not support liveries."}})
            end
        else
 
            TriggerEvent('chat:addMessage', {color = { 255, 0, 0}, multiline = true, args = {"SYSTEM", "^0No vehicle nearby!"}})
        end
    end
end, false)
