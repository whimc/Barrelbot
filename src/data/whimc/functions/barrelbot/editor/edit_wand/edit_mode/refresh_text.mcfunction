#> whimc:barrelbot/editor/edit_wand/edit_mode/refresh_text
#   Refreshes all linked text displays

#Can be called either from player or root entity

scoreboard players operation $temp whimc.barrelbot.edit_instance_id = @s whimc.barrelbot.edit_instance_id

execute as @e[type=text_display,tag=whimc.edit_text_display,predicate=whimc:barrelbot/match_edit_id]:
    data modify storage whimc:storage text set value ""
    execute on passengers run data modify storage whimc:storage text set from entity @s data.text
    data modify entity @s text set from storage whimc:storage text