scoreboard players operation $temp whimc.barrelbot.puzzle_id = @s whimc.barrelbot.puzzle_id
execute if score @s whimc.barrelbot.cascade.x_spacing matches ..-1 run scoreboard players set @s whimc.barrelbot.cascade.x 0
execute if score @s whimc.barrelbot.cascade.z_spacing matches ..-1 run scoreboard players set @s whimc.barrelbot.cascade.z 0
scoreboard players operation $temp whimc.barrelbot.cascade.x = @s whimc.barrelbot.cascade.x
scoreboard players operation $temp whimc.barrelbot.cascade.z = @s whimc.barrelbot.cascade.z
scoreboard players operation $temp whimc.barrelbot.cascade.x_spacing = @s whimc.barrelbot.cascade.x_spacing
scoreboard players operation $temp whimc.barrelbot.cascade.z_spacing = @s whimc.barrelbot.cascade.z_spacing
execute as @e[type=text_display, limit=1, predicate=whimc:barrelbot/match_id, tag=whimc.barrelbot.puzzle_manager] on passengers run data modify storage whimc:storage bounding_box set from entity @s data.bounding_box
execute store result score $jump_x whimc.dummy run data get storage whimc:storage bounding_box.max_x
execute store result score $min_x whimc.dummy run data get storage whimc:storage bounding_box.min_x
scoreboard players operation $jump_x whimc.dummy -= $min_x whimc.dummy
execute if score $jump_x whimc.dummy matches ..-1 run scoreboard players operation $jump_x whimc.dummy *= #-1 whimc.const
scoreboard players add $jump_x whimc.dummy 1
scoreboard players operation $jump_x whimc.dummy += $temp whimc.barrelbot.cascade.x_spacing
execute store result score $jump_z whimc.dummy run data get storage whimc:storage bounding_box.max_z
execute store result score $min_z whimc.dummy run data get storage whimc:storage bounding_box.min_z
scoreboard players operation $jump_z whimc.dummy -= $min_z whimc.dummy
execute if score $jump_z whimc.dummy matches ..-1 run scoreboard players operation $jump_z whimc.dummy *= #-1 whimc.const
scoreboard players add $jump_z whimc.dummy 1
scoreboard players operation $jump_z whimc.dummy += $temp whimc.barrelbot.cascade.z_spacing
execute if score $temp whimc.barrelbot.cascade.x matches ..-1 run scoreboard players operation $jump_x whimc.dummy *= #-1 whimc.const
execute if score $temp whimc.barrelbot.cascade.z matches ..-1 run scoreboard players operation $jump_z whimc.dummy *= #-1 whimc.const
execute if score $temp whimc.barrelbot.cascade.x matches ..-1 run scoreboard players operation $temp whimc.barrelbot.cascade.x *= #-1 whimc.const
execute if score $temp whimc.barrelbot.cascade.z matches ..-1 run scoreboard players operation $temp whimc.barrelbot.cascade.z *= #-1 whimc.const
execute store result storage whimc:macro jump.x int 1 run scoreboard players get $jump_x whimc.dummy
execute store result storage whimc:macro jump.z int 1 run scoreboard players get $jump_z whimc.dummy
scoreboard players operation $x_iter whimc.dummy = $temp whimc.barrelbot.cascade.x
execute as @e[type=text_display, limit=1, predicate=whimc:barrelbot/match_id, tag=whimc.barrelbot.puzzle_manager] at @s run function whimc:barrelbot/clone/cascade/iterate_x_wrapper with storage whimc:macro jump
