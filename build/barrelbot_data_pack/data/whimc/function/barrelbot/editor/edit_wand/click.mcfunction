scoreboard players add $global whimc.barrelbot.edit_instance_id 1
scoreboard players operation $temp whimc.barrelbot.edit_instance_id = $global whimc.barrelbot.edit_instance_id
scoreboard players set #raycast_length whimc.dummy 300
scoreboard players set #success whimc.dummy 0
scoreboard players set $out whimc.barrelbot.puzzle_id -1
execute anchored eyes positioned ^ ^ ^1.5 run function whimc:barrelbot/editor/edit_wand/raycast
execute if score #success whimc.dummy matches 1 run function whimc:barrelbot/editor/edit_wand/enter_edit_mode
execute unless score $out whimc.barrelbot.puzzle_id matches -1 run scoreboard players operation @s whimc.barrelbot.puzzle_id = $out whimc.barrelbot.puzzle_id
