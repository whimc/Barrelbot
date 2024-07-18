#> whimc:barrelbot/manager/active_tick
#   Ticks the puzzle while its running

scoreboard players add @s whimc.barrelbot.step_timer 1

# Option to speed up with a lever
scoreboard players set $reset_timer whimc.dummy 10
execute if block ~ ~1 ~ minecraft:lever[powered=true] run scoreboard players set $reset_timer whimc.dummy 4
execute if block ~ ~1 ~ minecraft:lever[powered=false] run scoreboard players set $reset_timer whimc.dummy 2000000000

execute if score @s whimc.barrelbot.step_timer >= $reset_timer whimc.dummy run function whimc:barrelbot/manager/step