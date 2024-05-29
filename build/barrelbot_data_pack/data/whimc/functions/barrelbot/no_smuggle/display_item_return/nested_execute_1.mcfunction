execute store result storage whimc:storage Pos[0] double 0.001 run scoreboard players get $midpoint.x whimc.dummy
execute store result storage whimc:storage Pos[1] double 0.001 run scoreboard players get $midpoint.y whimc.dummy
execute store result storage whimc:storage Pos[2] double 0.001 run scoreboard players get $midpoint.z whimc.dummy
data modify entity @s Pos set from storage whimc:storage Pos
execute facing entity @s feet positioned as @s run function whimc:barrelbot/no_smuggle/display_item_return/nested_execute_0
kill @s
