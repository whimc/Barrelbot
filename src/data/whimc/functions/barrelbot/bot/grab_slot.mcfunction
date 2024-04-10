#> whimc:barrelbot/bot/grab_slot
#   Gets data from a slot

data modify storage whimc:storage current_step set value {}

#Get the function id -- A score of -1 indicates "main", grabbing instructions from the barrelbot itself
execute store result score $function_id whimc.dummy run data get storage whimc:storage marker_data.stack[-1].function

#data modify storage whimc:macro slot.slot set from storage whimc:storage marker_data.stack[-1].step
execute if score $function_id whimc.dummy matches -1 run function whimc:barrelbot/functions/main/get_instruction with storage whimc:storage marker_data.stack[-1]

execute unless score $function_id whimc.dummy matches -1 run function whimc:barrelbot/functions/load_instruction_from_function with storage whimc:storage marker_data.stack[-1]
