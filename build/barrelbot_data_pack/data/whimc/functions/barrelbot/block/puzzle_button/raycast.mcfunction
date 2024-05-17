execute if block ~ ~ ~ stone_button align xyz positioned ~0.5 ~0.5 ~0.5 run function whimc:barrelbot/block/puzzle_button/initialize
scoreboard players remove $raycast whimc.dummy 1
execute if score $raycast whimc.dummy matches 1.. positioned ^ ^ ^0.1 run function whimc:barrelbot/block/puzzle_button/raycast
