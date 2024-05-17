scoreboard players set $failure_found whimc.dummy 0
execute as @e[type=item_display, tag=whimc.barrelbot, tag=!whimc.dispenser_bot, predicate=whimc:barrelbot/match_id] at @s run function whimc:barrelbot/success_conditions/defer/nested_execute_0
scoreboard players set $success whimc.dummy 0
execute if score $failure_found whimc.dummy matches 0 run scoreboard players set $success whimc.dummy 1
