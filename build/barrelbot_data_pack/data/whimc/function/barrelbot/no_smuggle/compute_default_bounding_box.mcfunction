# Recompute the default puzzle bounds around the Run button (same as manager/setup_marker).
data modify storage whimc:storage Pos set from entity @s Pos
execute store result score $marker_x whimc.dummy run data get storage whimc:storage Pos[0]
execute store result score $marker_y whimc.dummy run data get storage whimc:storage Pos[1]
execute store result score $marker_z whimc.dummy run data get storage whimc:storage Pos[2]
execute store result storage whimc:storage bounding_box.min_x int 1 run scoreboard players remove $marker_x whimc.dummy 2
execute store result storage whimc:storage bounding_box.min_y int 1 run scoreboard players remove $marker_y whimc.dummy 1
execute store result storage whimc:storage bounding_box.min_z int 1 run scoreboard players remove $marker_z whimc.dummy 2
execute store result storage whimc:storage bounding_box.max_x int 1 run scoreboard players add $marker_x whimc.dummy 4
execute store result storage whimc:storage bounding_box.max_y int 1 run scoreboard players add $marker_y whimc.dummy 3
execute store result storage whimc:storage bounding_box.max_z int 1 run scoreboard players add $marker_z whimc.dummy 4
execute on passengers run data modify entity @s data.bounding_box set from storage whimc:storage bounding_box
