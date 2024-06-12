## Resets the individual puzzle running the function

# Stop the puzzle if it's running
execute as @s[tag=whimc.barrelbot.puzzle_manager.active] at @s run function whimc:barrelbot/manager/stop_execution

# Reset all instructors in the area
function whimc:barrelbot/manager/get_dimensions
with storage whimc:macro Pos:
    $execute as @e[type=minecraft:item_display,tag=whimc.instructor,x=$(min_x),y=$(min_y),z=$(min_z),dx=$(vol_x),dy=$(vol_y),dz=$(vol_z)] at @s run data modify block ~ ~ ~ Items set from entity @s item.tag.Items
    $execute as @e[type=minecraft:item_display,tag=whimc.barrelbot,x=$(min_x),y=$(min_y),z=$(min_z),dx=$(vol_x),dy=$(vol_y),dz=$(vol_z)] at @s run data modify block ~ ~ ~ Items set value []
    $execute as @e[type=minecraft:marker,tag=whimc.barrelbot.function,x=$(min_x),y=$(min_y),z=$(min_z),dx=$(vol_x),dy=$(vol_y),dz=$(vol_z)] at @s run data modify block ~ ~ ~ Items set value []