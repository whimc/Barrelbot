#> whimc:barrelbot/no_smuggle/define_items
#   Defines the items for a given puzzle

data remove storage whimc:storage Items

#Get data from block
execute positioned ~ ~-1 ~ run data modify storage whimc:storage Items set from block ^ ^ ^-1 Items

#Recursively assign IDs
execute store result score $item_count whimc.dummy if data storage whimc:storage Items[]
execute if score $item_count whimc.dummy matches 1.. run function whimc:barrelbot/no_smuggle/recursively_assign_items

#Write data to marker
execute on passengers run data modify entity @s data.Items set from storage whimc:storage Items

#Write data to block
execute positioned ~ ~-1 ~ run data modify block ^ ^ ^-1 Items set from storage whimc:storage Items