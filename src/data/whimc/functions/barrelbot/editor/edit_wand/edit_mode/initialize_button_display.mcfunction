#> whimc:barrelbot/editor/edit_wand/edit_mode/initialize_button_display
#   Sets up the displays used for the edit wand buttons

scoreboard players operation @s whimc.barrelbot.edit_instance_id = $temp whimc.barrelbot.edit_instance_id
tag @s add whimc.edit_button_display
tag @s add whimc.edit_button_display.needs_animated

tp @s ~ ~ ~ ~ ~
item replace entity @s container.0 with red_stained_glass_pane
data modify entity @s item merge from storage whimc:storage Buttons[0].item

data merge entity @s {transformation:{scale:[0.0f,0.0f,0.0001f]},teleport_duration:0,interpolation_duration:0}

#Load position and size of button into scores to be applied later
execute store result score $x whimc.dummy run data get storage whimc:storage Buttons[0].x_min
execute store result score $x2 whimc.dummy run data get storage whimc:storage Buttons[0].x_max
scoreboard players operation $scale whimc.dummy = $x2 whimc.dummy
scoreboard players operation $scale whimc.dummy -= $x whimc.dummy
scoreboard players operation $x whimc.dummy += $x2 whimc.dummy

execute store result score $y whimc.dummy run data get storage whimc:storage Buttons[0].y_min
execute store result score $y2 whimc.dummy run data get storage whimc:storage Buttons[0].y_max
scoreboard players operation $y whimc.dummy += $y2 whimc.dummy

scoreboard players operation @s whimc.barrelbot.ui.stored_scale = $scale whimc.dummy 
scoreboard players operation @s whimc.barrelbot.ui.stored_x = $x whimc.dummy 
scoreboard players operation @s whimc.barrelbot.ui.stored_y = $y whimc.dummy 

schedule function whimc:barrelbot/editor/edit_wand/edit_mode/scheduled_button_animation 2t append
