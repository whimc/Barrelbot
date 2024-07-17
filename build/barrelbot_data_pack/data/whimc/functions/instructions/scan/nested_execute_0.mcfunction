scoreboard players set $ice_found whimc.dummy 1
setblock ~ ~ ~ air
data modify storage whimc:storage stack_entry set value {}
execute store result storage whimc:storage stack_entry.x int 1 run data get storage whimc:storage Pos[0]
execute store result storage whimc:storage stack_entry.y int 1 run data get storage whimc:storage Pos[1]
execute store result storage whimc:storage stack_entry.z int 1 run data get storage whimc:storage Pos[2]
