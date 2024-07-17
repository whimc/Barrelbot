#> whimc:barrelbot/editor/enable_edit_mode
#   Enables edit mode for the puzzle

tag @s add whimc.edit_mode

data modify storage whimc:storage data set from entity @s data.bounding_box
execute store result score $min_x whimc.dummy run data get storage whimc:storage data.min_x
execute store result score $min_y whimc.dummy run data get storage whimc:storage data.min_y
execute store result score $min_z whimc.dummy run data get storage whimc:storage data.min_z

execute store result score $max_x whimc.dummy run data get storage whimc:storage data.max_x
execute store result score $max_y whimc.dummy run data get storage whimc:storage data.max_y
execute store result score $max_z whimc.dummy run data get storage whimc:storage data.max_z

function whimc:barrelbot/editor/outline/spawn

#Spawn interactions
execute positioned ~-0.05 ~-0.05 ~-0.05 run function whimc:barrelbot/editor/drag/spawn_drag_nodes with storage whimc:storage data