#> whimc:barrelbot/functions/marker_setup
#   Sets up the marker for tracking a function barrel

tag @s add whimc.barrelbot.function

#Summon item display
execute positioned ~ ~1 ~ summon minecraft:item_display run function whimc:barrelbot/functions/item_display_setup

#Summon interaction
execute positioned ~ ~0.75 ~ summon minecraft:interaction run function whimc:barrelbot/functions/interaction_setup

#Create text display
execute positioned ~ ~1.35 ~ summon minecraft:text_display run function whimc:barrelbot/functions/text_display_setup