scoreboard players operation $bottom_x whimc.dummy = $min_source_x whimc.dummy
scoreboard players operation $bottom_x whimc.dummy -= $source_x whimc.dummy
scoreboard players operation $bottom_y whimc.dummy = $min_source_y whimc.dummy
scoreboard players operation $bottom_y whimc.dummy -= $source_y whimc.dummy
scoreboard players operation $bottom_z whimc.dummy = $min_source_z whimc.dummy
scoreboard players operation $bottom_z whimc.dummy -= $source_z whimc.dummy
scoreboard players operation $top_x whimc.dummy = $max_source_x whimc.dummy
scoreboard players operation $top_x whimc.dummy -= $source_x whimc.dummy
scoreboard players operation $top_y whimc.dummy = $max_source_y whimc.dummy
scoreboard players operation $top_y whimc.dummy -= $source_y whimc.dummy
scoreboard players operation $top_z whimc.dummy = $max_source_z whimc.dummy
scoreboard players operation $top_z whimc.dummy -= $source_z whimc.dummy
scoreboard players operation $destination_x whimc.dummy = $paste_x whimc.dummy
scoreboard players operation $destination_y whimc.dummy = $paste_y whimc.dummy
scoreboard players operation $destination_z whimc.dummy = $paste_z whimc.dummy
scoreboard players operation $destination_x whimc.dummy += $bottom_x whimc.dummy
scoreboard players operation $destination_y whimc.dummy += $bottom_y whimc.dummy
scoreboard players operation $destination_z whimc.dummy += $bottom_z whimc.dummy
execute store result storage whimc:macro clone.bottom_x int 1 run scoreboard players get $min_source_x whimc.dummy
execute store result storage whimc:macro clone.bottom_y int 1 run scoreboard players get $min_source_y whimc.dummy
execute store result storage whimc:macro clone.bottom_z int 1 run scoreboard players get $min_source_z whimc.dummy
execute store result storage whimc:macro clone.top_x int 1 run scoreboard players get $max_source_x whimc.dummy
execute store result storage whimc:macro clone.top_y int 1 run scoreboard players get $max_source_y whimc.dummy
execute store result storage whimc:macro clone.top_z int 1 run scoreboard players get $max_source_z whimc.dummy
execute store result storage whimc:macro clone.destination_x int 1 run scoreboard players get $destination_x whimc.dummy
execute store result storage whimc:macro clone.destination_y int 1 run scoreboard players get $destination_y whimc.dummy
execute store result storage whimc:macro clone.destination_z int 1 run scoreboard players get $destination_z whimc.dummy
function whimc:barrelbot/clone/paste_blocks with storage whimc:macro clone
