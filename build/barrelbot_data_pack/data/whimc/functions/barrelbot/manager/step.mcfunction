execute if entity @s[tag=whimc.success] run return 1
execute on passengers run data modify storage whimc:storage functions set from entity @s data.functions
scoreboard players set @s whimc.barrelbot.step_timer 0
execute as @e[type=item_display, tag=whimc.barrelbot, tag=!whimc.dispenser_bot, predicate=whimc:barrelbot/match_id] at @s run function whimc:barrelbot/bot/step
execute as @e[type=item_display, tag=whimc.dispenser_bot, predicate=whimc:barrelbot/match_id] at @s run function whimc:barrelbot/bot/step
data modify storage whimc:macro success_function set value {}
execute on passengers run data modify storage whimc:macro success_function.function set from entity @s data.success_function
scoreboard players set $success whimc.dummy 0
function whimc:barrelbot/manager/check_success_condition with storage whimc:macro success_function
scoreboard players operation $temp whimc.barrelbot.puzzle_type_id = @s whimc.barrelbot.puzzle_type_id
execute if score $success whimc.dummy matches 1 run function whimc:barrelbot/manager/puzzle_success
