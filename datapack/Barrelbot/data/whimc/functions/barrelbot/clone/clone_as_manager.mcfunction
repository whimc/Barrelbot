#> whimc:barrelbot/clone/clone_as_manager
#   Clones all the stuff
#   Executed as puzzle manager, at player

scoreboard players operation $temp whimc.barrelbot.puzzle_type_id = @s whimc.barrelbot.puzzle_type_id

#Get data from marker
#data modify storage whimc:storage clone.marker set from entity @s
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


#Get coordinates
execute store result score $source_x whimc.dummy run data get entity @s Pos[0]
execute store result score $source_y whimc.dummy run data get entity @s Pos[1]
execute store result score $source_z whimc.dummy run data get entity @s Pos[2]

#Clone blocks
function whimc:barrelbot/clone/clone_blocks

#Summon new puzzle marker
execute on passengers run data modify storage whimc:storage bounding_box set from entity @s data.bounding_box
execute store result score $max_x whimc.dummy run data get storage whimc:storage bounding_box.max_x
execute store result score $max_y whimc.dummy run data get storage whimc:storage bounding_box.max_y
execute store result score $max_z whimc.dummy run data get storage whimc:storage bounding_box.max_z
execute store result score $min_x whimc.dummy run data get storage whimc:storage bounding_box.min_x
execute store result score $min_y whimc.dummy run data get storage whimc:storage bounding_box.min_y
execute store result score $min_z whimc.dummy run data get storage whimc:storage bounding_box.min_z
execute rotated as @s run function whimc:barrelbot/clone/spawn_manager

#Clone entities
function whimc:barrelbot/manager/get_dimensions
function whimc:barrelbot/clone/clone_entities with storage whimc:macro Pos


#Have any other puzzle markers in the bounding box clone as well
#execute store result storage whimc:macro scan.x int 1 run scoreboard players get $min_source_x whimc.dummy
#execute store result storage whimc:macro scan.y int 1 run scoreboard players get $min_source_y whimc.dummy
#execute store result storage whimc:macro scan.z int 1 run scoreboard players get $min_source_z whimc.dummy
#
#execute store result storage whimc:macro scan.dx int 1 run scoreboard players get $vol_x whimc.dummy
#execute store result storage whimc:macro scan.dy int 1 run scoreboard players get $vol_y whimc.dummy
#execute store result storage whimc:macro scan.dz int 1 run scoreboard players get $vol_z whimc.dummy