tag @s add whimc.barrelbot.puzzle_manager
execute if score $direction whimc.dummy matches 1 run tp @s ~ ~ ~ 90 0
execute if score $direction whimc.dummy matches 2 run tp @s ~ ~ ~ 180 0
execute if score $direction whimc.dummy matches 3 run tp @s ~ ~ ~ 270 0
scoreboard players add $global whimc.barrelbot.puzzle_id 1
scoreboard players operation @s whimc.barrelbot.puzzle_id = $global whimc.barrelbot.puzzle_id
scoreboard players add $global whimc.barrelbot.puzzle_type_id 1
scoreboard players operation @s whimc.barrelbot.puzzle_type_id = $global whimc.barrelbot.puzzle_type_id
data merge entity @s {billboard: "center"}
data modify entity @s text set from storage whimc:const text.barrelbot.start
function whimc:barrelbot/no_smuggle/define_items
summon marker ~ ~ ~ {Tags: ["whimc.barrelbot.puzzle_storage", "whimc.barrelbot.puzzle_storage.init"], data: {success_function: "touch_green"}}
ride @e[type=marker, limit=1, tag=whimc.barrelbot.puzzle_storage.init] mount @s
execute as @e[type=marker, limit=1, tag=whimc.barrelbot.puzzle_storage.init] run function whimc:barrelbot/manager/setup_marker
tag @e[tag=whimc.barrelbot.puzzle_storage.init] remove whimc.barrelbot.puzzle_storage.init
execute rotated as @s positioned ~ ~-1 ~ positioned ^ ^ ^-1 unless block ~ ~ ~ yellow_shulker_box run setblock ~ ~ ~ yellow_shulker_box
execute if score $direction whimc.dummy matches 0 rotated as @s positioned ~ ~-1 ~ positioned ^1 ^ ^-1 run setblock ~ ~ ~ hopper[facing=west]
execute if score $direction whimc.dummy matches 1 rotated as @s positioned ~ ~-1 ~ positioned ^1 ^ ^-1 run setblock ~ ~ ~ hopper[facing=north]
execute if score $direction whimc.dummy matches 2 rotated as @s positioned ~ ~-1 ~ positioned ^1 ^ ^-1 run setblock ~ ~ ~ hopper[facing=east]
execute if score $direction whimc.dummy matches 3 rotated as @s positioned ~ ~-1 ~ positioned ^1 ^ ^-1 run setblock ~ ~ ~ hopper[facing=south]
