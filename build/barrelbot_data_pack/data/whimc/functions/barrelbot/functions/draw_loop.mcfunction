$particle dust 0.2 0.7 1.0 2 ^ ^ ^$(r) 0 0 0 0 1 force
scoreboard players operation $angle whimc.dummy += $theta whimc.dummy
$execute if score $angle whimc.dummy matches -90000..90000 rotated ~ ~$(theta) run function whimc:barrelbot/functions/draw_loop with storage whimc:macro
