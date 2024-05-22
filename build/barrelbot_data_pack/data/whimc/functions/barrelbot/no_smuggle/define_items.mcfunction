scoreboard players operation $temp whimc.barrelbot.puzzle_id = @s whimc.barrelbot.puzzle_id
data remove storage whimc:storage Items
data modify storage whimc:storage Items set from block ~ ~ ~ Items
execute store result score $item_count whimc.dummy if data storage whimc:storage Items[]
execute if score $item_count whimc.dummy matches 1.. run function whimc:barrelbot/no_smuggle/recursively_assign_items
data modify entity @s item.tag.Items set from storage whimc:storage Items
data modify block ~ ~ ~ Items set from storage whimc:storage Items
