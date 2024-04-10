#> whimc:barrelbot/editor/edit_wand/edit_mode/find_clicked_button_loop
#   Iterates through buttons to see if the clicked coordinates correspond with it

#Get button coords into a score
execute store result score $x_min whimc.dummy run data get storage whimc:storage Buttons[0].x_min
execute store result score $x_max whimc.dummy run data get storage whimc:storage Buttons[0].x_max

execute store result score $y_min whimc.dummy run data get storage whimc:storage Buttons[0].y_min
execute store result score $y_max whimc.dummy run data get storage whimc:storage Buttons[0].y_max

#Perform the check
execute if score $x_min whimc.dummy <= #u_proj whimc.dummy if score $x_max whimc.dummy >= #u_proj whimc.dummy if score $y_min whimc.dummy <= #v_proj whimc.dummy if score $y_max whimc.dummy >= #v_proj whimc.dummy run function whimc:barrelbot/editor/edit_wand/edit_mode/button_clicked

#Continue loop
data remove storage whimc:storage Buttons[0]
scoreboard players remove $buttons whimc.dummy 1
execute if score $buttons whimc.dummy matches 1.. if score $success whimc.dummy matches 0 run function whimc:barrelbot/editor/edit_wand/edit_mode/find_clicked_button_loop