scoreboard players set $item_returned whimc.dummy 1
data modify storage whimc:storage Pos set from entity @s Pos
execute store result score $x1 whimc.dummy run data get storage whimc:storage Pos[0] 1000
execute store result score $y1 whimc.dummy run data get storage whimc:storage Pos[1] 1000
execute store result score $z1 whimc.dummy run data get storage whimc:storage Pos[2] 1000
scoreboard players add $y1 whimc.dummy 1650
execute store result score $temp whimc.barrelbot.bot_id run data get storage whimc:storage Inventory[0].tag.barrelbot.instructor_id
data modify storage kmc.item:api item_stack set from storage whimc:storage Inventory[0]
execute as @e[type=item_display, tag=whimc.instructor, predicate=whimc:barrelbot/match_bot_id] at @s run function whimc:barrelbot/no_smuggle/return_item/nested_execute_1
