#> whimc:barrelbot/instructions/loop/while/execute
#   Begins a while loop (if the initial condition is met)

#Check condition
function whimc:barrelbot/instructions/if/check_condition with storage whimc:storage current_step

#> FAILURE
#If condition isn't met, iterate forward until the end of a code block is hit 
scoreboard players set $code_block_depth whimc.dummy 0
execute if score $success whimc.dummy matches 0 run function whimc:barrelbot/instructions/if/failure
execute if score $success whimc.dummy matches 0 run scoreboard players set $queued_instruction whimc.dummy 1

#> SUCCESS
#If condition is met, push to stack
execute if score $success whimc.dummy matches 1 run function whimc:barrelbot/instructions/loop/while/begin