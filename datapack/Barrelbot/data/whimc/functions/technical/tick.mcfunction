#> whimc:technical/tick
#   Commands run per tick

#Barrelbot
execute as @e[type=text_display,tag=whimc.barrelbot.puzzle_manager] at @s run function whimc:barrelbot/manager/tick
execute as @a[tag=whimc.in_puzzle] at @s run function whimc:barrelbot/no_smuggle/check_leave_boundary 
execute as @a[tag=whimc.barrelbot.cloning] at @s run function whimc:barrelbot/clone/tick
execute as @a[tag=whimc.dragging_node] at @s run function whimc:barrelbot/editor/drag/drag_tick
execute as @a[predicate=whimc:barrelbot/holding_dev_book] run function whimc:barrelbot/dev/highlight_linked_puzzle
scoreboard players add #slow_tick whimc.dummy 1
execute if score #slow_tick whimc.dummy matches 5.. run function whimc:technical/slow_tick