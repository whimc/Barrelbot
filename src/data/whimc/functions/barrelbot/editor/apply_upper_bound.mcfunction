#> whimc:barrelbot/editor/apply_upper_bound
#   Internally modifies the marker's upper bound data

execute store result entity @s data.bounding_box.max_x int 1 run scoreboard players get $max_x whimc.dummy
execute store result entity @s data.bounding_box.max_y int 1 run scoreboard players get $max_y whimc.dummy
execute store result entity @s data.bounding_box.max_z int 1 run scoreboard players get $max_z whimc.dummy