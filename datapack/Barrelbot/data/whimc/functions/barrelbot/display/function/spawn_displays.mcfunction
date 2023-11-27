#> whimc:barrelbot/display/function/spawn_displays
#   Spawns the display entities for a function

#Generate list of displays from function
data modify storage whimc:storage execution_displays set value []

data modify storage whimc:storage display_instructions set from storage whimc:storage function.function
execute store result score $entries whimc.dummy if data storage whimc:storage display_instructions[]

execute if score $entries whimc.dummy matches 1.. run function whimc:barrelbot/display/generate_data_recursive

#Recursively iterate through list of displays
execute store result score $entries whimc.dummy if data storage whimc:storage execution_displays[]
execute positioned ~ ~1.25 ~ if score $entries whimc.dummy matches 1.. run function whimc:barrelbot/display/spawn_displays_recursive

#Summon cursor entity
execute positioned ~ ~1.25 ~ summon item_display run function whimc:barrelbot/display/function/setup_cursor

#Summon inventory container entity
execute positioned ~ ~1.25 ~ summon item_display run function whimc:barrelbot/display/function/setup_base