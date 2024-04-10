#> whimc:barrelbot/dev/spawn_manager
#   Spawns the button (if necessary) and manager for a particular puzzle

execute summon marker run function whimc:barrelbot/manager/get_execution_direction

execute unless block ~ ~ ~ #minecraft:buttons run setblock ~ ~ ~ minecraft:stone_button[face=floor]

execute align xyz positioned ~0.5 ~0.5 ~0.5 summon text_display run function whimc:barrelbot/manager/setup

scoreboard players operation @s[type=player] whimc.barrelbot.puzzle_id = $global whimc.barrelbot.puzzle_id
scoreboard players operation $new_id whimc.barrelbot.puzzle_id = $global whimc.barrelbot.puzzle_id

tellraw @s {"text": "Successfully linked to puzzle", "color": "green"}