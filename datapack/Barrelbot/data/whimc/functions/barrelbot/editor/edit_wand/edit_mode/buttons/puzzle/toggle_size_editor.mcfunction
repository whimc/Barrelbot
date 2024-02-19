#> whimc:barrelbot/editor/edit_wand/edit_mode/buttons/puzzle/toggle_size_editor
#   Toggles the size editor for the currently selected puzzle

scoreboard players operation $temp whimc.barrelbot.edit_instance_id = @s whimc.barrelbot.edit_instance_id
execute as @e[type=text_display,limit=1,tag=whimc.barrelbot.puzzle_manager,predicate=whimc:barrelbot/match_edit_id] on passengers at @s run function whimc:barrelbot/editor/toggle_edit_mode