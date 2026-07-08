advancement revoke @s only whimc:barrelbot/data_collection/click_feature
scoreboard players set $raycast whimc.dummy 30
scoreboard players set $out whimc.barrelbot.in_puzzle_id -1
execute anchored eyes positioned ^ ^ ^ run function whimc:barrelbot/data_collection/click_feature/raycast
execute unless score $out whimc.barrelbot.in_puzzle_id matches -1 run scoreboard players operation @s whimc.barrelbot.in_puzzle_id = $out whimc.barrelbot.in_puzzle_id
