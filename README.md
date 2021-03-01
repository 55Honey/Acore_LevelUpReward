## LevelUpReward
LUA script for Azerothcore with ElunaLUA to reward players for reaching certain levels.


## Requirements:

Compile your [Azerothcore](https://github.com/azerothcore/azerothcore-wotlk) with [Eluna Lua](https://www.azerothcore.org/catalogue-details.html?id=131435473).
The ElunaLua module itself usually doesn't require much setup/config. Just specify the subfolder where to put your lua_scripts in its .conf file.

If the directory was not changed, add the .lua script to your `../bin/release/lua_scripts/` directory.
Adjust the top part of the .lua file with the config flags.


## Player Usage:
- Play, reach a level set in the config and be rewarded by ingame mail


## Example config:
`Config_mailText` is added to the "Hello [playerName]" head part of the mails sent.

`Config_Gold[10] = 10000` grants 1 Gold to the players when they reach level 10.

`Config_ItemId[29] = 5740` sends one rocket to the players when they reach level 29.
A missing Item_Amount always results in *one* item.

`Config_ItemId[29] = 5740` 
`Config_ItemAmount[29] = 5` sends five rockets to the players when they reach level 29.