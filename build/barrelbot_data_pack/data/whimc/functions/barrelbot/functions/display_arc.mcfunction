scoreboard players operation $midpoint.x whimc.dummy = $x1 whimc.dummy
scoreboard players operation $midpoint.y whimc.dummy = $y1 whimc.dummy
scoreboard players operation $midpoint.z whimc.dummy = $z1 whimc.dummy
scoreboard players operation $midpoint.x whimc.dummy += $x2 whimc.dummy
scoreboard players operation $midpoint.y whimc.dummy += $y2 whimc.dummy
scoreboard players operation $midpoint.z whimc.dummy += $z2 whimc.dummy
scoreboard players operation $midpoint.x whimc.dummy /= #2 whimc.const
scoreboard players operation $midpoint.y whimc.dummy /= #2 whimc.const
scoreboard players operation $midpoint.z whimc.dummy /= #2 whimc.const
data modify storage whimc:storage transformation set value [0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 1.0f]
scoreboard players operation $i0 bolt.expr.temp = $x2 whimc.dummy
execute store result storage whimc:storage transformation[0] float 1 run scoreboard players operation $i0 bolt.expr.temp -= $x1 whimc.dummy
scoreboard players operation $i0 bolt.expr.temp = $y2 whimc.dummy
execute store result storage whimc:storage transformation[4] float 1 run scoreboard players operation $i0 bolt.expr.temp -= $y1 whimc.dummy
scoreboard players operation $i0 bolt.expr.temp = $z2 whimc.dummy
execute store result storage whimc:storage transformation[8] float 1 run scoreboard players operation $i0 bolt.expr.temp -= $z1 whimc.dummy
data modify entity 75b73c9e-10c7-4756-83e4-a5c67cdbf496 transformation set from storage whimc:storage transformation
execute store result score $d whimc.dummy run data get entity 75b73c9e-10c7-4756-83e4-a5c67cdbf496 transformation.scale[0]
scoreboard players operation $r whimc.dummy = $d whimc.dummy
scoreboard players operation $r whimc.dummy *= $707 bolt.expr.const
scoreboard players operation $r whimc.dummy /= $1000 bolt.expr.const
scoreboard players set $theta whimc.dummy 28647895
scoreboard players operation $theta whimc.dummy /= $r whimc.dummy
execute store result storage whimc:macro start_x double 0.001 run scoreboard players get $x1 whimc.dummy
execute store result storage whimc:macro start_y double 0.001 run scoreboard players get $y1 whimc.dummy
execute store result storage whimc:macro start_z double 0.001 run scoreboard players get $z1 whimc.dummy
execute summon marker run function whimc:barrelbot/functions/display_arc/nested_macro_1 with storage whimc:macro
