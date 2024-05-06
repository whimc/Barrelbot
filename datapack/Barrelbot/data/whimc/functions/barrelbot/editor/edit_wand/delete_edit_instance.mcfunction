#> whimc:barrelbot/editor/edit_wand/delete_edit_instance
#   Deletes an edit instance

execute on passengers run kill @s[type=!player]

scoreboard players operation $temp whimc.barrelbot.edit_instance_id = @s whimc.barrelbot.edit_instance_id
kill @e[type=item_display,tag=whimc.edit_button_display,predicate=whimc:barrelbot/match_edit_id]
execute as @e[type=text_display,tag=whimc.edit_text_display,predicate=whimc:barrelbot/match_edit_id] on passengers run kill @s
kill @e[type=text_display,tag=whimc.edit_text_display,predicate=whimc:barrelbot/match_edit_id]

kill @s