#> whimc:barrelbot/dev/propagate_changes
#   Propagate any changes to the puzzle to all clones

scoreboard players operation $temp whimc.barrelbot.puzzle_id = @s whimc.barrelbot.puzzle_id
execute as @e[type=text_display,limit=1,predicate=whimc:barrelbot/match_id,tag=whimc.barrelbot.puzzle_manager] at @s run function whimc:barrelbot/clone/propagate/propagate_changes