execute unless block ~ ~ ~ #whimc:air unless block ~ ~ ~ #whimc:mineable_ice run return 0
particle dust_color_transition 0.4 0.8 1.0 1.8 0.3 0.4 0.7 ^ ^ ^-0.4 0.05 0.05 0.05 0 3
particle dust_color_transition 0.4 0.8 1.0 1.8 0.3 0.4 0.7 ^ ^ ^-0.2 0.05 0.05 0.05 0 3
particle dust_color_transition 0.4 0.8 1.0 1.8 0.3 0.4 0.7 ^ ^ ^ 0.05 0.05 0.05 0 3
particle dust_color_transition 0.4 0.8 1.0 1.8 0.3 0.4 0.7 ^ ^ ^0.2 0.05 0.05 0.05 0 3
particle dust_color_transition 0.4 0.8 1.0 1.8 0.3 0.4 0.7 ^ ^ ^0.4 0.05 0.05 0.05 0 3
execute if block ~ ~ ~ #whimc:mineable_ice run function whimc:instructions/scan/nested_execute_1
scoreboard players remove $ray_length whimc.dummy 1
execute if score $ray_length whimc.dummy matches 1.. positioned ^ ^ ^1 run function whimc:instructions/scan
