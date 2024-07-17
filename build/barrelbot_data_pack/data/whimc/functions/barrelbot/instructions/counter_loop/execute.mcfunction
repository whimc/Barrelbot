data modify storage whimc:storage stack_entry set value {loop: 1b, cycle: 0, code_block: 1b}
data modify storage whimc:storage stack_entry.function set from storage whimc:storage marker_data.stack[-1].function
data modify storage whimc:storage stack_entry.cycles set from storage whimc:storage current_step.Count
execute if data storage whimc:storage {stack_entry: {cycles: 1b}} run data modify storage whimc:storage stack_entry.cycles set value -1b
data modify storage whimc:storage stack_entry.length set from storage whimc:storage marker_data.stack[-1].length
data modify storage whimc:storage stack_entry.Pos set from storage whimc:storage marker_data.stack[-1].Pos
execute store result score $prev_step whimc.dummy run data get storage whimc:storage marker_data.stack[-1].step
execute store result storage whimc:storage stack_entry.step int 1 run scoreboard players add $prev_step whimc.dummy 1
execute store result storage whimc:storage stack_entry.start_step int 1 run scoreboard players get $prev_step whimc.dummy
data modify storage whimc:storage marker_data.stack append from storage whimc:storage stack_entry
function whimc:barrelbot/bot/grab_slot
function whimc:barrelbot/instructions/general/execute_instruction with storage whimc:storage current_step
execute at @s as @e[type=item_display, tag=whimc.execution_display_cursor, predicate=whimc:barrelbot/match_bot_id, scores={whimc.barrelbot.display_layer=0}] run function whimc:barrelbot/display/update_cursor
