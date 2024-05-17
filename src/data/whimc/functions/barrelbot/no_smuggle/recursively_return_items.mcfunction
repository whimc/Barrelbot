#> whimc:barrelbot/no_smuggle/recursively_return_items
#   Takes items from the inventory and spawns them at the hopper next to the shulker box

#Check if the item is a valid item. If it is, return it
execute if data storage whimc:storage Inventory[0].tag.barrelbot.puzzle_item run function whimc:barrelbot/no_smuggle/return_item

#Recurse
data remove storage whimc:storage Inventory[0]
scoreboard players remove $item_count whimc.dummy 1
execute if score $item_count whimc.dummy matches 1.. run function whimc:barrelbot/no_smuggle/recursively_return_items