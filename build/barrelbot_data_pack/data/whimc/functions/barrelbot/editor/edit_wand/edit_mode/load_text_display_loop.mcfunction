execute summon text_display run function whimc:barrelbot/editor/edit_wand/edit_mode/initialize_text_display
data remove storage whimc:storage Text[0]
scoreboard players remove $displays whimc.dummy 1
execute if score $displays whimc.dummy matches 1.. run function whimc:barrelbot/editor/edit_wand/edit_mode/load_button_display_loop
