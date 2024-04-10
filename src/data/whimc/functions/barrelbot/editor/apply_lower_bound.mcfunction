#> whimc:barrelbot/editor/apply_lower_bound
#   Internally modifies the marker's lower bound data

execute store result entity @s data.bounding_box.min_x int 1 run scoreboard players get $min_x whimc.dummy
execute store result entity @s data.bounding_box.min_y int 1 run scoreboard players get $min_y whimc.dummy
execute store result entity @s data.bounding_box.min_z int 1 run scoreboard players get $min_z whimc.dummy