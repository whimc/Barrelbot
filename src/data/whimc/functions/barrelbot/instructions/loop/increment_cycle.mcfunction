#> whimc:barrelbot/instructions/loop/increment_cycle
#   Increments the cycle

scoreboard players set $exit_loop whimc.dummy 0


#If loop is a counter loop, increment the counter
execute if data storage whimc:storage marker_data.stack[-1].cycles run function whimc:barrelbot/instructions/loop/counter/check_condition

#If loop is a while loop, check exit condition
execute if data storage whimc:storage marker_data.stack[-1].condition run function whimc:barrelbot/instructions/loop/while/check_condition




#Pop loop from stack if it is done
execute if score $exit_loop whimc.dummy matches 1 run function whimc:barrelbot/instructions/loop/pop_stack

#Set step to first step if loop is continuing
execute if score $exit_loop whimc.dummy matches 0 run data modify storage whimc:storage marker_data.stack[-1].step set from storage whimc:storage marker_data.stack[-1].start_step