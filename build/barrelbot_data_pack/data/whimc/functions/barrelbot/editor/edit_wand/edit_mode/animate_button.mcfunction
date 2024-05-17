data merge entity @s {interpolation_duration: 3, start_interpolation: 0}
execute store result entity @s transformation.scale[0] float 0.001 run scoreboard players get @s whimc.barrelbot.ui.stored_scale
execute store result entity @s transformation.scale[1] float 0.001 run scoreboard players get @s whimc.barrelbot.ui.stored_scale
execute store result entity @s transformation.translation[0] float 0.0005 run scoreboard players get @s whimc.barrelbot.ui.stored_x
execute store result entity @s transformation.translation[1] float 0.0005 run scoreboard players get @s whimc.barrelbot.ui.stored_y
