data modify storage whimc:storage execution_displays set value []
data modify storage whimc:storage display_instructions set from entity @s data.instructions
execute store result score $entries whimc.dummy if data storage whimc:storage display_instructions[]
execute if score $entries whimc.dummy matches 1.. run function whimc:barrelbot/display/generate_data_recursive
