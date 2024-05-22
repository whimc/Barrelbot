#> whimc:barrelbot/no_smuggle/recursively_assign_items
#   Give each item the ID corresponding to the puzzle ID

execute store result storage whimc:storage Items[0].tag.barrelbot.puzzle_id int 1 run scoreboard players get $temp whimc.barrelbot.puzzle_id
execute store result storage whimc:storage Items[0].tag.barrelbot.instructor_id int 1 run scoreboard players get @s whimc.barrelbot.bot_id
data modify storage whimc:storage Items[0].tag.barrelbot.puzzle_item set value 1b

#Cycle array
data modify storage whimc:storage Items append from storage whimc:storage Items[0]
data remove storage whimc:storage Items[0]

#Recurse if there are still entries to process
scoreboard players remove $item_count whimc.dummy 1
execute if score $item_count whimc.dummy matches 1.. run function whimc:barrelbot/no_smuggle/recursively_assign_items