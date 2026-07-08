execute align xyz as @e[type=item_display, tag=whimc.barrelbot, dx=0, dy=0, dz=0, tag=!whimc.barrelbot.short_circuited] at @s run function whimc:instructions/recurse/nested_execute_0
particle dust_color_transition{from_color:[0.95,0.2,0.1],to_color:[1,0.6,0.6],scale:1} ^ ^ ^-0.4 0.05 0.05 0.05 0 3
particle dust_color_transition{from_color:[0.95,0.2,0.1],to_color:[1,0.6,0.6],scale:1} ^ ^ ^-0.2 0.05 0.05 0.05 0 3
particle dust_color_transition{from_color:[0.95,0.2,0.1],to_color:[1,0.6,0.6],scale:1} ^ ^ ^ 0.05 0.05 0.05 0 3
particle dust_color_transition{from_color:[0.95,0.2,0.1],to_color:[1,0.6,0.6],scale:1} ^ ^ ^0.2 0.05 0.05 0.05 0 3
particle dust_color_transition{from_color:[0.95,0.2,0.1],to_color:[1,0.6,0.6],scale:1} ^ ^ ^0.4 0.05 0.05 0.05 0 3
scoreboard players remove $steps whimc.dummy 1
execute if score $steps whimc.dummy matches 1.. positioned ^ ^ ^1 if block ~ ~ ~ #whimc:death_rayable run function whimc:instructions/recurse
