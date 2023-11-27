#> whimc:barrelbot/manager/scan_bounding_box

#Tell all barrel markers to grab the relevant block data (this reduces the number of block data serializations)
$execute as @e[type=minecraft:item_display,tag=whimc.barrelbot,x=$(min_x),y=$(min_y),z=$(min_z),dx=$(vol_x),dy=$(vol_y),dz=$(vol_z)] at @s run function whimc:barrelbot/bot/load_instructions_wrapper

#Load any linked functions
data modify storage whimc:storage functions set value []
$execute as @e[type=minecraft:item_display,tag=whimc.barrelbot,x=$(min_x),y=$(min_y),z=$(min_z),dx=$(vol_x),dy=$(vol_y),dz=$(vol_z)] at @s run function whimc:barrelbot/functions/load_function
