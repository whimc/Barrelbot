tag @s add whimc.editor_node
data merge entity @s {response: 1b}
execute store result score @s whimc.barrelbot.node_id run scoreboard players add $global whimc.barrelbot.node_id 1
scoreboard players operation @s whimc.barrelbot.puzzle_id = $temp whimc.barrelbot.puzzle_id
tag @s add whimc.this_node
execute summon item_display run function whimc:barrelbot/editor/drag/display_setup
tag @s remove whimc.this_node
