#> whimc:barrelbot/clone/function_setup
#   Sets up a cloned function

tag @s add whimc.barrelbot.function

#Link to current puzzle
scoreboard players operation @s whimc.barrelbot.puzzle_id = $new_id whimc.barrelbot.puzzle_id

#Set function ID
data modify entity @s data.id set from storage whimc:storage function_id

#Summon item display
execute positioned ~ ~1 ~ summon minecraft:item_display run function whimc:barrelbot/clone/function_display_setup