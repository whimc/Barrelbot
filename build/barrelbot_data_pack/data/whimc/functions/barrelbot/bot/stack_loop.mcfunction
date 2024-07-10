scoreboard players add @s whimc.barrelbot.stack_height 1
execute positioned ~ ~1 ~ if block ~ ~1 ~ #whimc:stackable run function whimc:barrelbot/bot/stack_loop
