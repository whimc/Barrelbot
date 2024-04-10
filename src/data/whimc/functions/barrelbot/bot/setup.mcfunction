#> whimc:barrelbot/bot/setup
#   Sets up the marker entity for tracking the barrel bot

item replace entity @s container.0 with black_stained_glass_pane{CustomModelData:130000}
data merge entity @s {brightness:{block:15,sky:15},transformation:{scale:[1.001f,1.001f,1.001f]}}

tag @s add whimc.barrelbot
#scoreboard players operation @s whimc.barrelbot.puzzle_id = $temp whimc.barrelbot.puzzle_id

scoreboard players add $global whimc.barrelbot.bot_id 1
scoreboard players operation @s whimc.barrelbot.bot_id = $global whimc.barrelbot.bot_id

data modify storage whimc:storage SpawnPos set from entity @s Pos

execute if score $direction whimc.dummy matches 3 run tp @s ~ ~ ~ 90 0
execute if score $direction whimc.dummy matches 0 run tp @s ~ ~ ~ 180 0
execute if score $direction whimc.dummy matches 1 run tp @s ~ ~ ~ 270 0

data modify storage whimc:storage SpawnRotation set from entity @s Rotation

#Create marker for storing data on the barrelbot
summon marker ~ ~ ~ {data:{stack:[{function:-1,step:0}]},Tags:["whimc.barrelbot.marker","whimc.barrelbot.marker.init"]}
ride @e[type=marker,limit=1,sort=nearest,distance=..0.1,tag=whimc.barrelbot.marker.init] mount @s
execute on passengers run function whimc:barrelbot/bot/marker_setup