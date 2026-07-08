execute store result storage whimc:storage scratch.entry.x int 1 run scoreboard players get $paste_x whimc.dummy
execute store result storage whimc:storage scratch.entry.y int 1 run scoreboard players get $paste_y whimc.dummy
execute store result storage whimc:storage scratch.entry.z int 1 run scoreboard players get $paste_z whimc.dummy
data modify storage whimc:storage clone_paste_queue append from storage whimc:storage scratch.entry
