scoreboard players operation $temp whimc.barrelbot.bot_id = @s whimc.barrelbot.bot_id
scoreboard players set $queued_instruction whimc.dummy 0
data modify storage whimc:storage DisplayArcs set value []
scoreboard players set $arc_count whimc.dummy 0
function whimc:barrelbot/bot/grab_marker_data
execute if score @s whimc.barrelbot.push_count matches 1.. run function whimc:barrelbot/display/push_forward_loop
execute at @s as @e[type=item_display, tag=whimc.execution_display_cursor, predicate=whimc:barrelbot/match_bot_id, scores={whimc.barrelbot.display_layer=0}] run function whimc:barrelbot/display/update_cursor
execute unless data storage whimc:storage marker_data.stack[] run return 0
function whimc:barrelbot/bot/grab_slot
function whimc:barrelbot/instructions/general/execute_instruction with storage whimc:storage current_step
execute store result score $step whimc.dummy run data get storage whimc:storage marker_data.stack[-1].step
execute store result storage whimc:storage marker_data.stack[-1].step int 1 run scoreboard players add $step whimc.dummy 1
function whimc:barrelbot/functions/check_step_out
scoreboard players operation $temp whimc.barrelbot.bot_id = @s whimc.barrelbot.bot_id
execute at @s as @e[type=item_display, tag=whimc.execution_display, predicate=whimc:barrelbot/match_bot_id] run function whimc:barrelbot/display/update
execute at @s if block ~ ~-1 ~ lime_concrete on passengers run data remove storage whimc:storage marker_data.stack[]
execute at @s if block ~ ~-1 ~ black_concrete run function whimc:barrelbot/functions/recursion_limit_reached
function whimc:barrelbot/bot/write_marker_data
execute if score $arc_count whimc.dummy matches 1.. run function whimc:barrelbot/functions/display_arcs
execute if score $queued_instruction whimc.dummy matches 1 at @s run function whimc:barrelbot/bot/step
