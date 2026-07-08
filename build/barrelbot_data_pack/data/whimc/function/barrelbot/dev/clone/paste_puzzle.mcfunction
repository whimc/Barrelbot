tag @a remove whimc.queue_initiator
tag @s add whimc.queue_initiator
execute if score $propagate_active whimc.dummy matches 1 run function whimc:barrelbot/clone_paste/busy
execute if score $propagate_active whimc.dummy matches 1 run return 0
execute if score $clone_paste_active whimc.dummy matches 1 run function whimc:barrelbot/clone_paste/busy
execute if score $clone_paste_active whimc.dummy matches 1 run return 0
scoreboard players operation $temp whimc.barrelbot.puzzle_id = @s whimc.barrelbot.puzzle_id
execute align xyz as @e[type=text_display, tag=whimc.barrelbot.puzzle_manager, dx=0, dy=0, dz=0] at @s run function whimc:barrelbot/manager/delete_puzzle
execute store result score $paste_x whimc.dummy run data get entity @s Pos[0]
execute store result score $paste_y whimc.dummy run data get entity @s Pos[1]
execute store result score $paste_z whimc.dummy run data get entity @s Pos[2]
execute unless entity @e[type=text_display, tag=whimc.barrelbot.puzzle_manager, predicate=whimc:barrelbot/match_id] run tellraw @s {"text": "Not bound to a puzzle!", "color": "red"}
execute unless entity @e[type=text_display, tag=whimc.barrelbot.puzzle_manager, predicate=whimc:barrelbot/match_id] run tag @s remove whimc.queue_initiator
execute unless entity @e[type=text_display, tag=whimc.barrelbot.puzzle_manager, predicate=whimc:barrelbot/match_id] run return 0
data modify storage whimc:storage clone_paste_queue set value []
function whimc:barrelbot/clone_paste/append_queue_entry
execute as @e[type=text_display, tag=whimc.barrelbot.puzzle_manager, limit=1, predicate=whimc:barrelbot/match_id] run function whimc:barrelbot/clone_paste/prepare_source
function whimc:barrelbot/clone_paste/start
