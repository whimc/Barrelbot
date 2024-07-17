execute if score @s whimc.barrelbot.stack_height matches 0 run function whimc:barrelbot/bot/move/nested_macro_0 with storage whimc:macro
execute if score @s whimc.barrelbot.stack_height matches 0 run return 0
scoreboard players operation $temp whimc.dummy = @s whimc.barrelbot.stack_height
execute store result storage whimc:macro stack_height int 1 run scoreboard players add $temp whimc.dummy 1
scoreboard players operation $loop_count whimc.dummy = @s whimc.barrelbot.stack_height
execute positioned ~ ~1 ~ run function whimc:barrelbot/bot/mark_area_loop
function whimc:barrelbot/bot/move/nested_macro_1 with storage whimc:macro
