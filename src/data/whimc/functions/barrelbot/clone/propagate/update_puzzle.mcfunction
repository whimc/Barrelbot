#> whimc:barrelbot/clone/propagate/update_puzzle
#   Deletes the old stuff

scoreboard players operation $max_x whimc.dummy = $base_max_x whimc.dummy
scoreboard players operation $max_y whimc.dummy = $base_max_y whimc.dummy
scoreboard players operation $max_z whimc.dummy = $base_max_z whimc.dummy
scoreboard players operation $min_x whimc.dummy = $base_min_x whimc.dummy
scoreboard players operation $min_y whimc.dummy = $base_min_y whimc.dummy
scoreboard players operation $min_z whimc.dummy = $base_min_z whimc.dummy

#Update bounding box
execute at @s summon marker run function whimc:barrelbot/clone/propagate/get_position
function whimc:barrelbot/clone/get_new_hitbox

#Get rid of old entities
function whimc:barrelbot/manager/get_dimensions
execute at @s run function whimc:barrelbot/clone/propagate/delete_old_entities with storage whimc:macro Pos

