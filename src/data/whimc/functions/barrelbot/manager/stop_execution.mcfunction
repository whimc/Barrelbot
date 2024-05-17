#> whimc:barrelbot/manager/stop_execution
#   Ends the execution of the given puzzle

#Change text
data modify entity @s text set from storage whimc:const text.barrelbot.start

#Add tag
tag @s remove whimc.barrelbot.puzzle_manager.active
tag @s remove whimc.success

#Reset all barrel bots
scoreboard players operation $temp whimc.barrelbot.puzzle_id = @s whimc.barrelbot.puzzle_id
execute as @e[type=item_display,tag=whimc.barrelbot,predicate=whimc:barrelbot/match_id] at @s run function whimc:barrelbot/bot/reset

#Delete all blocks placed by the barrelbot
execute as @e[type=marker,tag=whimc.barrelbot.placed_block,predicate=whimc:barrelbot/match_id] at @s run function whimc:barrelbot/instructions/place_block/delete_block

