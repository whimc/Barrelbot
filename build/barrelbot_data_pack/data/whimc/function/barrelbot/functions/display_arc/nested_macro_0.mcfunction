$execute positioned ^ ^-$(shift) ^ facing $(x1) $(y1) $(z1) rotated ~ 0 run summon marker ^ ^ ^1 {Tags:["whimc.temp"]}
$execute positioned ^ ^-$(shift) ^ facing $(x2) $(y2) $(z2) rotated ~ 0 positioned ^ ^ ^1 unless entity @e[type=marker,tag=whimc.temp,distance=..1] run scoreboard players operation $theta whimc.dummy *= #-1 whimc.const
kill @e[type=marker, limit=1, tag=whimc.temp]
execute store result storage whimc:macro theta double 0.001 run scoreboard players get $theta whimc.dummy
$execute positioned ^ ^-$(shift) ^ facing $(x1) $(y1) $(z1) run function whimc:barrelbot/functions/draw_loop with storage whimc:macro
