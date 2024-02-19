#> whimc:barrelbot/editor/edit_wand/edit_mode/refresh_text_display
#   Refreshes an individual text display

data modify storage whimc:storage text set value ""
execute on passengers run data modify storage whimc:storage text set from entity @s data.text
data modify entity @s text set from storage whimc:storage text