#> whimc:barrelbot/dev/toggle_edit_mode
#   Toggles edit mode for the nearest puzzle

execute as @e[type=text_display,limit=1,tag=whimc.barrelbot.puzzle_manager,sort=nearest] on passengers at @s run function whimc:barrelbot/editor/toggle_edit_mode