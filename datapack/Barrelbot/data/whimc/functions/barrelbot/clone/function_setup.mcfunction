#> whimc:barrelbot/clone/function_setup
#   Sets up a cloned function

tag @s add whimc.barrelbot.function

#Set function ID
data modify entity @s data.id set from storage whimc:storage function_id

#Summon item display
execute positioned ~ ~1 ~ summon minecraft:item_display run function whimc:barrelbot/clone/function_display_setup

#Summon interaction
execute positioned ~ ~0.75 ~ summon minecraft:interaction run function whimc:barrelbot/functions/interaction_setup

#Summon text display
execute positioned ~ ~1.35 ~ summon minecraft:text_display run function whimc:barrelbot/clone/function_text_setup