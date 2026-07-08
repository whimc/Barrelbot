execute store result storage whimc:macro instance.id int 1 run scoreboard players get @s whimc.barrelbot.puzzle_id
execute store result storage whimc:macro instance.type int 1 run scoreboard players get @s whimc.barrelbot.puzzle_type_id
execute store result storage whimc:macro instance.x int 1 run data get entity @s Pos[0]
execute store result storage whimc:macro instance.y int 1 run data get entity @s Pos[1]
execute store result storage whimc:macro instance.z int 1 run data get entity @s Pos[2]
function whimc:barrelbot/puzzle_instance/register_with_macro with storage whimc:macro instance
