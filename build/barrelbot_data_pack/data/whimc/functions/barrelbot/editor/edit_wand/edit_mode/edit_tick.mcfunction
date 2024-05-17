data remove storage whimc:storage ClickedButton
function whimc:barrelbot/editor/edit_wand/math/find_selected_button
title @s actionbar {"nbt": "ClickedButton.hover_text", "storage": "whimc:storage"}
execute unless predicate whimc:barrelbot/riding_edit_instance run function whimc:barrelbot/editor/edit_wand/edit_mode/edit_tick/nested_execute_0
scoreboard players operation $temp whimc.barrelbot.edit_instance_id = @s whimc.barrelbot.edit_instance_id
execute at @e[type=!player, predicate=whimc:barrelbot/match_edit_id, tag=whimc.edit_subject] align xyz run function whimc:barrelbot/editor/edit_wand/edit_mode/edit_tick/nested_execute_1
