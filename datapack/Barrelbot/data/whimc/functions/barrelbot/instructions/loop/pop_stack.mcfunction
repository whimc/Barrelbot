#> whimc:barrelbot/instructions/loop/pop_stack

scoreboard players set $step_out whimc.dummy 1

#Paste over current step, then remove from stack
#execute store result score $loop_step whimc.dummy run data get storage whimc:storage marker_data.stack[-1].step
#execute store result storage whimc:storage marker_data.stack[-2].step int 1 run scoreboard players add $loop_step whimc.dummy 1

data modify storage whimc:storage marker_data.stack[-2].step set from storage whimc:storage marker_data.stack[-1].step
data remove storage whimc:storage marker_data.stack[-1]
#execute unless data storage whimc:storage marker_data.stack[] run return 0

#Determine how to iterate forward depending on whether currently in a loop
execute store success score $in_loop whimc.dummy if data storage whimc:storage marker_data.stack[-1].loop

execute if score $in_loop whimc.dummy matches 0 run function whimc:barrelbot/functions/iterate
execute if score $in_loop whimc.dummy matches 1 run function whimc:barrelbot/instructions/loop/iterate