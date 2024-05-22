#> whimc:barrelbot/bot/setup
#   Sets up the marker entity for tracking the barrel bot

item replace entity @s container.0 with light_blue_stained_glass_pane{CustomModelData:130000}
data merge entity @s {brightness:{block:15,sky:15},transformation:{scale:[1.001f,1.001f,1.001f]}}

tag @s add whimc.instructor

# Just using the bot ID system for the instructors, shouldn't cause any issues
scoreboard players add $global whimc.barrelbot.bot_id 1
scoreboard players operation @s whimc.barrelbot.bot_id = $global whimc.barrelbot.bot_id


execute if score $direction whimc.dummy matches 3 run tp @s ~ ~ ~ 90 0
execute if score $direction whimc.dummy matches 0 run tp @s ~ ~ ~ 180 0
execute if score $direction whimc.dummy matches 1 run tp @s ~ ~ ~ 270 0

