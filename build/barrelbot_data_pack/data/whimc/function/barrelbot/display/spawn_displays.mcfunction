execute store result score $entries whimc.dummy if data storage whimc:storage execution_displays[]
execute positioned ~ ~1.25 ~ if score $entries whimc.dummy matches 1.. run function whimc:barrelbot/display/spawn_displays_recursive
execute positioned ~ ~1.25 ~ summon item_display run function whimc:barrelbot/display/setup_cursor
execute positioned ~ ~1.25 ~ summon item_display run function whimc:barrelbot/display/setup_base
