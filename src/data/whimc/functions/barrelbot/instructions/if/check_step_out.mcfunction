#> whimc:barrelbot/instructions/if/check_step_out
#   Checks if the if statement code block has ended

#Check to see if the next step is a code block end
scoreboard players set $iterate whimc.dummy 0
function whimc:barrelbot/bot/grab_slot
execute if data storage whimc:storage {current_step:{instruction:"end_code_block"}} run scoreboard players set $iterate whimc.dummy 1


#If at the end, complete current cycle
execute store result score $max_step whimc.dummy run data get storage whimc:storage marker_data.stack[-1].length
execute if score $step whimc.dummy > $max_step whimc.dummy run scoreboard players set $iterate whimc.dummy 1
execute if score $iterate whimc.dummy matches 1 run function whimc:barrelbot/instructions/loop/pop_stack