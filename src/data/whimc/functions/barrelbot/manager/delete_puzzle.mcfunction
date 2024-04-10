#> whimc:barrelbot/manager/delete_puzzle
#   Deletes the whole puzzle (but not the blocks)

#Kill all bots
#execute as @e[type=item_display,tag=whimc.barrelbot,predicate=whimc:barrelbot/match_id] at @s run function whimc:barrelbot/bot/kill

#Kill all functions
#execute as @e[type=marker,tag=whimc.barrelbot.function,predicate=whimc:barrelbot/match_id] at @s run function whimc:barrelbot/functions/delete

#Kill manager
scoreboard players operation $temp whimc.barrelbot.puzzle_id = @s whimc.barrelbot.puzzle_id
execute on passengers if entity @s[tag=whimc.edit_mode] at @s run function whimc:barrelbot/editor/disable_edit_mode
execute on passengers run kill @s
kill @s