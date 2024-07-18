particle end_rod
function whimc:barrelbot/functions/iterate
function whimc:barrelbot/bot/grab_slot
data modify storage whimc:storage current_check set value {}
data modify storage whimc:storage current_check.id set from storage whimc:storage item_data.id
data modify storage whimc:storage current_check.instruction set from storage whimc:storage current_step.instruction
execute unless data storage whimc:storage current_check.id run data modify storage whimc:storage current_check.id set value "minecraft:air"
execute if data storage whimc:storage {current_check: {instruction: "move_forward"}} run function whimc:instructions/move_forward_found
execute if data storage whimc:storage {current_check: {instruction: "turn_left"}} run function whimc:instructions/turn_left_found
execute if data storage whimc:storage {current_check: {instruction: "turn_right"}} run function whimc:instructions/turn_right_found
execute if data storage whimc:storage {current_check: {instruction: "climb"}} run function whimc:instructions/climb_found
execute if data storage whimc:storage {current_check: {instruction: "move_down"}} run function whimc:instructions/move_down_found
execute align xyz run function whimc:instructions/check_loop/nested_macro_0 with storage whimc:storage current_check
