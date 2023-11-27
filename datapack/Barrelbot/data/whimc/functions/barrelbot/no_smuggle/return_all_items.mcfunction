#> whimc:barrelbot/no_smuggle/return_all_items
#   If the player hits a border, return all items to their rightful puzzle

execute unless data entity @s Inventory[{tag:{barrelbot:{puzzle_item:1b}}}] run return 0

#Recursively return all items
data modify storage whimc:storage Inventory set from entity @s Inventory
execute store result score $item_count whimc.dummy if data storage whimc:storage Inventory[]
function whimc:barrelbot/no_smuggle/recursively_return_items

#Clear all items
clear @s minecraft:book{barrelbot:{puzzle_item:1b}}