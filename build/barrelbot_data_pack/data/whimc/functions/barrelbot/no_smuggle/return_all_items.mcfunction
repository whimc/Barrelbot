tag @s remove whimc.in_puzzle
execute unless data entity @s Inventory[{tag: {barrelbot: {puzzle_item: 1b}}}] run return 0
data modify storage whimc:storage Inventory set from entity @s Inventory
execute store result score $item_count whimc.dummy if data storage whimc:storage Inventory[]
function whimc:barrelbot/no_smuggle/recursively_return_items
clear @s minecraft:book{barrelbot: {puzzle_item: 1b}}
