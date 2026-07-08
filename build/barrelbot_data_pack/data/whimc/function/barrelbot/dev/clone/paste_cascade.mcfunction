tag @a remove whimc.queue_initiator
tag @s add whimc.queue_initiator
execute if score $propagate_active whimc.dummy matches 1 run function whimc:barrelbot/clone_paste/busy
execute if score $propagate_active whimc.dummy matches 1 run return 0
execute if score $clone_paste_active whimc.dummy matches 1 run function whimc:barrelbot/clone_paste/busy
execute if score $clone_paste_active whimc.dummy matches 1 run return 0
scoreboard players operation $temp whimc.barrelbot.puzzle_id = @s whimc.barrelbot.puzzle_id
execute if score @s whimc.barrelbot.cascade.x_spacing matches ..-1 run scoreboard players set @s whimc.barrelbot.cascade.x 0
execute if score @s whimc.barrelbot.cascade.z_spacing matches ..-1 run scoreboard players set @s whimc.barrelbot.cascade.z 0
scoreboard players operation $temp whimc.barrelbot.cascade.x = @s whimc.barrelbot.cascade.x
scoreboard players operation $temp whimc.barrelbot.cascade.z = @s whimc.barrelbot.cascade.z
scoreboard players operation $temp whimc.barrelbot.cascade.x_spacing = @s whimc.barrelbot.cascade.x_spacing
scoreboard players operation $temp whimc.barrelbot.cascade.z_spacing = @s whimc.barrelbot.cascade.z_spacing
execute unless entity @e[type=text_display, tag=whimc.barrelbot.puzzle_manager, predicate=whimc:barrelbot/match_id] run tellraw @s {"text": "Not bound to a puzzle!", "color": "red"}
execute unless entity @e[type=text_display, tag=whimc.barrelbot.puzzle_manager, predicate=whimc:barrelbot/match_id] run tag @s remove whimc.queue_initiator
execute unless entity @e[type=text_display, tag=whimc.barrelbot.puzzle_manager, predicate=whimc:barrelbot/match_id] run return 0
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
execute as @e[type=text_display, limit=1, predicate=whimc:barrelbot/match_id, tag=whimc.barrelbot.puzzle_manager] run function whimc:barrelbot/clone_paste/prepare_source
function whimc:barrelbot/clone_paste/build_cascade_queue
function whimc:barrelbot/clone_paste/start
