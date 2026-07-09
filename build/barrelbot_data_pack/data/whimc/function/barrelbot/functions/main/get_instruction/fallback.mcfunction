$data modify storage whimc:storage item_data set from storage whimc:storage marker_data.instructions[{slot:$(step)}]
execute unless data storage whimc:storage item_data.id run function whimc:barrelbot/functions/main/get_instruction/fallback_index with storage whimc:storage marker_data.stack[-1]
