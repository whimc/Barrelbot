execute if score @s whimc.barrelbot.stack_height matches 0 run return 0
execute store result storage whimc:macro stack_height int 1 run scoreboard players get @s whimc.barrelbot.stack_height
scoreboard players set $place_success whimc.dummy 0
function whimc:barrelbot/instructions/place/execute/nested_macro_0 with storage whimc:macro
execute if score $place_success whimc.dummy matches 1 run function whimc:barrelbot/instructions/place/execute/nested_execute_1
