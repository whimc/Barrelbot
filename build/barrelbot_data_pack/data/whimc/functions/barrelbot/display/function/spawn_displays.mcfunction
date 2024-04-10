data modify storage whimc:storage execution_displays set value []
data modify storage whimc:storage display_instructions set from storage whimc:storage function.function
execute store result score $entries whimc.dummy if data storage whimc:storage display_instructions[]
execute if score $entries whimc.dummy matches 1.. run function whimc:barrelbot/display/generate_data_recursive
execute store result score $entries whimc.dummy if data storage whimc:storage execution_displays[]
execute positioned ~ ~1.25 ~ if score $entries whimc.dummy matches 1.. run function whimc:barrelbot/display/spawn_displays_recursive
execute positioned ~ ~1.25 ~ summon item_display run function whimc:barrelbot/display/function/setup_cursor
execute positioned ~ ~1.25 ~ summon item_display run function whimc:barrelbot/display/function/setup_base
