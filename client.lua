local coords = GetEntityCoords(PlayerPedId())
local var1, var2 = GetStreetNameAtCoord(coords.x, coords.y, coords.z, Citizen.ResultAsInteger(), Citizen.ResultAsInteger())
hash1 = GetStreetNameFromHashKey(var1)
hash2 = GetStreetNameFromHashKey(var2)
local street = hash1 .. " " .. hash2

Citizen.CreateThread(function()
    Wait(250)
    for k,v in pairs(Config.rapine1) do
		TriggerEvent('gridsystem:registerMarker', {
			name = 'rapine'..k,
			pos = vector3(v.x,v.y,v.z),
			size = vector3(0.8, 0.8, 0.8),
			scale = vector3(0.8, 0.8, 0.8),
			type = 9,
			control = 'E',
			rotate = 0.0,
			rotate2 = 0.0,
			shouldBob = false,
			shouldRotate = true,
			color = { r = 255, g = 255, b = 255 },
			trasparent = 255,
			customt = 'marker',
			msg = 'RAPINA',
			msg2 = 'https://cdn.discordapp.com/attachments/1202391432426700860/1224365419326869564/crystalpng.png?ex=661d3a27&is=660ac527&hm=5821fbc4d4e39a17d78bcb959952a0822d4076feea811894bc6c2b4e48100ba7&',
			action = function()
				local lockpick = exports.ox_inventory:Search('count', 'lockpick') 
				if lockpick < 1 then
					lib.notify({
						title = 'Non Hai Il LockPick',
						type = 'error',
					})
					return
				end
				if lockpick > 1 then
					scassinacassa()
				end
			end
		})
	end
end)

-------------------------------------------- funzione scassina cassa- -------------------------------


local lastAlertTime = 0
local alertCooldown = 60000 -- 60 secondi
function scassinacassa()
    local currentTime = GetGameTimer()

    if currentTime - lastAlertTime >= alertCooldown then
		local success33 = lib.skillCheck({'easy', 'easy', {areaSize = 60, speedMultiplier = 2}, 'easy'}, {'w', 'w', 'w', 'w'})
		if not success33 then
			TriggerServerEvent('togli:lockpick')
			TriggerEvent("ox_lib:notify", {title = 'Crystal RP', duration = 5000, type = typeNot, description = 'Hai rotto il lockpick'})
		end
		if success33 then
			if Config.dispatch == 'nr' then
				TriggerServerEvent('nR_Dispatch:server:addAlert', {
					code = '10-21',
					text = 'Robbery',
					street = street,
					coords = coords
				})
			elseif Config.dispatch == 'opdispatch' then
				ExampleAlert()
			end	
			FreezePedCameraRotation(PlayerPedId())
			local success2 = lib.progressCircle({
			duration = 30000,
			position = 'bottom',
			useWhileDead = false,
			canCancel = true,
			disable = {
				car = true,
				move = true,
			},
			anim = { dict = 'anim@heists@ornate_bank@grab_cash', clip = 'grab' },
			prop = { model = 'p_ld_heist_bag_s', bone = 40269, pos = vec3(0.0454, 0.2131, -0.1887), rot = vec3(66.4762, 7.2424, -71.9051) },
		})

			if success2 then
				TriggerServerEvent('rapina:finita')
			end
			lastAlertTime = currentTime
		end
	else
		TriggerEvent("ox_lib:notify", {title = 'Crystal RP', duration = 5000, type = typeNot, description = 'La cassa è già stata rapinata!'})
	end
end

------ blips  

Citizen.CreateThread(function()
	if Config.bliprapine then
		Citizen.Wait(2000)
		for k,v in ipairs(Config.rapine1)do
			local blip = AddBlipForCoord(v.x, v.y, v.z)
			SetBlipSprite (blip, v.blip)
			SetBlipDisplay(blip, 4)
			SetBlipScale  (blip, v.blipScale)
			SetBlipColour (blip, v.blipColor)
			SetBlipAsShortRange(blip, true)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString(v.blipText)
			EndTextCommandSetBlipName(blip)
		end
	end
end)


------------------------------------ 


--------------------------------------------------------------------------------------- cassaforte ------------------------------------------------------------------------

Citizen.CreateThread(function()
    Wait(250)
    for k,v in pairs(Config.cassaforte) do
		TriggerEvent('gridsystem:registerMarker', {
			name = 'cassaforte'..k,
			pos = vector3(v.x,v.y,v.z),
			size = vector3(0.8, 0.8, 0.8),
			scale = vector3(0.8, 0.8, 0.8),
			type = 9,
			control = 'E',
			rotate = 0.0,
			rotate2 = 0.0,
			shouldBob = false,
			shouldRotate = true,
			color = { r = 255, g = 255, b = 255 },
			trasparent = 255,
			customt = 'marker',
			msg = 'RAPINA',
			msg2 = 'https://cdn.discordapp.com/attachments/1202391432426700860/1224365419326869564/crystalpng.png?ex=661d3a27&is=660ac527&hm=5821fbc4d4e39a17d78bcb959952a0822d4076feea811894bc6c2b4e48100ba7&',
			action = function()
				local lockpick = exports.ox_inventory:Search('count', 'lockpick') 
				if lockpick < 1 then
					lib.notify({
						title = 'Non Hai Il LockPick',
						type = 'error',
					})
					return
				end
				if lockpick > 1 then
					cassaforte()
				else
					TriggerServerEvent('togli:lockpick')
					TriggerEvent("ox_lib:notify", {title = 'Crystal RP', duration = 5000, type = typeNot, description = 'Hai rotto il lockpick'})
				end
			end
		})
	end
end)

local lastAlertTime1 = 0
local alertCooldown1 = 60000 -- 60 secondi
function cassaforte()
    local currentTime1 = GetGameTimer()

    if currentTime1 - lastAlertTime1 >= alertCooldown1 then
				local success1 = lib.skillCheck({'easy', 'easy', {areaSize = 60, speedMultiplier = 2}, 'easy'}, {'w', 'w', 'w', 'w'})
				if not success1 then
					TriggerServerEvent('togli:lockpick')
					TriggerEvent("ox_lib:notify", {title = 'Crystal RP', duration = 5000, type = typeNot, description = 'Hai rotto il lockpick'})
				end
				if success1 then
					if Config.dispatch == 'nr' then
						TriggerServerEvent('nR_Dispatch:server:addAlert', {
							code = '10-21',
							text = 'Robbery',
							street = street,
							coords = coords
						})
					elseif Config.dispatch == 'opdispatch' then
						ExampleAlert()
					end	
					ExecuteCommand('crouch')
					FreezePedCameraRotation(PlayerPedId())
					local success2 = lib.progressCircle({
					duration = 30000,
					position = 'bottom',
					useWhileDead = false,
					canCancel = true,
					disable = {
						car = true,
						move = true,
					},
					anim = { dict = 'anim@heists@ornate_bank@grab_cash', clip = 'grab' },
					prop = { model = 'p_ld_heist_bag_s', bone = 40269, pos = vec3(0.0454, 0.2131, -0.1887), rot = vec3(66.4762, 7.2424, -71.9051) },
				})
				if success2 then
					ExecuteCommand('crouch')
					TriggerServerEvent('rapina:finita1')
				end
					lastAlertTime1 = currentTime1
				end
    else
        TriggerEvent("ox_lib:notify", {title = 'Crystal RP', duration = 5000, type = typeNot, description = 'La cassa è già stata rapinata!'})
    end
end

------------------------------------ op dispatch- --------------------------------

function ExampleAlert()
	local job = "police" -- Jobs that will recive the alert
	local text = "Rapina" -- Main text alert
	local coords = GetEntityCoords(PlayerPedId()) -- Alert coords
	local id = GetPlayerServerId(PlayerId()) -- Player that triggered the alert
	local title = "Rapina" -- Main title alert
	local panic = true -- Allow/Disable panic effect
	TriggerServerEvent('Opto_dispatch:Server:SendAlert', job, title, text, coords, panic, id)
end