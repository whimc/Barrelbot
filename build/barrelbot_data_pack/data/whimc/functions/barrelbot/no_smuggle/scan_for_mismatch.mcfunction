data modify storage whimc:storage TempInventory set from storage whimc:storage Inventory
$data remove storage whimc:storage TempInventory[{tag:{barrelbot:{puzzle_id:$(id)}}}]
execute if data storage whimc:storage TempInventory[{tag: {barrelbot: {puzzle_item: 1b}}}] run function whimc:barrelbot/no_smuggle/return_all_items
