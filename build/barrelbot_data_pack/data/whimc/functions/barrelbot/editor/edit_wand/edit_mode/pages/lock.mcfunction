scoreboard players operation $temp whimc.barrelbot.edit_instance_id = @s whimc.barrelbot.edit_instance_id
execute as @e[type=marker, tag=whimc.barrelbot.function, predicate=whimc:barrelbot/match_edit_id] at @s positioned ~ ~1 ~ as @e[type=item_display, tag=whimc.function_display, distance=..0.001] run function whimc:barrelbot/functions/interact/lock
