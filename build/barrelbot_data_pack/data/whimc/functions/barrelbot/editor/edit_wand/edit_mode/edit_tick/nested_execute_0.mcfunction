tag @s remove whimc.in_edit_menu
title @s actionbar ""
execute as @e[type=item_display, tag=whimc.editor_base, predicate=!whimc:has_riding_player] run function whimc:barrelbot/editor/edit_wand/delete_edit_instance
