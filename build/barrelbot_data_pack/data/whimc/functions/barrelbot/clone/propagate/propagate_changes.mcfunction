execute store result score $source_x whimc.dummy run data get entity @s Pos[0]
execute store result score $source_y whimc.dummy run data get entity @s Pos[1]
execute store result score $source_z whimc.dummy run data get entity @s Pos[2]
execute on passengers run data modify storage whimc:storage bounding_box set from entity @s data.bounding_box
execute store result score $max_x whimc.dummy run data get storage whimc:storage bounding_box.max_x
execute store result score $max_y whimc.dummy run data get storage whimc:storage bounding_box.max_y
execute store result score $max_z whimc.dummy run data get storage whimc:storage bounding_box.max_z
execute store result score $min_x whimc.dummy run data get storage whimc:storage bounding_box.min_x
execute store result score $min_y whimc.dummy run data get storage whimc:storage bounding_box.min_y
execute store result score $min_z whimc.dummy run data get storage whimc:storage bounding_box.min_z
scoreboard players operation $base_max_x whimc.dummy = $max_x whimc.dummy
scoreboard players operation $base_max_y whimc.dummy = $max_y whimc.dummy
scoreboard players operation $base_max_z whimc.dummy = $max_z whimc.dummy
scoreboard players operation $base_min_x whimc.dummy = $min_x whimc.dummy
scoreboard players operation $base_min_y whimc.dummy = $min_y whimc.dummy
scoreboard players operation $base_min_z whimc.dummy = $min_z whimc.dummy
scoreboard players operation $temp whimc.barrelbot.puzzle_type_id = @s whimc.barrelbot.puzzle_type_id
execute as @e[type=text_display, distance=0.1.., tag=whimc.barrelbot.puzzle_manager, predicate=whimc:barrelbot/match_puzzle_type_id] at @s run function whimc:barrelbot/clone/propagate/update_puzzle
function whimc:barrelbot/manager/get_dimensions
scoreboard players operation $min_source_x whimc.dummy = $real_min_x whimc.dummy
scoreboard players operation $min_source_y whimc.dummy = $real_min_y whimc.dummy
scoreboard players operation $min_source_z whimc.dummy = $real_min_z whimc.dummy
scoreboard players operation $max_source_x whimc.dummy = $real_max_x whimc.dummy
scoreboard players operation $max_source_y whimc.dummy = $real_max_y whimc.dummy
scoreboard players operation $max_source_z whimc.dummy = $real_max_z whimc.dummy
scoreboard players operation $vol_x whimc.dummy = $size_x whimc.dummy
scoreboard players operation $vol_y whimc.dummy = $size_y whimc.dummy
scoreboard players operation $vol_z whimc.dummy = $size_z whimc.dummy
data modify storage whimc:macro Pos2 set from storage whimc:macro Pos
execute positioned as @e[type=text_display, distance=0.1.., tag=whimc.barrelbot.puzzle_manager, predicate=whimc:barrelbot/match_puzzle_type_id] run function whimc:barrelbot/clone/propagate/clone_details
