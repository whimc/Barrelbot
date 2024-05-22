#> whimc:barrelbot/manager/setup
#   Sets up the manager text display entity for a given puzzle

tag @s add whimc.barrelbot.puzzle_manager

execute if score $direction whimc.dummy matches 1 run tp @s ~ ~ ~ 90 0
execute if score $direction whimc.dummy matches 2 run tp @s ~ ~ ~ 180 0
execute if score $direction whimc.dummy matches 3 run tp @s ~ ~ ~ 270 0

scoreboard players add $global whimc.barrelbot.puzzle_id 1
scoreboard players operation @s whimc.barrelbot.puzzle_id = $global whimc.barrelbot.puzzle_id

#Puzzle type ID is used to link together cloned puzzles
scoreboard players add $global whimc.barrelbot.puzzle_type_id 1
scoreboard players operation @s whimc.barrelbot.puzzle_type_id = $global whimc.barrelbot.puzzle_type_id

data merge entity @s {"billboard":"center"}
data modify entity @s text set from storage whimc:const text.barrelbot.start

#Summon data storage marker
summon marker ~ ~ ~ {Tags:["whimc.barrelbot.puzzle_storage","whimc.barrelbot.puzzle_storage.init"],data:{success_function:"touch_green"}}
ride @e[type=marker,limit=1,tag=whimc.barrelbot.puzzle_storage.init] mount @s
execute as @e[type=marker,limit=1,tag=whimc.barrelbot.puzzle_storage.init] run function whimc:barrelbot/manager/setup_marker
tag @e[tag=whimc.barrelbot.puzzle_storage.init] remove whimc.barrelbot.puzzle_storage.init