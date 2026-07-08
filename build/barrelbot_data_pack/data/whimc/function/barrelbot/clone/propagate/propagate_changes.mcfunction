execute if score $clone_paste_active whimc.dummy matches 1 run tellraw @a[tag=whimc.queue_initiator] ["", {"text": "[Barrelbot] ", "color": "gold", "bold": true}, {"text": "A paste operation is already running. Wait for it to finish.", "color": "red"}]
execute if score $clone_paste_active whimc.dummy matches 1 run tag @a remove whimc.queue_initiator
execute if score $clone_paste_active whimc.dummy matches 1 run return 0
execute on passengers run data modify storage whimc:storage clone.success_function set from entity @s data.success_function
execute store result score $source_x whimc.dummy run data get entity @s Pos[0]
execute store result score $source_y whimc.dummy run data get entity @s Pos[1]
execute store result score $source_z whimc.dummy run data get entity @s Pos[2]
execute on passengers run data modify storage whimc:storage bounding_box set from entity @s data.bounding_box
execute store result score $max_x whimc.dummy run data get storage whimc:storage bounding_box.max_x
execute store result score $max_y whimc.dummy run data get storage whimc:storage bounding_box.max_y
execute store result score $max_z whimc.dummy run data get storage whimc:storage bounding_box.max_z
execute store result score $min_x whimc.dummy run data get storage whimc:storage bounding_box.min_x
execute store result score $min_y whimc.dummy run data get storage whimc:storage bounding_box.min_y
execute store result score $min_z whimc.dummy run data get storage whimc:storage bounding_box.min_z
scoreboard players operation $base_max_x whimc.dummy = $max_x whimc.dummy
scoreboard players operation $base_max_y whimc.dummy = $max_y whimc.dummy
scoreboard players operation $base_max_z whimc.dummy = $max_z whimc.dummy
scoreboard players operation $base_min_x whimc.dummy = $min_x whimc.dummy
scoreboard players operation $base_min_y whimc.dummy = $min_y whimc.dummy
scoreboard players operation $base_min_z whimc.dummy = $min_z whimc.dummy
scoreboard players operation $temp whimc.barrelbot.puzzle_type_id = @s whimc.barrelbot.puzzle_type_id
execute store result score $source_puzzle_id whimc.dummy run scoreboard players get @s whimc.barrelbot.puzzle_id
function whimc:barrelbot/manager/get_dimensions
scoreboard players operation $min_source_x whimc.dummy = $real_min_x whimc.dummy
scoreboard players operation $min_source_y whimc.dummy = $real_min_y whimc.dummy
scoreboard players operation $min_source_z whimc.dummy = $real_min_z whimc.dummy
scoreboard players operation $max_source_x whimc.dummy = $real_max_x whimc.dummy
scoreboard players operation $max_source_y whimc.dummy = $real_max_y whimc.dummy
scoreboard players operation $max_source_z whimc.dummy = $real_max_z whimc.dummy
scoreboard players operation $vol_x whimc.dummy = $size_x whimc.dummy
scoreboard players operation $vol_y whimc.dummy = $size_y whimc.dummy
scoreboard players operation $vol_z whimc.dummy = $size_z whimc.dummy
data modify storage whimc:macro Pos2 set from storage whimc:macro Pos
function whimc:barrelbot/puzzle_instance/build_propagate_queue
execute store result score $propagate_count whimc.dummy if data storage whimc:storage propagate_queue[]
execute if score $propagate_count whimc.dummy matches 0 run tellraw @a[tag=whimc.queue_initiator] ["", {"text": "[Barrelbot] ", "color": "gold", "bold": true}, {"text": "No other puzzle copies are registered for this puzzle type.", "color": "yellow"}]
execute if score $propagate_count whimc.dummy matches 0 run tag @a remove whimc.queue_initiator
execute if score $propagate_count whimc.dummy matches 0 run return 0
tellraw @a[tag=whimc.queue_initiator] ["", {"text": "[Barrelbot] ", "color": "gold", "bold": true}, {"text": "Propagating changes to ", "color": "white"}, {"score": {"name": "$propagate_count", "objective": "whimc.dummy"}, "color": "aqua"}, {"text": " puzzle copy/copies (loading chunks as needed)...", "color": "white"}]
scoreboard players set $propagate_active whimc.dummy 1
scoreboard players set $propagate_loading whimc.dummy 0
scoreboard players set $propagate_wait whimc.dummy 0
