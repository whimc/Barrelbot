function whimc:barrelbot/functions/iterate
scoreboard players set $end_found whimc.dummy 0
function whimc:barrelbot/bot/grab_slot
execute if data storage whimc:storage {current_step: {instruction: "loop"}} run scoreboard players add $code_block_depth whimc.dummy 1
execute if data storage whimc:storage {current_step: {instruction: "if"}} run scoreboard players add $code_block_depth whimc.dummy 1
execute if data storage whimc:storage {current_step: {instruction: "end_code_block"}} run scoreboard players remove $code_block_depth whimc.dummy 1
execute if data storage whimc:storage {current_step: {instruction: "else"}} run scoreboard players remove $code_block_depth whimc.dummy 1
execute if score $code_block_depth whimc.dummy matches ..-1 run scoreboard players set $end_found whimc.dummy 1
execute store result score $max_step whimc.dummy run data get storage whimc:storage marker_data.stack[-1].length
execute if score $step whimc.dummy > $max_step whimc.dummy run scoreboard players set $end_found whimc.dummy 1
execute if score $end_found whimc.dummy matches 0 run function whimc:barrelbot/instructions/if/failure
