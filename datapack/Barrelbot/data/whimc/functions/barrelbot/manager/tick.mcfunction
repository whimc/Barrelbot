#> whimc:barrelbot/manager/tick
#   Ticks the manager

scoreboard players operation $temp whimc.barrelbot.puzzle_id = @s whimc.barrelbot.puzzle_id

scoreboard players remove @s[scores={whimc.button_delay=1..}] whimc.button_delay 1
execute unless score @s whimc.button_delay matches 1.. if entity @a[distance=..10] if block ~ ~ ~ #minecraft:buttons[powered=true] run function whimc:barrelbot/manager/toggle_execution

execute if entity @s[tag=whimc.barrelbot.puzzle_manager.active] run function whimc:barrelbot/manager/active_tick