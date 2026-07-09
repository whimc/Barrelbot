$data modify storage whimc:storage item_data set from storage whimc:storage functions[{id:'$(function)'}].function[{slot:$(step)}]
execute unless data storage whimc:storage item_data.id run function whimc:barrelbot/functions/load_instruction_from_function/fallback_index with storage whimc:storage marker_data.stack[-1]
