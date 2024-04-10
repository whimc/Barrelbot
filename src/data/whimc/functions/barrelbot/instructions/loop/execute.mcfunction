#> whimc:barrelbot/instructions/loop/execute
#   Steps into a loop

#Determine set up based on whether the loop is a while loop or counter loop
execute if data storage whimc:storage current_step.cycles run function whimc:barrelbot/instructions/loop/counter/execute
execute if data storage whimc:storage current_step.condition run function whimc:barrelbot/instructions/loop/while/execute

#Update cursor (test this later)
execute at @s as @e[type=item_display,tag=whimc.execution_display_cursor,predicate=whimc:barrelbot/match_bot_id,scores={whimc.barrelbot.display_layer=0}] run function whimc:barrelbot/display/update_cursor