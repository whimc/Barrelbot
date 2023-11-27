#> whimc:barrelbot/clone/clone_entities
#   Clones all entities linked to this puzzle

#For each barrelbot, clone it
scoreboard players operation $temp whimc.barrelbot.puzzle_id = @s whimc.barrelbot.puzzle_id
scoreboard players set $bot_summon.call_type whimc.dummy 1
execute as @e[type=item_display,tag=whimc.barrelbot,predicate=whimc:barrelbot/match_id] run function whimc:barrelbot/clone/clone_bot
scoreboard players set $bot_summon.call_type whimc.dummy 0
scoreboard players operation $temp whimc.barrelbot.puzzle_id = @s whimc.barrelbot.puzzle_id

#Clone each function
execute as @e[type=marker,tag=whimc.barrelbot.function,predicate=whimc:barrelbot/match_id] run function whimc:barrelbot/clone/clone_function
