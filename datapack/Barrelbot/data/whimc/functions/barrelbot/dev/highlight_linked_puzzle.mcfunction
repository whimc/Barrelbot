#> whimc:barrelbot/dev/highlight_linked_puzzle

scoreboard players operation $temp whimc.barrelbot.puzzle_id = @s whimc.barrelbot.puzzle_id

execute at @e[type=text_display,tag=whimc.barrelbot.puzzle_manager,predicate=whimc:barrelbot/match_id] run particle dust 0.647 0.267 1 0.7 ~ ~1 ~ 0.01 0.15 0.01 0 3 force @s