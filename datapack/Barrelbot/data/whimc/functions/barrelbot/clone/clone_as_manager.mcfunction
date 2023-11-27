#> whimc:barrelbot/clone/clone_as_manager
#   Clones all the stuff
#   Executed as puzzle manager, at player

#Get data from marker
#data modify storage whimc:storage clone.marker set from entity @s

#Get coordinates
execute store result score $source_x whimc.dummy run data get entity @s Pos[0]
execute store result score $source_y whimc.dummy run data get entity @s Pos[1]
execute store result score $source_z whimc.dummy run data get entity @s Pos[2]

#Clone blocks
function whimc:barrelbot/clone/clone_blocks

#Summon new puzzle marker
execute rotated as @s run function whimc:barrelbot/dev/spawn_manager

#Clone entities
function whimc:barrelbot/clone/clone_entities


#Have any other puzzle markers in the bounding box clone as well
execute store result storage whimc:macro scan.x int 1 run scoreboard players get $min_source_x whimc.dummy
execute store result storage whimc:macro scan.y int 1 run scoreboard players get $min_source_y whimc.dummy
execute store result storage whimc:macro scan.z int 1 run scoreboard players get $min_source_z whimc.dummy

execute store result storage whimc:macro scan.dx int 1 run scoreboard players get $vol_x whimc.dummy
execute store result storage whimc:macro scan.dy int 1 run scoreboard players get $vol_y whimc.dummy
execute store result storage whimc:macro scan.dz int 1 run scoreboard players get $vol_z whimc.dummy

#FIX THIS LATER
tag @s add whimc.this
function whimc:barrelbot/clone/scan_for_markers with storage whimc:macro scan
tag @s remove whimc.this