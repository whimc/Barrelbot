execute on passengers as @s[type=marker] run data modify storage whimc:storage marker_data set from entity @s data
execute store result score $is_dispenser whimc.dummy if entity @s[tag=whimc.dispenser_bot]
data modify storage whimc:storage bot_temp_data.Tags set from entity @s Tags
execute store result score $bot_offset_x whimc.dummy run data get entity @s Pos[0]
execute store result score $bot_offset_y whimc.dummy run data get entity @s Pos[1]
execute store result score $bot_offset_z whimc.dummy run data get entity @s Pos[2]
execute store result storage whimc:macro Pos.x int 1 run scoreboard players operation $bot_offset_x whimc.dummy -= $source_x whimc.dummy
execute store result storage whimc:macro Pos.y int 1 run scoreboard players operation $bot_offset_y whimc.dummy -= $source_y whimc.dummy
execute store result storage whimc:macro Pos.z int 1 run scoreboard players operation $bot_offset_z whimc.dummy -= $source_z whimc.dummy
execute rotated as @s rotated ~180 ~ run function whimc:barrelbot/clone/position_bot_clone with storage whimc:macro Pos
