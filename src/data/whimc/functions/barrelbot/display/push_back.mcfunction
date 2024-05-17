#> whimc:barrelbot/display/push_back

execute store result entity @s transformation.translation[2] float -0.2 run scoreboard players add @s whimc.barrelbot.display_layer 1
data merge entity @s {interpolation_duration:5,start_interpolation:0}