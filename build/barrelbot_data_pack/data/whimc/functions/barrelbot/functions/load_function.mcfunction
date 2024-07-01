scoreboard players operation @s whimc.barrelbot.puzzle_id = $temp whimc.barrelbot.puzzle_id
execute at @s positioned ~ ~1 ~ as @e[type=item_display, limit=1, distance=..0.001, tag=whimc.function_display] run data modify storage whimc:storage item set from entity @s item
data modify storage whimc:storage current_function set value {}
data modify storage whimc:storage current_function.function set from block ~ ~ ~ Items
data modify storage whimc:storage current_function.id set from storage whimc:storage item.tag.display.Name
data modify storage whimc:storage current_function.length set from storage whimc:storage current_function.function[-1].Slot
data modify storage whimc:storage current_function.Pos set from entity @s Pos
data modify storage whimc:storage functions append from storage whimc:storage current_function
