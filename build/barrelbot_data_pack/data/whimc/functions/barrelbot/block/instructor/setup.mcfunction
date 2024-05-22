item replace entity @s container.0 with light_blue_stained_glass_pane{CustomModelData: 130000}
data merge entity @s {brightness: {block: 15, sky: 15}, transformation: {scale: [1.001f, 1.001f, 1.001f]}}
tag @s add whimc.instructor
scoreboard players add $global whimc.barrelbot.bot_id 1
scoreboard players operation @s whimc.barrelbot.bot_id = $global whimc.barrelbot.bot_id
execute if score $direction whimc.dummy matches 3 run tp @s ~ ~ ~ 90 0
execute if score $direction whimc.dummy matches 0 run tp @s ~ ~ ~ 180 0
execute if score $direction whimc.dummy matches 1 run tp @s ~ ~ ~ 270 0
