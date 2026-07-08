tag @a remove whimc.queue_initiator
tag @s add whimc.queue_initiator
execute if score $propagate_active whimc.dummy matches 1 run function whimc:barrelbot/clone_paste/busy
execute if score $propagate_active whimc.dummy matches 1 run return 0
execute if score $clone_paste_active whimc.dummy matches 1 run function whimc:barrelbot/clone_paste/busy
execute if score $clone_paste_active whimc.dummy matches 1 run return 0
scoreboard players operation $temp whimc.barrelbot.puzzle_id = @s whimc.barrelbot.puzzle_id
execute as @e[type=text_display, limit=1, predicate=whimc:barrelbot/match_id, tag=whimc.barrelbot.puzzle_manager] at @s run function whimc:barrelbot/clone/propagate/propagate_changes
