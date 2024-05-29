execute store result score $instructor_offset_x whimc.dummy run data get entity @s Pos[0]
execute store result score $instructor_offset_y whimc.dummy run data get entity @s Pos[1]
execute store result score $instructor_offset_z whimc.dummy run data get entity @s Pos[2]
execute store result storage whimc:macro Pos.x int 1 run scoreboard players operation $instructor_offset_x whimc.dummy -= $source_x whimc.dummy
execute store result storage whimc:macro Pos.y int 1 run scoreboard players operation $instructor_offset_y whimc.dummy -= $source_y whimc.dummy
execute store result storage whimc:macro Pos.z int 1 run scoreboard players operation $instructor_offset_z whimc.dummy -= $source_z whimc.dummy
data modify storage whimc:storage Items set from entity @s item.tag.Items
function whimc:barrelbot/clone/clone_instructor/nested_macro_0 with storage whimc:macro Pos
