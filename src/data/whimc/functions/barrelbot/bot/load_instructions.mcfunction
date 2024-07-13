#> whimc:barrelbot/bot/load_instructions
#   Grabs the data from the block to load it into the marker

data modify entity @s data.block_stack set value []

#execute if score $is_dispenser whimc.dummy matches 0 run data modify entity @s data.instructions set from block ~ ~ ~ Items
data modify entity @s data.instructions set from block ~ ~ ~ Items
data modify entity @s data.stack set value [{function:-1,step:0,Pos:"self"}]
data modify entity @s data.stack[0].length set from entity @s data.instructions[-1].Slot
data modify block ~ ~ ~ Lock set value "heheheha"

#Display instructions
function whimc:barrelbot/display/generate_data
function whimc:barrelbot/display/spawn_displays