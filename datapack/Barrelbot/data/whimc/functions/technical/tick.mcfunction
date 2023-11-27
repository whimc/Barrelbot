#> whimc:technical/tick
#   Commands run per tick

#Manage all demos
function whimc:demos/generic/tick

#Barrelbot
execute as @e[type=text_display,tag=whimc.barrelbot.puzzle_manager] at @s run function whimc:barrelbot/manager/tick
execute as @a[gamemode=!creative] at @s if block ~ ~ ~ minecraft:light[level=0] run function whimc:barrelbot/no_smuggle/return_all_items
execute as @a[tag=whimc.barrelbot.cloning] at @s run function whimc:barrelbot/clone/tick
execute as @a[predicate=whimc:barrelbot/holding_dev_book] run function whimc:barrelbot/dev/highlight_linked_puzzle