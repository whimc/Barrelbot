#> whimc:barrelbot/editor/edit_wand/edit_mode/initialize_text_display
#   Initializes the text display

scoreboard players operation @s whimc.barrelbot.edit_instance_id = $temp whimc.barrelbot.edit_instance_id
tag @s add whimc.edit_text_display

execute facing ^ ^ ^-1 run tp @s ~ ~ ~ ~ ~
data modify entity @s {} merge from storage whimc:storage Text[0].data

execute if data storage whimc:storage Text[0].text_provider run function whimc:barrelbot/editor/edit_wand/edit_mode/text_provider_setup