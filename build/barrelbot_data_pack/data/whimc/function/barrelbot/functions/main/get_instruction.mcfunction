$data modify storage whimc:storage item_data set from storage whimc:storage marker_data.instructions[{Slot:$(step)b}]
execute unless data storage whimc:storage item_data.id run function whimc:barrelbot/functions/main/get_instruction/fallback with storage whimc:storage marker_data.stack[-1]
