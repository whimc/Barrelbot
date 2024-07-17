#> whimc:barrelbot/clone/spawn_manager
#   Spawns a new manager entity for a cloned puzzle

execute summon marker run function whimc:barrelbot/manager/get_execution_direction

execute unless block ~ ~ ~ #minecraft:buttons run setblock ~ ~ ~ minecraft:stone_button[face=floor]

execute align xyz positioned ~0.5 ~0.5 ~0.5 summon text_display run function whimc:barrelbot/clone/manager_setup

scoreboard players operation @s[type=player] whimc.barrelbot.puzzle_id = $global whimc.barrelbot.puzzle_id
scoreboard players operation $new_id whimc.barrelbot.puzzle_id = $global whimc.barrelbot.puzzle_id

scoreboard players operation @s whimc.barrelbot.puzzle_type_id = $temp whimc.barrelbot.puzzle_type_id