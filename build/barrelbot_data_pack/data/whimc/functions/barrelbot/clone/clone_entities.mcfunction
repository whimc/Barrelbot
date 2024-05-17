$execute as @e[type=minecraft:item_display,tag=whimc.barrelbot,x=$(min_x),y=$(min_y),z=$(min_z),dx=$(vol_x),dy=$(vol_y),dz=$(vol_z)] run function whimc:barrelbot/clone/clone_bot
$execute as @e[type=minecraft:marker,tag=whimc.barrelbot.function,x=$(min_x),y=$(min_y),z=$(min_z),dx=$(vol_x),dy=$(vol_y),dz=$(vol_z)] run function whimc:barrelbot/clone/clone_function
