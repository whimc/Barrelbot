#> whimc:barrelbot/display/spawn_displays
#   Spawns all the item displays to appear over the barrelbot
#
#Input: whimc:storage execution_displays

#Recursively iterate through list of displays

execute store result score $entries whimc.dummy if data storage whimc:storage execution_displays[]
execute positioned ~ ~1.25 ~ if score $entries whimc.dummy matches 1.. run function whimc:barrelbot/display/spawn_displays_recursive

#Summon cursor entity
execute positioned ~ ~1.25 ~ summon item_display run function whimc:barrelbot/display/setup_cursor

#Summon inventory container entity
execute positioned ~ ~1.25 ~ summon item_display run function whimc:barrelbot/display/setup_base