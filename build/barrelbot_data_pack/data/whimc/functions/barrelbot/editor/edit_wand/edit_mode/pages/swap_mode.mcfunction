scoreboard players operation $temp whimc.barrelbot.edit_instance_id = @s whimc.barrelbot.edit_instance_id
execute as @e[type=item_display, tag=whimc.barrelbot, predicate=whimc:barrelbot/match_edit_id] at @s run function whimc:barrelbot/dispenser_bot/toggle
