QBCore = nil
BJCore = nil

if Config.Framework["framework"] == 'qb-core' then	
	QBCore = exports['qb-core']:GetCoreObject()
elseif Config.Framework["framework"] == 'bj' then
	TriggerEvent('BJCore:GetObject', function(obj) BJCore = obj end)
elseif not Config.Framework["framework"] == 'esx' then
	--imports in the fxmanifest
else
	print('CUSTOM FRAMEWORK')
end


RegisterCommand(Config.TieShoeCommand, function(source, args, rawCommand)
    TriggerClientEvent('tieshoes:starttieshoes', source)
end, false)

RegisterCommand(Config.UnTieShoeCommand, function(source, args, rawCommand)
    TriggerClientEvent('tieshoes:removetieshoes', source)
end, false)

RegisterServerEvent('tieshoes:applytieshoes')
AddEventHandler('tieshoes:applytieshoes', function(target)
	TriggerClientEvent('tieshoes:tieshoes', target)
end)

RegisterServerEvent('tieshoes:removetieshoes')
AddEventHandler('tieshoes:removetieshoes', function(target)
	TriggerClientEvent('tieshoes:removetieshoes', target)
end)

-- RegisterCommand('tieshoesp', function(source, args, rawCommand)
    -- if args[1] then
        -- local playerId = tonumber(args[1])
		
        -- if playerId then
            -- if GetPlayerName(playerId) then
                -- TriggerClientEvent('tieshoes:tieshoes', playerId)
            -- else
                -- TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Player not online.' } })
            -- end
        -- else
            -- TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Invalid player id.' } })
        -- end
    -- else
    	-- TriggerClientEvent('tieshoes:tieshoes', source)
    -- end
-- end, false)