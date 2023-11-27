#> whimc:barrelbot/clone/clone_function
#   Clones a function box

data modify storage whimc:storage function_id set from entity @s data.id
execute at @s positioned ~ ~1 ~ run data modify storage whimc:storage display_item set from entity @e[type=item_display,limit=1,sort=nearest] item 

execute store result score $bot_offset_x whimc.dummy run data get entity @s Pos[0]
execute store result score $bot_offset_y whimc.dummy run data get entity @s Pos[1]
execute store result score $bot_offset_z whimc.dummy run data get entity @s Pos[2]

execute store result storage whimc:macro Pos.x int 1 run scoreboard players operation $bot_offset_x whimc.dummy -= $source_x whimc.dummy
execute store result storage whimc:macro Pos.y int 1 run scoreboard players operation $bot_offset_y whimc.dummy -= $source_y whimc.dummy
execute store result storage whimc:macro Pos.z int 1 run scoreboard players operation $bot_offset_z whimc.dummy -= $source_z whimc.dummy

execute rotated as @s run function whimc:barrelbot/clone/position_function_clone with storage whimc:macro Pos