execute store result score $paste_x whimc.dummy run data get storage whimc:storage clone_paste_queue[0].x
execute store result score $paste_y whimc.dummy run data get storage whimc:storage clone_paste_queue[0].y
execute store result score $paste_z whimc.dummy run data get storage whimc:storage clone_paste_queue[0].z
scoreboard players operation $temp whimc.barrelbot.puzzle_id = $source_puzzle_id whimc.dummy
execute as @e[type=text_display, limit=1, predicate=whimc:barrelbot/match_id, tag=whimc.barrelbot.puzzle_manager] at @s run function whimc:barrelbot/clone/clone_as_manager
