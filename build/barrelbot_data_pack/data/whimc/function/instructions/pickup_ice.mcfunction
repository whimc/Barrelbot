scoreboard players operation $temp whimc.dummy = @s whimc.barrelbot.stack_height
execute store result storage whimc:macro stack_height int 1 run scoreboard players add $temp whimc.dummy 1
scoreboard players set $stack_success whimc.dummy 0
function whimc:instructions/pickup_ice/nested_macro_0 with storage whimc:macro
execute if score $stack_success whimc.dummy matches 1 run function whimc:instructions/pickup_ice/nested_execute_0
