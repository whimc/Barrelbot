#> whimc:barrelbot/editor/edit_wand/edit_mode/button_clicked
#   Outputs data when a button is successfully clicked

data modify storage whimc:storage ClickedButton set from storage whimc:storage Buttons[0]
scoreboard players set $success whimc.dummy 1