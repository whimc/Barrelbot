data modify entity @s data.block_stack set value []
data modify entity @s data.instructions set from block ~ ~ ~ Items
data modify entity @s data.stack set value [{function: -1, step: 0, Pos: "self"}]
data modify entity @s data.stack[0].length set from entity @s data.instructions[-1].Slot
function whimc:barrelbot/display/generate_data
function whimc:barrelbot/display/spawn_displays
