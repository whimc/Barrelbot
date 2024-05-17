#> whimc:barrelbot/display/push_forward_loop
#   Repeatedly pushes forward if necessary

execute as @e[type=item_display,tag=whimc.execution_display,predicate=whimc:barrelbot/match_bot_id] run function whimc:barrelbot/display/push_forward

scoreboard players remove @s whimc.barrelbot.push_count 1
execute if score @s whimc.barrelbot.push_count matches 1.. run function whimc:barrelbot/display/push_forward_loop