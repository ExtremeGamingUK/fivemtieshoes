QBCore = nil
BJCore = nil

if Config.Framework["framework"] == 'qb-core' then	
	QBCore = exports['qb-core']:GetCoreObject()
elseif Config.Framework["framework"] == 'bj' then
	Citizen.CreateThread(function(...) while BJCore == nil do TriggerEvent("BJCore:GetObject", function(obj) BJCore = obj end); 
elseif not Config.Framework["framework"] == 'esx' then
	--imports in the fxmanifest
else	
	print('CUSTOM FRAMEWORK')
end

function ShoeNotify(msg)
	print(msg)
	if Config.Framework["framework"] == 'qb-core' then	
		QBCore.Functions.Notify(msg)
	elseif Config.Framework["framework"] == 'bj' then
		BJCore.Functions.Notify(msg)
	elseif not Config.Framework["framework"] == 'esx' then
		print(msg)
	else
		ESX.ShowNotification(msg)
	end	
end

function handleAnimation(dict, anim, flag)
	local ped = PlayerPedId()
	loadAnimDict(dict)
	TaskPlayAnim(ped, dict, anim, 2.0, 1.0, -1, flag, 0.0, 0, 0, 0)
end

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(10)
    end
end

function handleProgressBar(label, time)

	-- local success = false
	inProgress = true
	
	if Config.ProgressBar == 'esx' then
		ESX.Progressbar(label, time,{
			FreezePlayer = true, 
			animation ={}, 
			onFinish = function() -- success
				-- success = true
		end})
	elseif Config.ProgressBar == 'qb-core' then
		QBCore.Functions.Progressbar('tieshoes', label, time, false, false, {
			disableMovement = true,
			disableCarMovement = true,
			disableMouse = false,
			disableCombat = true
			}, {}, {}, {}, function() -- success
				-- success = true
			end, function()  -- cancel

		end)
	elseif Config.ProgressBar == 'bj' then
		BJCore.Functions.Progressbar('tieshoes', label, time, false, false, {
			disableMovement = true,
			disableCarMovement = true,
			disableMouse = false,
			disableCombat = true
			}, {}, {}, {}, function() -- success
				-- success = true
			end, function()  -- cancel

		end)
	else
		print('ADD YOUR OWN PROGRESS BAR HERE')
	end
	
	-- return success
end