scoreboard players operation $temp whimc.barrelbot.puzzle_id = @s whimc.barrelbot.puzzle_id
execute store result storage whimc:macro Pos.x int 1 run scoreboard players get @s whimc.barrelbot.clone.x1
execute store result storage whimc:macro Pos.y int 1 run scoreboard players get @s whimc.barrelbot.clone.y1
execute store result storage whimc:macro Pos.z int 1 run scoreboard players get @s whimc.barrelbot.clone.z1
function whimc:barrelbot/clone/green_position_highlight with storage whimc:macro Pos
execute store result storage whimc:macro Pos.x int 1 run scoreboard players get @s whimc.barrelbot.clone.x2
function whimc:barrelbot/clone/position_highlight with storage whimc:macro Pos
execute store result storage whimc:macro Pos.y int 1 run scoreboard players get @s whimc.barrelbot.clone.y2
function whimc:barrelbot/clone/position_highlight with storage whimc:macro Pos
execute store result storage whimc:macro Pos.x int 1 run scoreboard players get @s whimc.barrelbot.clone.x1
function whimc:barrelbot/clone/position_highlight with storage whimc:macro Pos
execute store result storage whimc:macro Pos.z int 1 run scoreboard players get @s whimc.barrelbot.clone.z2
function whimc:barrelbot/clone/position_highlight with storage whimc:macro Pos
execute store result storage whimc:macro Pos.x int 1 run scoreboard players get @s whimc.barrelbot.clone.x2
function whimc:barrelbot/clone/red_position_highlight with storage whimc:macro Pos
execute store result storage whimc:macro Pos.y int 1 run scoreboard players get @s whimc.barrelbot.clone.y1
function whimc:barrelbot/clone/position_highlight with storage whimc:macro Pos
execute store result storage whimc:macro Pos.x int 1 run scoreboard players get @s whimc.barrelbot.clone.x1
function whimc:barrelbot/clone/position_highlight with storage whimc:macro Pos
