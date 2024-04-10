#> whimc:barrelbot/functions/interact/check_match
#   Checks to see if this interaction was clicked by the player

scoreboard players set #match_found whimc.dummy 0
execute on target if entity @s[tag=whimc.clicker] run scoreboard players set #match_found whimc.dummy 1

execute if score #match_found whimc.dummy matches 1 run data remove entity @s interaction
execute if score #match_found whimc.dummy matches 1 at @s positioned ~ ~0.25 ~ as @e[type=item_display,tag=whimc.function_display,distance=..0.001] at @s run function whimc:barrelbot/functions/interact/swap_item