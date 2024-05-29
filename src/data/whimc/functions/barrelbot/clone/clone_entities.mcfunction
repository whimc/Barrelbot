#> whimc:barrelbot/clone/clone_entities
#   Clones all entities linked to this puzzle

#For each barrelbot, clone it
$execute as @e[type=minecraft:item_display,tag=whimc.barrelbot,x=$(min_x),y=$(min_y),z=$(min_z),dx=$(vol_x),dy=$(vol_y),dz=$(vol_z)] run function whimc:barrelbot/clone/clone_bot

#Clone each function
$execute as @e[type=minecraft:marker,tag=whimc.barrelbot.function,x=$(min_x),y=$(min_y),z=$(min_z),dx=$(vol_x),dy=$(vol_y),dz=$(vol_z)] run function whimc:barrelbot/clone/clone_function

#Clone instructors
$execute as @e[type=minecraft:item_display,tag=whimc.instructor,x=$(min_x),y=$(min_y),z=$(min_z),dx=$(vol_x),dy=$(vol_y),dz=$(vol_z)] run function whimc:barrelbot/clone/clone_instructor