#> whimc:barrelbot/editor/set_min_marker

data modify storage whimc:storage Pos set from entity @s Pos

execute store result score $min_x whimc.dummy run data get storage whimc:storage Pos[0]
execute store result score $min_y whimc.dummy run data get storage whimc:storage Pos[1]
execute store result score $min_z whimc.dummy run data get storage whimc:storage Pos[2]

kill @s