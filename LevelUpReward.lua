--
-- Created by IntelliJ IDEA.
-- User: Silvia
-- Date: 28/02/2021
-- Time: 23:16
-- To change this template use File | Settings | File Templates.
-- Originally created by Honey for Azerothcore
-- requires ElunaLua module


--Players will receive rewards when their characters reach the levels in brackets. 
------------------------------------------------------------------------------------------------
-- ADMIN GUIDE:  -  compile the core with ElunaLua module
--               -  adjust config in this file
--               -  add this script to ../lua_scripts/
------------------------------------------------------------------------------------------------

local Config_Gold = {}
local Config_ItemId = {}
local Config_ItemAmount = {}

Config_Gold[10] = 10000     -- gold granted when reaching level [10] in copper. 10000 =  1 gold
Config_Gold[20] = 40000
Config_Gold[30] = 100000
Config_Gold[40] = 250000
Config_Gold[50] = 500000
Config_Gold[60] = 1000000
Config_Gold[70] = 2000000
Config_Gold[80] = 4000000


Config_ItemId[29] = 5740         -- item granted when reaching level [10] / 5740 is a cosmetic red rocket
Config_ItemAmount[29] = 5        -- amount of items to be granted when reaching level [10]. Missing amounts are automatically set to 1 if an ItemId is given

local Config_mailText = "!\n \n You've done pretty well while advan- cing on ChromieCraft. Here is a tiny reward to make up for your heroic deeds. Go forth!\n \n Kind regards...\n Chromie"

------------------------------------------
-- NO ADJUSTMENTS REQUIRED BELOW THIS LINE
------------------------------------------

local PLAYER_EVENT_ON_LEVEL_CHANGE = 13

local function GrantReward(event, player, oldLevel)
	if oldLevel ~= nil then
		if Config_ItemId[oldLevel + 1] ~= nil then
			local playerName = player:GetName()
			local playerGUID = tostring(player:GetGUID())
			local itemAmount
			if Config_ItemAmount[oldLevel + 1] ~= nil then
				itemAmount = Config_ItemAmount[oldLevel + 1]
			else
				itemAmount = 1
			end	
			SendMail("Chromies reward for You!", "Hello "..playerName..Config_mailText, playerGUID, 0, 61, 0, Config_Gold[oldLevel + 1],0,Config_ItemId[oldLevel + 1], Config_ItemAmount[oldLevel + 1])
			print("LevelUpReward has granted "..Config_Gold[oldLevel + 1].." and "..Config_ItemAmount[oldLevel + 1].." of item"..Config_ItemId[oldLevel + 1].."to character "..playerName.." with guid "..playerGUID..".")
			playerName = nil
			playerGUID = nil
		elseif Config_Gold[oldLevel + 1] ~= nil then
			local playerName = player:GetName()
			local playerGUID = tostring(player:GetGUID())
			SendMail("Chromies reward for You!", "Hello "..playerName..Config_mailText, playerGUID, 0, 61, 0, Config_Gold[oldLevel + 1])
			print("LevelUpReward has granted "..Config_Gold[oldLevel + 1].." copper to character "..playerName.." with guid "..playerGUID..".")
			playerName = nil
			playerGUID = nil
		end
	end
	return false
end

RegisterPlayerEvent(PLAYER_EVENT_ON_LEVEL_CHANGE, GrantReward)