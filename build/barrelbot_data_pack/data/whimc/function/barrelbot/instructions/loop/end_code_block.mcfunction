execute store result score $cycle whimc.dummy run data get storage whimc:storage marker_data.stack[-1].cycle
execute store result storage whimc:storage marker_data.stack[-1].cycle int 1 run scoreboard players add $cycle whimc.dummy 1
execute store result score $max_cycle whimc.dummy run data get storage whimc:storage marker_data.stack[-1].cycles
execute if score $cycle whimc.dummy = $max_cycle whimc.dummy run function whimc:barrelbot/instructions/loop/pop_stack
