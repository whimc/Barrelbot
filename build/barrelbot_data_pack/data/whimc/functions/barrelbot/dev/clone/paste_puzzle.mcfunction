scoreboard players operation $temp whimc.barrelbot.puzzle_id = @s whimc.barrelbot.puzzle_id
execute align xyz as @e[type=text_display, tag=whimc.barrelbot.puzzle_manager, dx=0, dy=0, dz=0] at @s run function whimc:barrelbot/manager/delete_puzzle
execute store result score $paste_x whimc.dummy run data get entity @s Pos[0]
execute store result score $paste_y whimc.dummy run data get entity @s Pos[1]
execute store result score $paste_z whimc.dummy run data get entity @s Pos[2]
execute unless entity @e[type=text_display, tag=whimc.barrelbot.puzzle_manager, predicate=whimc:barrelbot/match_id] run tellraw @s {"text": "Not bound to a puzzle!", "color": "red"}
execute unless entity @e[type=text_display, tag=whimc.barrelbot.puzzle_manager, predicate=whimc:barrelbot/match_id] run return 0
execute as @e[type=text_display, tag=whimc.barrelbot.puzzle_manager, limit=1, predicate=whimc:barrelbot/match_id] run function whimc:barrelbot/clone/clone_as_manager
