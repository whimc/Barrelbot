#> whimc:barrelbot/display/initialize_item
#   Sets up an individual instruction display

data merge entity @s {teleport_duration:0,billboard:"center",transformation:{scale:[0.2f,0.2f,0f],left_rotation:{angle:3.141592f,axis:[0f, 1f, 0f]}},item_display:"gui",brightness:{sky:15,block:15}}
data modify entity @s {} merge from storage whimc:storage execution_displays[0]

tag @s add whimc.execution_display
tag @s add whimc.execution_display_item

scoreboard players operation @s whimc.barrelbot.bot_id = $temp whimc.barrelbot.bot_id
scoreboard players set @s whimc.barrelbot.display_layer 0
#ride @s mount @e[type=item_display,tag=whimc.execution_display_base,predicate=whimc:barrelbot/match_bot_id,limit=1]