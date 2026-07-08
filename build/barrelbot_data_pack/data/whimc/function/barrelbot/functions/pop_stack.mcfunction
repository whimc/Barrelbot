scoreboard players set $step_out whimc.dummy 1
data remove storage whimc:storage marker_data.stack[-1]
execute unless data storage whimc:storage marker_data.stack[] run return 0
execute store success score $in_loop whimc.dummy if data storage whimc:storage marker_data.stack[-1].loop
scoreboard players add @s whimc.barrelbot.push_count 1
function whimc:barrelbot/functions/iterate
