execute store result entity @s transformation.translation[2] float -0.2 run scoreboard players remove @s whimc.barrelbot.display_layer 1
data merge entity @s {interpolation_duration: 5, start_interpolation: 0}
execute if score @s whimc.barrelbot.display_layer matches ..-1 run kill @s
