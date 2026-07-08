scoreboard players set #match_found whimc.dummy 0
execute on target if entity @s[tag=whimc.clicker] run scoreboard players set #match_found whimc.dummy 1
execute if score #match_found whimc.dummy matches 1 run function whimc:barrelbot/editor/drag/node_clicked
