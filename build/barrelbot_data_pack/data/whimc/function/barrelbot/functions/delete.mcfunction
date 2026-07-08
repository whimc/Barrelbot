setblock ~ ~ ~ air
execute positioned ~ ~1 ~ as @e[type=item_display, tag=whimc.function_display, limit=1, sort=nearest, distance=..0.1] run kill @s
execute positioned ~ ~0.75 ~ as @e[type=interaction, tag=whimc.barrelbot.function_interaction, limit=1, sort=nearest, distance=..0.1] run kill @s
execute positioned ~ ~1.35 ~ as @e[type=text_display, tag=whimc.barrelbot.function_text, limit=1, sort=nearest, distance=..0.1] run kill @s
kill @s
