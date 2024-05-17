#> whimc:barrelbot/instructions/loop/counter/check_condition
#   Checks if a counter loop needs to be exited

#Increase cycle count
execute store result score $cycle whimc.dummy run data get storage whimc:storage marker_data.stack[-1].cycle
execute store result storage whimc:storage marker_data.stack[-1].cycle int 1 run scoreboard players add $cycle whimc.dummy 1


#If cycle is complete, terminate loop 

execute store result score $max_cycle whimc.dummy run data get storage whimc:storage marker_data.stack[-1].cycles
execute if score $cycle whimc.dummy = $max_cycle whimc.dummy run scoreboard players set $exit_loop whimc.dummy 1