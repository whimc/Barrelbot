$data modify storage whimc:storage item_data set from storage whimc:storage functions[{id:'$(function)'}].function[{Slot:$(step)b}]
execute unless data storage whimc:storage item_data.id run function whimc:barrelbot/functions/load_instruction_from_function/fallback with storage whimc:storage marker_data.stack[-1]
