execute store result score $stack_depth whimc.dummy if data storage whimc:storage marker_data.stack[]
execute if score $stack_depth whimc.dummy > #MAX_RECURSION_DEPTH whimc.const run function whimc:barrelbot/functions/recursion_limit_reached
execute if score $stack_depth whimc.dummy > #MAX_RECURSION_DEPTH whimc.const run return 0
data modify storage whimc:storage stack_entry set value {step: 0}
data modify storage whimc:storage stack_entry.function set from storage whimc:storage current_step.function_id
function whimc:barrelbot/functions/retrieve_function with storage whimc:storage stack_entry
data modify storage whimc:storage stack_entry.length set from storage whimc:storage function.length
data modify storage whimc:storage stack_entry.Pos set from storage whimc:storage function.Pos
data modify storage whimc:storage DisplayArcs append value {}
data modify storage whimc:storage DisplayArcs[-1].Pos1 set from storage whimc:storage function.Pos
data modify storage whimc:storage DisplayArcs[-1].Pos2 set from storage whimc:storage marker_data.stack[-1].Pos
scoreboard players add $arc_count whimc.dummy 1
data modify storage whimc:storage marker_data.stack append from storage whimc:storage stack_entry
execute as @e[type=item_display, tag=whimc.execution_display, predicate=whimc:barrelbot/match_bot_id] run function whimc:barrelbot/display/push_back
function whimc:barrelbot/display/function/spawn_displays
function whimc:barrelbot/bot/grab_slot
function whimc:barrelbot/instructions/general/execute_instruction with storage whimc:storage current_step
