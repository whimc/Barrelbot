#> whimc:barrelbot/clone/manager_setup
#   Sets up a cloned manager entity

#Perform all normal setup
function whimc:barrelbot/manager/setup

#Set up hitbox
scoreboard players operation $max_x whimc.dummy -= $source_x whimc.dummy
scoreboard players operation $max_y whimc.dummy -= $source_y whimc.dummy
scoreboard players operation $max_z whimc.dummy -= $source_z whimc.dummy
scoreboard players operation $min_x whimc.dummy -= $source_x whimc.dummy
scoreboard players operation $min_y whimc.dummy -= $source_y whimc.dummy
scoreboard players operation $min_z whimc.dummy -= $source_z whimc.dummy

scoreboard players operation $max_x whimc.dummy += $paste_x whimc.dummy
scoreboard players operation $max_y whimc.dummy += $paste_y whimc.dummy
scoreboard players operation $max_z whimc.dummy += $paste_z whimc.dummy
scoreboard players operation $min_x whimc.dummy += $paste_x whimc.dummy
scoreboard players operation $min_y whimc.dummy += $paste_y whimc.dummy
scoreboard players operation $min_z whimc.dummy += $paste_z whimc.dummy

execute store result storage whimc:storage bounding_box.max_x int 1 run scoreboard players get $max_x whimc.dummy
execute store result storage whimc:storage bounding_box.max_y int 1 run scoreboard players get $max_y whimc.dummy
execute store result storage whimc:storage bounding_box.max_z int 1 run scoreboard players get $max_z whimc.dummy
execute store result storage whimc:storage bounding_box.min_x int 1 run scoreboard players get $min_x whimc.dummy
execute store result storage whimc:storage bounding_box.min_y int 1 run scoreboard players get $min_y whimc.dummy
execute store result storage whimc:storage bounding_box.min_z int 1 run scoreboard players get $min_z whimc.dummy

execute on passengers run data modify entity @s data.bounding_box set from storage whimc:storage bounding_box