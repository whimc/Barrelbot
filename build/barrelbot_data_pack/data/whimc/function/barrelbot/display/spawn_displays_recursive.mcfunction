execute summon item_display run function whimc:barrelbot/display/initialize_item
scoreboard players remove $entries whimc.dummy 1
data remove storage whimc:storage execution_displays[0]
execute if score $entries whimc.dummy matches 1.. run function whimc:barrelbot/display/spawn_displays_recursive
