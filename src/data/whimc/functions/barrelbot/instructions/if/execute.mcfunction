#> whimc:barrelbot/instructions/if/execute
#   Runs an if statement

#Check condition
function whimc:barrelbot/instructions/if/check_condition with storage whimc:storage current_step

#> FAILURE
#If condition isn't met, iterate forward until the end of a code block is hit 
scoreboard players set $code_block_depth whimc.dummy 0
execute if score $success whimc.dummy matches 0 run function whimc:barrelbot/instructions/if/failure
#execute if score $success whimc.dummy matches 0 run scoreboard players set $queued_instruction whimc.dummy 1

#> SUCCESS
#If condition check was successful, put code block on the call stack
execute if score $success whimc.dummy matches 1 run function whimc:barrelbot/instructions/if/success

execute at @s as @e[type=item_display,tag=whimc.execution_display_cursor,predicate=whimc:barrelbot/match_bot_id,scores={whimc.barrelbot.display_layer=0}] run function whimc:barrelbot/display/update_cursor