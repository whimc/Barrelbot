tag @s add whimc.node_display
item replace entity @s container.0 with yellow_concrete
data modify entity @s transformation.scale set value [0.5f, 0.5f, 0.5f]
data modify entity @s transformation.translation set value [0.0f, 0.5f, 0.0f]
data modify entity @s Glowing set value 1b
scoreboard players operation @s whimc.barrelbot.puzzle_id = $temp whimc.barrelbot.puzzle_id
ride @s mount @e[limit=1, type=interaction, tag=whimc.this_node]
