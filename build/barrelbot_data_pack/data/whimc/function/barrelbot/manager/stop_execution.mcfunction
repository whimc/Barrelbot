data modify entity @s text set from storage whimc:const text.barrelbot.start
tag @s remove whimc.barrelbot.puzzle_manager.active
tag @s remove whimc.success
scoreboard players operation $temp whimc.barrelbot.puzzle_id = @s whimc.barrelbot.puzzle_id
execute as @e[type=item_display, tag=whimc.barrelbot, predicate=whimc:barrelbot/match_id] at @s run function whimc:barrelbot/bot/reset
execute as @e[type=marker, tag=whimc.barrelbot.placed_block, predicate=whimc:barrelbot/match_id] at @s run function whimc:barrelbot/manager/stop_execution/nested_execute_0
execute as @e[type=marker, tag=whimc.barrelbot.dropped_block, predicate=whimc:barrelbot/match_id] at @s run function whimc:barrelbot/manager/stop_execution/nested_execute_1
