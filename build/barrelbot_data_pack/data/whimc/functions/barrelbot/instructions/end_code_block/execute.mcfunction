return 0
execute unless data storage whimc:storage marker_data.stack[-1].code_block run return 0
execute store success score $in_loop whimc.dummy if data storage whimc:storage marker_data.stack[-1].loop
execute if score $in_loop whimc.dummy matches 1 run function whimc:barrelbot/instructions/loop/end_code_block
