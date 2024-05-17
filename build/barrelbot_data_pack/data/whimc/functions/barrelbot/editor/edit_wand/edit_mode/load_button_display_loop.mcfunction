execute summon item_display run function whimc:barrelbot/editor/edit_wand/edit_mode/initialize_button_display
data remove storage whimc:storage Buttons[0]
scoreboard players remove $buttons whimc.dummy 1
execute if score $buttons whimc.dummy matches 1.. run function whimc:barrelbot/editor/edit_wand/edit_mode/load_button_display_loop
