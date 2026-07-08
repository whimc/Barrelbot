$execute store success score $stack_success whimc.dummy if block ~ ~$(stack_height) ~ #whimc:air if block ^ ^ ^1 #whimc:stackable run clone ^ ^ ^1 ^ ^ ^1 ~ ~$(stack_height) ~ masked move
scoreboard players operation @s whimc.barrelbot.stack_height += $stack_success whimc.dummy
