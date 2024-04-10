advancement revoke @s only whimc:interact/right_click_editor
function whimc:barrelbot/editor/edit_wand/math/find_selected_button
execute if score $success whimc.dummy matches 1 run playsound minecraft:ui.button.click master @s ~ ~ ~ 0.3 1
execute if score $success whimc.dummy matches 1 if data storage whimc:storage ClickedButton.command run function whimc:barrelbot/editor/edit_wand/edit_mode/execute_button_action with storage whimc:storage ClickedButton
execute if score $success whimc.dummy matches 1 if data storage whimc:storage ClickedButton.page run function whimc:barrelbot/editor/edit_wand/edit_mode/change_page
