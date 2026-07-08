$execute store success score $place_success whimc.dummy if block ^ ^ ^1 #whimc:air run clone ~ ~$(stack_height) ~ ~ ~$(stack_height) ~ ^ ^ ^1 masked move
scoreboard players operation @s whimc.barrelbot.stack_height -= $place_success whimc.dummy
