tag @s remove whimc.in_puzzle
execute unless data entity @s Inventory[{tag: {barrelbot: {puzzle_item: 1b}}}] run return 0
data modify storage whimc:storage Inventory set from entity @s Inventory
execute store result score $item_count whimc.dummy if data storage whimc:storage Inventory[]
scoreboard players set $item_returned whimc.dummy 0
function whimc:barrelbot/no_smuggle/recursively_return_items
execute if score $item_returned whimc.dummy matches 1 run tellraw @s ["", {"text": "[NOTICE] ", "bold": true, "color": "red"}, {"text": "You can't take a puzzle's items outside the puzzle! They've been returned to the instructor block.", "color": "gold"}]
execute if data entity @s Inventory[{tag: {barrelbot: {puzzle_item: 1b}}}] run function whimc:barrelbot/no_smuggle/return_all_items/nested_execute_0
