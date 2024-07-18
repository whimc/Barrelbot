scoreboard players add @s whimc.barrelbot.step_timer 1
scoreboard players set $reset_timer whimc.dummy 10
execute if block ~ ~1 ~ minecraft:lever[powered=true] run scoreboard players set $reset_timer whimc.dummy 4
execute if score @s whimc.barrelbot.step_timer >= $reset_timer whimc.dummy run function whimc:barrelbot/manager/step
