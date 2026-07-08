$particle end_rod ^ ^ ^$(r) 0 0 0 0 1 force
scoreboard players operation $angle whimc.dummy += $theta whimc.dummy
$execute if score $angle whimc.dummy matches -90000..90000 rotated ~ ~$(theta) run function whimc:barrelbot/no_smuggle/draw_loop with storage whimc:macro
