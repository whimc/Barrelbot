#> whimc:barrelbot/functions/marker_setup
#   Sets up the marker for tracking a function barrel

tag @s add whimc.barrelbot.function

#Link to current puzzle
scoreboard players operation @s whimc.barrelbot.puzzle_id = $temp whimc.barrelbot.puzzle_id

#Create unique identifier
execute store result entity @s data.id int 1 run scoreboard players add $global_function_id whimc.dummy 1

#Summon item display
execute positioned ~ ~1 ~ summon minecraft:item_display run function whimc:barrelbot/functions/item_display_setup