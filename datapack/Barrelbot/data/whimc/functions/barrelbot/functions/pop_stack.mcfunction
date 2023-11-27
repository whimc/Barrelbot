#> whimc:barrelbot/functions/pop_stack
#   Removes the top-most function on the stack and increments the step of the next one

#data remove storage whimc:storage marker_data.stack[-1]
#execute unless data storage whimc:storage marker_data.stack[] run return 0
#
#execute store result score $step whimc.dummy run data get storage whimc:storage marker_data.stack[-1].step
#execute store result storage whimc:storage marker_data.stack[-1].step int 1 run scoreboard players add $step whimc.dummy 1

##Recursively step out of function if necessary
#execute store result score $max_step whimc.dummy run data get storage whimc:storage marker_data.stack[-1].length
#execute if score $step whimc.dummy > $max_step whimc.dummy run function whimc:barrelbot/functions/pop_stack

scoreboard players set $step_out whimc.dummy 1

data remove storage whimc:storage marker_data.stack[-1]
execute unless data storage whimc:storage marker_data.stack[] run return 0

#Determine how to iterate forward depending on whether currently in a loop
execute store success score $in_loop whimc.dummy if data storage whimc:storage marker_data.stack[-1].loop

##Push displays forward
scoreboard players add @s whimc.barrelbot.push_count 1

function whimc:barrelbot/functions/iterate
#execute if score $in_loop whimc.dummy matches 1 run function whimc:barrelbot/instructions/loop/iterate

