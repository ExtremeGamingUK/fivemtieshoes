Config = {}


Config.Framework = {
	["framework"] = 'esx', 															-- 'qb-core' or 'esx' or 'bj', 'other'	
																					-- If framework and inventory are 'other', you can add your own code to work with what you like
}

Config.ProgressBar = 'esx'															-- 'qb-core' or 'esx' or 'bj' or 'other'

Config.TieShoeCommand = 'tieshoes'													-- Command to tie shoes
Config.UnTieShoeCommand = 'untieshoes'												-- Command to untie shoes

Config.TieShoeTime = (2.5 * 1000) -- 2.5 seconds									-- How long it takes to tie someones shoes -- 1 = 1 second (1 * 1000), 30 = 30 seconds (30 * 1000)
Config.UnTieShoeTime = (5 * 1000) -- 5 seconds										-- How long it takes to untie your shoes -- 1 = 1 second (1 * 1000), 30 = 30 seconds (30 * 1000)
Config.ShoeLaceSnapTimer = (30 * 1000) -- 30 seconds								-- Time until shoe laces snap and when the afk timer kicks in -- 1 = 1 second (1 * 1000), 30 = 30 seconds (30 * 1000)
Config.ShoeTieRange = 1.2 															-- Range at which players can tie other peoples shoes

Config.ShoeTieAnimDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@"					-- Anim dictionary for shoe tieing
Config.ShoeTieAnimName = "machinic_loop_mechandplayer"								-- Anim name for shoe tieing
Config.ShoeTieAnimFlag = 1															-- Anim flag for shoe tieing
Config.ShoeUnTieAnimDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@"				-- Anim dictionary for shoe untieing
Config.ShoeUnTieAnimName = "machinic_loop_mechandplayer"							-- Anim name for shoe untieing
Config.ShoeUnTieAnimFlag = 1														-- Anim flag for shoe untieing

Config.ShoeNotify = {
	[1] = 'Someone just tied your shoe laces!',										-- When someone successfully ties your shoes
	[2] = 'Shoe laces just snapped!',												-- When the timer has reached 0 from your shoes being tied, this message shows
	[3] = 'Move to snap your laces!',												-- Once the afk check has kicked in, this message shows
	[4] = 'Your shoe laces are tied!',												-- When trying to move and your laces are tied you get this message
	[5] = 'Shoes untied!',															-- When you have successfully untied your shoes
	[6] = 'Shoes laces are not tied!',												-- When trying to untie your shoes when they are not tied
	[7] = 'No one nearby!',															-- When no one is nearby
	[8] = 'You cant do that whilst on the ground...', 								-- When player is ragdolled and tries to tie someones shoes
	[9] = 'Tieing Shoes...', 														-- When tieing someones shoes
	[10] = 'Untieing Shoes...', 													-- When untieing your shoes
	[11] = 'The person has ran off...', 													-- When untieing your shoes
}