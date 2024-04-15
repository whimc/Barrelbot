scoreboard players operation $temp whimc.barrelbot.puzzle_id = @s whimc.barrelbot.puzzle_id
data remove storage whimc:storage Items
execute positioned ~ ~-1 ~ run data modify storage whimc:storage Items set from block ^ ^ ^-1 Items
execute store result score $item_count whimc.dummy if data storage whimc:storage Items[]
execute if score $item_count whimc.dummy matches 1.. run function whimc:barrelbot/no_smuggle/recursively_assign_items
execute on passengers run data modify entity @s data.Items set from storage whimc:storage Items
execute positioned ~ ~-1 ~ run data modify block ^ ^ ^-1 Items set from storage whimc:storage Items
