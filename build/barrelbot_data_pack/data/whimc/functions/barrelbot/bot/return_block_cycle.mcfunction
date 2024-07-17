data modify storage whimc:macro return_loc set from storage whimc:storage marker_data.block_stack[0]
function whimc:barrelbot/bot/return_block_cycle/nested_macro_0 with storage whimc:macro return_loc
data remove storage whimc:storage marker_data.block_stack[0]
scoreboard players remove @s whimc.barrelbot.stack_height 1
execute if score @s whimc.barrelbot.stack_height matches 1.. positioned ~ ~1 ~ run function whimc:barrelbot/bot/return_block_cycle
