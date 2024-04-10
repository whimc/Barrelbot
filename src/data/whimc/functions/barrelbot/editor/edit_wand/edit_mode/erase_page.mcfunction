#> whimc:barrelbot/editor/edit_wand/edit_mode/erase_page
#   Wipes out the current page to make way for a new one

scoreboard players operation $temp whimc.barrelbot.edit_instance_id = @s whimc.barrelbot.edit_instance_id
kill @e[type=item_display,tag=whimc.edit_button_display,predicate=whimc:barrelbot/match_edit_id]
execute as @e[type=text_display,tag=whimc.edit_text_display,predicate=whimc:barrelbot/match_edit_id] on passengers run kill @s
kill @e[type=text_display,tag=whimc.edit_text_display,predicate=whimc:barrelbot/match_edit_id]