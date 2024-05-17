#> whimc:technical/slow_tick
#   Runs once every 5 ticks

execute as @e[type=item_display,tag=whimc.barrelbot] at @s if block ~ ~ ~ air run function whimc:barrelbot/bot/kill
execute as @e[type=marker,tag=whimc.barrelbot.function] at @s if block ~ ~ ~ air run function whimc:barrelbot/functions/delete
execute as @e[type=text_display,tag=whimc.barrelbot.puzzle_manager] at @s if block ~ ~ ~ air run function whimc:barrelbot/manager/delete_puzzle

scoreboard players set #slow_tick whimc.dummy 0