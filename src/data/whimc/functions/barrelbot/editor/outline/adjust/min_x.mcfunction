#> whimc:barrelbot/editor/outline/adjust/min_x

execute store result entity @s transformation.scale[0] float -40 run scoreboard players get $size_z whimc.dummy
execute store result entity @s transformation.scale[1] float 40 run scoreboard players get $size_y whimc.dummy