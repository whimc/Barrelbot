particle electric_spark ^ ^-0.1 ^
particle dust 0.906 0.863 0.471 0.6 ^ ^-0.1 ^ 0.1 0.1 0.1 0 1 force
execute align xyz run function whimc:barrelbot/editor/edit_wand/raycast_check
scoreboard players remove #raycast_length whimc.dummy 1
execute if score #raycast_length whimc.dummy matches 1.. if score #success whimc.dummy matches 0 if block ~ ~ ~ #whimc:air positioned ^ ^ ^0.2 run function whimc:barrelbot/editor/edit_wand/raycast
