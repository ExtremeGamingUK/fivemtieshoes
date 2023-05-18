local isTieShoes = false
local afkcheck = false
inProgress = false

RegisterNetEvent('tieshoes:tieshoes')
AddEventHandler("tieshoes:tieshoes", function()
	afkcheck = false
	
	if isTieShoes then return end
	
	local playerPed = PlayerPedId()
	
	isTieShoes = true
	TieShoesLoop()
	ShoeNotify(Config.ShoeNotify[1])
	Citizen.Wait(Config.ShoeLaceSnapTimer)
	
	if not isTieShoes then return end
	
	if afkcheck then
		ShoeNotify(Config.ShoeNotify[2])
		isTieShoes = false
	else
		ShoeNotify(Config.ShoeNotify[3])
		AfkCheckLoop()
	end
end)

function AfkCheckLoop()
	Citizen.CreateThread(function()
		while not (afkcheck) do	
			Citizen.Wait(0)
			if IsControlPressed(0, 32) or IsControlPressed(0, 33) or IsControlPressed(0, 34) or IsControlPressed(0, 35) then					
				Citizen.Wait(Config.ShoeLaceSnapTimer)
				if isTieShoes then
					ShoeNotify(Config.ShoeNotify[2])
					isTieShoes = false
				end
				break
			end
		end
	end)
end

function TieShoesLoop()
	Citizen.CreateThread(function()
	local playerPed = PlayerPedId()
	local pressed = false
		while (isTieShoes) do	
			Citizen.Wait(0)
			if IsControlPressed(0, 32) or IsControlPressed(0, 33) or IsControlPressed(0, 34) or IsControlPressed(0, 35) then
				if not pressed and not inProgress then
					pressed = true
					afkcheck = true
					local ForwardVector = GetEntityForwardVector(PlayerPedId())
					SetPedToRagdollWithFall(PlayerPedId(), 1500, 2000, 0, ForwardVector, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
					ShoeNotify(Config.ShoeNotify[4])
				else
					Citizen.Wait(1500)
					pressed = false
				end
			end

		end
	end)
end

RegisterNetEvent('tieshoes:removetieshoes')
AddEventHandler('tieshoes:removetieshoes', function()
	local playerPed = PlayerPedId()
	
	if not isTieShoes then ShoeNotify(Config.ShoeNotify[6]) return end
	
	handleAnimation(Config.ShoeUnTieAnimDict, Config.ShoeUnTieAnimName, Config.ShoeUnTieAnimFlag)
	handleProgressBar(Config.ShoeNotify[10], Config.UnTieShoeTime)
	
	if Config.Framework["framework"] ~= 'esx' then
		Citizen.Wait(Config.UnTieShoeTime)
	end
	
	ClearPedTasks(playerPed)
	ShoeNotify(Config.ShoeNotify[5])
	isTieShoes = false		
	inProgress = false

end)

RegisterNetEvent('tieshoes:starttieshoes')
AddEventHandler("tieshoes:starttieshoes", function()
	local playerPed = PlayerPedId()

	if IsPedRagdoll(PlayerPedId()) then ShoeNotify(Config.ShoeNotify[8]) return end
	
	if IsPedDeadOrDying(playerPed, 1) then ShoeNotify(Config.ShoeNotify[8]) return end

	local closestPlayer, closestDistance = GetClosestPlayerTieShoes(Config.ShoeTieRange)
	
	if closestPlayer == -1 then ShoeNotify(Config.ShoeNotify[7]) return end
	if closestDistance == -1 or closestDistance >= Config.ShoeTieRange then ShoeNotify(Config.ShoeNotify[7]) return end
	
	handleAnimation(Config.ShoeTieAnimDict, Config.ShoeTieAnimName, Config.ShoeTieAnimFlag)
	handleProgressBar(Config.ShoeNotify[9], Config.TieShoeTime)
	
	if Config.Framework["framework"] ~= 'esx' then
		Citizen.Wait(Config.TieShoeTime)
	end
	
	ClearPedTasks(playerPed)	
	inProgress = false
	
	local closestPlayer2, closestDistance2 = GetClosestPlayerTieShoes(Config.ShoeTieRange)
	
	if closestPlayer2 == -1 then ShoeNotify(Config.ShoeNotify[7]) return end
	if closestDistance2 == -1 or closestDistance2 >= Config.ShoeTieRange then ShoeNotify(Config.ShoeNotify[7]) return end
	
	if closestPlayer ~= closestPlayer2 then ShoeNotify(Config.ShoeNotify[11]) return end
	
	local targetId = GetPlayerServerId(closestPlayer2) 
	TriggerServerEvent('tieshoes:applytieshoes', targetId)

end)

function GetClosestPlayerTieShoes(distance)
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)

    local closestPlayers = GetPlayersFromCoordsTieShoes(coords, distance)
    local closestDistance = -1
    local closestPlayer = -1
    for i = 1, #closestPlayers, 1 do
        if closestPlayers[i] ~= PlayerId() and closestPlayers[i] ~= -1 then
            local pos = GetEntityCoords(GetPlayerPed(closestPlayers[i]))
            local distance = #(pos - coords)

            if closestDistance == -1 or closestDistance > distance then
                closestPlayer = closestPlayers[i]
                closestDistance = distance
            end
        end
    end
    return closestPlayer, closestDistance
end

function GetPlayersFromCoordsTieShoes(coords, distance)
    local players = GetActivePlayers()
    local ped = PlayerPedId()

    local distance = distance or 5
    local closePlayers = {}
    for _, player in pairs(players) do
        local target = GetPlayerPed(player)
        local targetCoords = GetEntityCoords(target)
        local targetdistance = #(targetCoords - coords)
        if targetdistance <= distance then
            closePlayers[#closePlayers + 1] = player
        end
    end
    return closePlayers
end