#> whimc:barrelbot/editor/edit_wand/edit_mode/animate_button
#   Makes the button kinda pop into place so it doesn't look so weird

data merge entity @s {interpolation_duration:3,start_interpolation:0}

execute store result entity @s transformation.scale[0] float 0.001 run scoreboard players get @s whimc.barrelbot.ui.stored_scale
execute store result entity @s transformation.scale[1] float 0.001 run scoreboard players get @s whimc.barrelbot.ui.stored_scale

#Note: scale factor 1000, divide by 2 because I'm taking the average of the 2 positions
execute store result entity @s transformation.translation[0] float 0.0005 run scoreboard players get @s whimc.barrelbot.ui.stored_x
execute store result entity @s transformation.translation[1] float 0.0005 run scoreboard players get @s whimc.barrelbot.ui.stored_y
