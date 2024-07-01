# Refreshes the ID of every puzzle

function whimc:barrelbot/dev/reset_all_puzzles

execute as @e[type=text_display] at @s:
    scoreboard players add $global whimc.barrelbot.puzzle_id 1
    scoreboard players operation @s whimc.barrelbot.puzzle_id = $global whimc.barrelbot.puzzle_id
    execute on passengers as @s[type=marker] run scoreboard players operation @s whimc.barrelbot.puzzle_id = $global whimc.barrelbot.puzzle_id

    function whimc:barrelbot/manager/get_dimensions
    with storage whimc:macro Pos:
        $execute as @e[type=minecraft:item_display,tag=whimc.instructor,x=$(min_x),y=$(min_y),z=$(min_z),dx=$(vol_x),dy=$(vol_y),dz=$(vol_z)] at @s run function whimc:barrelbot/block/instructor/get_linked_puzzle
        $execute as @e[type=minecraft:item_display,tag=whimc.instructor,x=$(min_x),y=$(min_y),z=$(min_z),dx=$(vol_x),dy=$(vol_y),dz=$(vol_z)] at @s run function whimc:barrelbot/no_smuggle/define_items
        

