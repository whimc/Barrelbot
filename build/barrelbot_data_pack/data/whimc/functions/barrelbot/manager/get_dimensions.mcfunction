execute on passengers run data modify storage whimc:storage data set from entity @s data.bounding_box
execute store result score $min_x whimc.dummy run data get storage whimc:storage data.min_x
execute store result score $min_y whimc.dummy run data get storage whimc:storage data.min_y
execute store result score $min_z whimc.dummy run data get storage whimc:storage data.min_z
execute store result score $max_x whimc.dummy run data get storage whimc:storage data.max_x
execute store result score $max_y whimc.dummy run data get storage whimc:storage data.max_y
execute store result score $max_z whimc.dummy run data get storage whimc:storage data.max_z
scoreboard players operation $real_min_x whimc.dummy = $min_x whimc.dummy
scoreboard players operation $real_min_x whimc.dummy < $max_x whimc.dummy
scoreboard players operation $real_min_y whimc.dummy = $min_y whimc.dummy
scoreboard players operation $real_min_y whimc.dummy < $max_y whimc.dummy
scoreboard players operation $real_min_z whimc.dummy = $min_z whimc.dummy
scoreboard players operation $real_min_z whimc.dummy < $max_z whimc.dummy
scoreboard players operation $real_max_x whimc.dummy = $min_x whimc.dummy
scoreboard players operation $real_max_x whimc.dummy > $max_x whimc.dummy
scoreboard players operation $real_max_y whimc.dummy = $min_y whimc.dummy
scoreboard players operation $real_max_y whimc.dummy > $max_y whimc.dummy
scoreboard players operation $real_max_z whimc.dummy = $min_z whimc.dummy
scoreboard players operation $real_max_z whimc.dummy > $max_z whimc.dummy
execute store result storage whimc:macro Pos.min_x int 1 run scoreboard players get $real_min_x whimc.dummy
execute store result storage whimc:macro Pos.min_y int 1 run scoreboard players get $real_min_y whimc.dummy
execute store result storage whimc:macro Pos.min_z int 1 run scoreboard players get $real_min_z whimc.dummy
scoreboard players operation $size_x whimc.dummy = $real_max_x whimc.dummy
scoreboard players operation $size_y whimc.dummy = $real_max_y whimc.dummy
scoreboard players operation $size_z whimc.dummy = $real_max_z whimc.dummy
scoreboard players operation $size_x whimc.dummy -= $real_min_x whimc.dummy
scoreboard players operation $size_y whimc.dummy -= $real_min_y whimc.dummy
scoreboard players operation $size_z whimc.dummy -= $real_min_z whimc.dummy
execute store result storage whimc:macro Pos.vol_x int 1 run scoreboard players get $size_x whimc.dummy
execute store result storage whimc:macro Pos.vol_y int 1 run scoreboard players get $size_y whimc.dummy
execute store result storage whimc:macro Pos.vol_z int 1 run scoreboard players get $size_z whimc.dummy
scoreboard players operation $dest_min_x whimc.dummy = $real_min_x whimc.dummy
scoreboard players operation $dest_min_y whimc.dummy = $real_min_y whimc.dummy
scoreboard players operation $dest_min_z whimc.dummy = $real_min_z whimc.dummy
scoreboard players operation $dest_min_x whimc.dummy -= $source_x whimc.dummy
scoreboard players operation $dest_min_y whimc.dummy -= $source_y whimc.dummy
scoreboard players operation $dest_min_z whimc.dummy -= $source_z whimc.dummy
execute store result storage whimc:macro Pos.dest_min_x int 1 run scoreboard players operation $dest_min_x whimc.dummy += $paste_x whimc.dummy
execute store result storage whimc:macro Pos.dest_min_y int 1 run scoreboard players operation $dest_min_y whimc.dummy += $paste_y whimc.dummy
execute store result storage whimc:macro Pos.dest_min_z int 1 run scoreboard players operation $dest_min_z whimc.dummy += $paste_z whimc.dummy
