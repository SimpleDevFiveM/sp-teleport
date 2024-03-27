local options = {}

CreateThread(function()
    for _, v in ipairs(Config.Teleport) do
        table.insert(options, {
            title = v.label,
            onSelect = function()
                SetEntityCoords(PlayerPedId(), v.coords)
            end
        })
    end
    lib.registerContext({
        id = 'menu',
        title = 'Teleport Menu',
        options = options
    })
end)

CreateThread(function()
    while true do
        local sleep = 600
        for _, v in pairs(Config.NPC) do
            local playerCoords = GetEntityCoords(PlayerPedId())
            local dist = #(playerCoords - v.position)

            if #(playerCoords - v.position) < 1.5 then
                lib.showTextUI('[E] - Teleport Menu')
            end
            Wait(5)

            if dist < 1.5 then
                sleep = 5
                if IsControlJustReleased(0, 38) then
                    lib.showContext('menu')
                end
            elseif dist > 2 then
                lib.hideTextUI()
            end
        end
        Wait(sleep)
    end
end)

CreateThread(function()
	for _, v in pairs(Config.NPC) do
        for _, models in ipairs(v.model) do
            RequestModel(GetHashKey(models))
            while not HasModelLoaded(GetHashKey(models)) do
                Wait(0)
            end
            ped = CreatePed(4, models, v.position, false, true)
	        FreezeEntityPosition(ped, true) 
	        SetEntityInvincible(ped, true)
	        SetBlockingOfNonTemporaryEvents(ped, true)
        end
    end
end)