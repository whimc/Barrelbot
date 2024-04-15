#> whimc:barrelbot/no_smuggle/return_all_items
#   If the player hits a border, return all items to their rightful puzzle

tag @s remove whimc.in_puzzle
execute unless data entity @s Inventory[{tag:{barrelbot:{puzzle_item:1b}}}] run return 0

#Recursively return all items
data modify storage whimc:storage Inventory set from entity @s Inventory
execute store result score $item_count whimc.dummy if data storage whimc:storage Inventory[]
function whimc:barrelbot/no_smuggle/recursively_return_items

#Clear all items
clear @s minecraft:book{barrelbot:{puzzle_item:1b}}

execute if data entity @s Inventory[{tag:{barrelbot:{puzzle_item:1b}}}]:
    data modify storage whimc:storage Inventory set from entity @s Inventory
    execute store result score $items whimc.dummy if data storage whimc:storage Inventory[]
    function ./clear_functions

function ./clear_functions:
    execute if data storage whimc:storage Inventory[0].tag.barrelbot.puzzle_item:
        execute store result score $slot whimc.dummy run data get storage whimc:storage Inventory[0].Slot
        for i in range(0, 36):
            raw f"execute if score $slot whimc.dummy matches {i} run item replace entity @s container.{i} with air"

    scoreboard players remove $items whimc.dummy 1
    data remove storage whimc:storage Inventory[0]
    execute if score $items whimc.dummy matches 1.. run function ./clear_functions