execute if score $cascade_ix whimc.dummy >= $temp whimc.barrelbot.cascade.x run return 0
scoreboard players set $cascade_iz whimc.dummy 0
function whimc:barrelbot/clone_paste/build_cascade_loop_z
scoreboard players add $cascade_ix whimc.dummy 1
function whimc:barrelbot/clone_paste/build_cascade_loop_x
