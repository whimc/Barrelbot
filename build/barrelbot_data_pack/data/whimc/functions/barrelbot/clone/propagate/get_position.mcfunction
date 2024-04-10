data modify storage whimc:storage Pos set from entity @s Pos
execute store result score $paste_x whimc.dummy run data get storage whimc:storage Pos[0]
execute store result score $paste_y whimc.dummy run data get storage whimc:storage Pos[1]
execute store result score $paste_z whimc.dummy run data get storage whimc:storage Pos[2]
kill @s
