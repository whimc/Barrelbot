scoreboard players operation $temp_max_x whimc.dummy = $max_x whimc.dummy
scoreboard players operation $temp_max_y whimc.dummy = $max_y whimc.dummy
scoreboard players operation $temp_max_z whimc.dummy = $max_z whimc.dummy
scoreboard players operation $temp_min_x whimc.dummy = $min_x whimc.dummy
scoreboard players operation $temp_min_y whimc.dummy = $min_y whimc.dummy
scoreboard players operation $temp_min_z whimc.dummy = $min_z whimc.dummy
scoreboard players operation $temp_max_x whimc.dummy -= $source_x whimc.dummy
scoreboard players operation $temp_max_y whimc.dummy -= $source_y whimc.dummy
scoreboard players operation $temp_max_z whimc.dummy -= $source_z whimc.dummy
scoreboard players operation $temp_min_x whimc.dummy -= $source_x whimc.dummy
scoreboard players operation $temp_min_y whimc.dummy -= $source_y whimc.dummy
scoreboard players operation $temp_min_z whimc.dummy -= $source_z whimc.dummy
scoreboard players operation $temp_max_x whimc.dummy += $paste_x whimc.dummy
scoreboard players operation $temp_max_y whimc.dummy += $paste_y whimc.dummy
scoreboard players operation $temp_max_z whimc.dummy += $paste_z whimc.dummy
scoreboard players operation $temp_min_x whimc.dummy += $paste_x whimc.dummy
scoreboard players operation $temp_min_y whimc.dummy += $paste_y whimc.dummy
scoreboard players operation $temp_min_z whimc.dummy += $paste_z whimc.dummy
execute store result storage whimc:storage bounding_box.max_x int 1 run scoreboard players get $temp_max_x whimc.dummy
execute store result storage whimc:storage bounding_box.max_y int 1 run scoreboard players get $temp_max_y whimc.dummy
execute store result storage whimc:storage bounding_box.max_z int 1 run scoreboard players get $temp_max_z whimc.dummy
execute store result storage whimc:storage bounding_box.min_x int 1 run scoreboard players get $temp_min_x whimc.dummy
execute store result storage whimc:storage bounding_box.min_y int 1 run scoreboard players get $temp_min_y whimc.dummy
execute store result storage whimc:storage bounding_box.min_z int 1 run scoreboard players get $temp_min_z whimc.dummy
execute on passengers run data modify entity @s data.bounding_box set from storage whimc:storage bounding_box
