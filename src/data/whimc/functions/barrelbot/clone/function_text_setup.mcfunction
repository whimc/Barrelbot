#> whimc:barrelbot/clone/function_text_setup
#   Sets up a cloned text display for functions

tag @s add whimc.barrelbot.function_text
data merge entity @s {billboard:"center"}
data modify entity @s text set from storage whimc:storage text_display