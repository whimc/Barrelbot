#> whimc:barrelbot/display/spawn_displays_recursive
#   Summons a single item display

#Summon display
execute summon item_display run function whimc:barrelbot/display/initialize_item

#Continue recursion
scoreboard players remove $entries whimc.dummy 1
data remove storage whimc:storage execution_displays[0]
execute if score $entries whimc.dummy matches 1.. run function whimc:barrelbot/display/spawn_displays_recursive

