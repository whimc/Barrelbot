#> whimc:barrelbot/editor/edit_wand/enter_edit_mode
#   Puts the player into edit mode (invisible chair that edits things)

#Getting basis vectors for projection calculations (THIS IS SO COOL IM ACTUALLY USING THE MATH IM LEARNING)
#IM LITERALLY SO EXCITED RIGHT NOW
function whimc:barrelbot/editor/edit_wand/math/get_plane_basis

#Set up displays
execute anchored eyes positioned ^ ^ ^1.25 run function whimc:barrelbot/editor/edit_wand/edit_mode/load_page_display with storage whimc:macro page

#Chair stuff
ride @s dismount

summon item_display ~ ~0.60001 ~ {Tags:["whimc.editor_base","whimc.editor_base.init"],Passengers:[{id:"minecraft:interaction",Tags:["whimc.editor_click"],width:0.01f,height:1.15f}]}
ride @s mount @e[type=item_display,tag=whimc.editor_base.init,limit=1,sort=nearest]
execute on vehicle run function whimc:barrelbot/editor/edit_wand/setup_base

scoreboard players operation @s whimc.barrelbot.edit_instance_id = $temp whimc.barrelbot.edit_instance_id

tag @s add whimc.in_edit_menu