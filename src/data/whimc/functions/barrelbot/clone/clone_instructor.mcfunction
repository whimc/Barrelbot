#> whimc:barrelbot/clone/clone_instructor

execute store result score $instructor_offset_x whimc.dummy run data get entity @s Pos[0]
execute store result score $instructor_offset_y whimc.dummy run data get entity @s Pos[1]
execute store result score $instructor_offset_z whimc.dummy run data get entity @s Pos[2]

execute store result storage whimc:macro Pos.x int 1 run scoreboard players operation $instructor_offset_x whimc.dummy -= $source_x whimc.dummy
execute store result storage whimc:macro Pos.y int 1 run scoreboard players operation $instructor_offset_y whimc.dummy -= $source_y whimc.dummy
execute store result storage whimc:macro Pos.z int 1 run scoreboard players operation $instructor_offset_z whimc.dummy -= $source_z whimc.dummy

data modify storage whimc:storage Items set from entity @s item.tag.Items

with storage whimc:macro Pos:
    $execute positioned ~$(x) ~$(y) ~$(z) run function whimc:barrelbot/clone/spawn_cloned_instructor







#############################################################################################
function ./spawn_cloned_instructor:
    execute rotated as @s rotated ~180 ~ run function whimc:barrelbot/block/instructor/initialize
    execute as @e[type=item_display,tag=whimc.instructor,limit=1,sort=nearest]:
        data modify block ~ ~ ~ Items set from storage whimc:storage Items
        function whimc:barrelbot/no_smuggle/define_items
        data modify entity @s item.tag.Items set from storage whimc:storage Items