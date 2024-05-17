#> whimc:barrelbot/dev/lock_puzzle_items
#   Sets in stone the current configuration of items

scoreboard players operation $temp whimc.barrelbot.puzzle_id = @s whimc.barrelbot.puzzle_id
execute as @e[type=text_display,tag=whimc.barrelbot.puzzle_manager,predicate=whimc:barrelbot/match_id] at @s run function whimc:barrelbot/no_smuggle/define_items