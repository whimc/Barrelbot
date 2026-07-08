data modify storage whimc:storage Pos set from entity @s Pos
execute store result score $max_x whimc.dummy run data get storage whimc:storage Pos[0]
execute store result score $max_y whimc.dummy run data get storage whimc:storage Pos[1]
execute store result score $max_z whimc.dummy run data get storage whimc:storage Pos[2]
kill @s
