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
scoreboard players add $size_x whimc.dummy 1
scoreboard players add $size_y whimc.dummy 1
scoreboard players add $size_z whimc.dummy 1
function whimc:barrelbot/editor/outline/position_lowest_corner with storage whimc:macro Pos
