#> whimc:barrelbot/instructions/loop/while/begin
#   Pushes a whlie loop to the stack

#Push loop to stack
data modify storage whimc:storage stack_entry set value {loop:1b,code_block:1b}
data modify storage whimc:storage stack_entry.function set from storage whimc:storage marker_data.stack[-1].function
data modify storage whimc:storage stack_entry.condition set from storage whimc:storage current_step.condition
data modify storage whimc:storage stack_entry.length set from storage whimc:storage marker_data.stack[-1].length

execute store result score $prev_step whimc.dummy run data get storage whimc:storage marker_data.stack[-1].step
execute store result storage whimc:storage stack_entry.step int 1 run scoreboard players add $prev_step whimc.dummy 1
execute store result storage whimc:storage stack_entry.start_step int 1 run scoreboard players get $prev_step whimc.dummy

data modify storage whimc:storage marker_data.stack append from storage whimc:storage stack_entry

#Call the next instruction
function whimc:barrelbot/bot/grab_slot
function whimc:barrelbot/instructions/general/execute_instruction with storage whimc:storage current_step