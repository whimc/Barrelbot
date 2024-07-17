scoreboard players set $ray_length whimc.dummy 3
scoreboard players set $ice_found whimc.dummy 0
execute positioned ^ ^ ^1 run function whimc:instructions/scan
execute if score $ice_found whimc.dummy matches 1 run function whimc:instructions/pickup_ice
