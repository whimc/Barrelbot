execute on passengers run data modify storage whimc:storage clone.success_function set from entity @s data.success_function
execute store result score $source_x whimc.dummy run data get entity @s Pos[0]
execute store result score $source_y whimc.dummy run data get entity @s Pos[1]
execute store result score $source_z whimc.dummy run data get entity @s Pos[2]
scoreboard players operation $temp whimc.barrelbot.puzzle_type_id = @s whimc.barrelbot.puzzle_type_id
execute store result score $source_puzzle_id whimc.dummy run scoreboard players get @s whimc.barrelbot.puzzle_id
function whimc:barrelbot/manager/get_dimensions
