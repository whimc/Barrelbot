function whimc:barrelbot/manager/get_dimensions
scoreboard players operation $temp whimc.barrelbot.puzzle_id = @s whimc.barrelbot.puzzle_id
scoreboard players operation $temp whimc.barrelbot.puzzle_type_id = @s whimc.barrelbot.puzzle_type_id
with storage whimc:macro Pos:
    $execute as @e[type=minecraft:item_display,tag=whimc.instructor,x=$(min_x),y=$(min_y),z=$(min_z),dx=$(vol_x),dy=$(vol_y),dz=$(vol_z)] at @s run function whimc:barrelbot/block/instructor/link_to_puzzle