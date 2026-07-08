scoreboard players set $step_out whimc.dummy 1
data modify storage whimc:storage marker_data.stack[-2].step set from storage whimc:storage marker_data.stack[-1].step
data remove storage whimc:storage marker_data.stack[-1]
execute store success score $in_loop whimc.dummy if data storage whimc:storage marker_data.stack[-1].loop
execute if score $in_loop whimc.dummy matches 0 run function whimc:barrelbot/functions/iterate
execute if score $in_loop whimc.dummy matches 1 run function whimc:barrelbot/instructions/loop/iterate
