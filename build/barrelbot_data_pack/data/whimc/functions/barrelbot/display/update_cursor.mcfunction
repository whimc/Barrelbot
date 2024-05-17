execute store result score $slot whimc.dummy run data get storage whimc:storage marker_data.stack[-1].step
execute if score $slot whimc.dummy matches 0 unless data storage whimc:storage marker_data.stack[] run return 0
scoreboard players operation $x whimc.dummy = $slot whimc.dummy
scoreboard players operation $x whimc.dummy %= #DISPLAY_WIDTH whimc.const
scoreboard players operation $y whimc.dummy = $slot whimc.dummy
scoreboard players operation $y whimc.dummy /= #DISPLAY_WIDTH whimc.const
scoreboard players remove $x whimc.dummy 4
scoreboard players remove $y whimc.dummy 1
execute store result entity @s transformation.translation[0] float 0.228 run scoreboard players get $x whimc.dummy
execute store result entity @s transformation.translation[1] float -0.225 run scoreboard players get $y whimc.dummy
data merge entity @s {interpolation_duration: 2, start_interpolation: 0}
