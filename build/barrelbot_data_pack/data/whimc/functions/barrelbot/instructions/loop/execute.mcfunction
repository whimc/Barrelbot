execute if data storage whimc:storage current_step.cycles run function whimc:barrelbot/instructions/loop/counter/execute
execute if data storage whimc:storage current_step.condition run function whimc:barrelbot/instructions/loop/while/execute
execute at @s as @e[type=item_display, tag=whimc.execution_display_cursor, predicate=whimc:barrelbot/match_bot_id, scores={whimc.barrelbot.display_layer=0}] run function whimc:barrelbot/display/update_cursor
