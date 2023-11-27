#> whimc:barrelbot/manager/delete_puzzle
#   Deletes the whole puzzle (but not the blocks)

#Kill all bots
execute as @e[type=item_display,tag=whimc.barrelbot,predicate=whimc:barrelbot/match_id] at @s run function whimc:barrelbot/bot/kill

#Kill all functions
execute as @e[type=marker,tag=whimc.barrelbot.function,predicate=whimc:barrelbot/match_id] at @s run function whimc:barrelbot/functions/delete

#Kill manager
execute on passengers run kill @s
kill @s