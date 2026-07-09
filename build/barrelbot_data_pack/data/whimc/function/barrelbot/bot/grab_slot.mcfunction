data modify storage whimc:storage current_step set value {}
data modify storage whimc:storage item_data set value {}
execute store result score $function_id whimc.dummy run data get storage whimc:storage marker_data.stack[-1].function
execute if score $function_id whimc.dummy matches -1 run function whimc:barrelbot/functions/main/get_instruction with storage whimc:storage marker_data.stack[-1]
execute unless score $function_id whimc.dummy matches -1 run function whimc:barrelbot/functions/load_instruction_from_function with storage whimc:storage marker_data.stack[-1]
data modify storage whimc:storage current_step set from storage whimc:storage item_data.components."minecraft:custom_data".barrelbot
execute unless data storage whimc:storage current_step.instruction run data modify storage whimc:storage current_step set from storage whimc:storage item_data.tag.barrelbot
execute unless data storage whimc:storage current_step.instruction run data modify storage whimc:storage current_step set from storage whimc:storage item_data.item.components."minecraft:custom_data".barrelbot
data modify storage whimc:storage current_step.Count set from storage whimc:storage item_data.Count
execute unless data storage whimc:storage current_step.Count run data modify storage whimc:storage current_step.Count set from storage whimc:storage item_data.count
execute unless data storage whimc:storage current_step.Count run data modify storage whimc:storage current_step.Count set from storage whimc:storage item_data.item.count
