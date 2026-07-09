data modify entity @s data.block_stack set value []
function whimc:barrelbot/bot/read_block_items
execute store result score $item_count whimc.dummy if data storage whimc:storage Items[]
execute if score $item_count whimc.dummy matches 1.. run function whimc:barrelbot/bot/canonicalize_item_entry
data modify entity @s data.instructions set from storage whimc:storage Items
data modify entity @s data.stack set value [{function: -1, step: 0, Pos: "self"}]
execute store result storage whimc:storage temp_len int 1 run data get entity @s data.instructions[-1].Slot
execute unless data entity @s data.instructions[-1].Slot store result storage whimc:storage temp_len int 1 run data get entity @s data.instructions[-1].slot
data modify entity @s data.stack[0].length set from storage whimc:storage temp_len
function whimc:barrelbot/display/generate_data
function whimc:barrelbot/display/spawn_displays
