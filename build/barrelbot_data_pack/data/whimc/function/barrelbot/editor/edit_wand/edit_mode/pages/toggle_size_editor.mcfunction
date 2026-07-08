scoreboard players operation $temp whimc.barrelbot.edit_instance_id = @s whimc.barrelbot.edit_instance_id
execute as @e[type=text_display, limit=1, tag=whimc.barrelbot.puzzle_manager, predicate=whimc:barrelbot/match_edit_id] on passengers at @s run function whimc:barrelbot/editor/toggle_edit_mode
