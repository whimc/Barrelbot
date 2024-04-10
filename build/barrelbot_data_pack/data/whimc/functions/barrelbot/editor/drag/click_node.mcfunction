advancement revoke @s only whimc:interact/right_click_node
execute store success score $dragging whimc.dummy if entity @s[tag=whimc.dragging_node]
execute if score $dragging whimc.dummy matches 1 run tag @s remove whimc.dragging_node
execute if score $dragging whimc.dummy matches 0 run tag @s add whimc.dragging_node
scoreboard players set $temp whimc.barrelbot.node_id -1
tag @s add whimc.clicker
execute as @e[type=interaction, tag=whimc.editor_node, distance=..6] run function whimc:barrelbot/editor/drag/check_match
tag @s remove whimc.clicker
scoreboard players operation @s whimc.barrelbot.node_id = $temp whimc.barrelbot.node_id
