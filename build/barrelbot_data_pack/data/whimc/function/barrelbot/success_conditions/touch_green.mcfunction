scoreboard players set $success whimc.dummy 1
execute as @e[type=item_display, tag=whimc.barrelbot, tag=!whimc.dispenser_bot, predicate=whimc:barrelbot/match_id] at @s unless block ~ ~-1 ~ minecraft:lime_concrete run scoreboard players set $success whimc.dummy 0
