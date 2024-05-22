#> whimc:barrelbot/no_smuggle/define_items
#   Defines the items for a given instructor

scoreboard players operation $temp whimc.barrelbot.puzzle_id = @s whimc.barrelbot.puzzle_id

data remove storage whimc:storage Items

#Get data from block
data modify storage whimc:storage Items set from block ~ ~ ~ Items

#Recursively assign IDs
execute store result score $item_count whimc.dummy if data storage whimc:storage Items[]
execute if score $item_count whimc.dummy matches 1.. run function whimc:barrelbot/no_smuggle/recursively_assign_items

#Write data to item display
data modify entity @s item.tag.Items set from storage whimc:storage Items

#Write data to block
data modify block ~ ~ ~ Items set from storage whimc:storage Items