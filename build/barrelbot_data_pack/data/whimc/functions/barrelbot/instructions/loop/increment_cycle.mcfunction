scoreboard players set $exit_loop whimc.dummy 0
execute if data storage whimc:storage marker_data.stack[-1].cycles run function whimc:barrelbot/instructions/loop/counter/check_condition
execute if data storage whimc:storage marker_data.stack[-1].condition run function whimc:barrelbot/instructions/loop/while/check_condition
execute if score $exit_loop whimc.dummy matches 1 run function whimc:barrelbot/instructions/loop/pop_stack
execute if score $exit_loop whimc.dummy matches 0 run data modify storage whimc:storage marker_data.stack[-1].step set from storage whimc:storage marker_data.stack[-1].start_step
