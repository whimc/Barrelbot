#> whimc:barrelbot/display/setup_base
#   Sets up the base entity for an execution display

tag @s add whimc.execution_display
tag @s add whimc.execution_display_base

scoreboard players operation @s whimc.barrelbot.bot_id = $temp whimc.barrelbot.bot_id
scoreboard players set @s whimc.barrelbot.display_layer 0
data merge entity @s {billboard:"center",item_display:"gui",transformation:{scale:[2.22f,2.22f,2.22f],translation:[0f,0.72f,0f]}}

item replace entity @s container.0 with glowstone_dust{CustomModelData:130000}