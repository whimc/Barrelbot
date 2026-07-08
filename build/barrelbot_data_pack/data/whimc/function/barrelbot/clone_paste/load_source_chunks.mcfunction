scoreboard players operation $dest_min_x whimc.dummy = $real_min_x whimc.dummy
scoreboard players operation $dest_min_z whimc.dummy = $real_min_z whimc.dummy
scoreboard players operation $dest_max_x whimc.dummy = $real_max_x whimc.dummy
scoreboard players operation $dest_max_z whimc.dummy = $real_max_z whimc.dummy
scoreboard players operation $block_x whimc.dummy = $dest_min_x whimc.dummy
scoreboard players operation $block_z whimc.dummy = $dest_min_z whimc.dummy
function whimc:barrelbot/puzzle_instance/block_to_chunk
scoreboard players operation $source_chunk_min_x whimc.dummy = $chunk_x whimc.dummy
scoreboard players operation $source_chunk_min_z whimc.dummy = $chunk_z whimc.dummy
scoreboard players operation $block_x whimc.dummy = $dest_max_x whimc.dummy
scoreboard players operation $block_z whimc.dummy = $dest_max_z whimc.dummy
function whimc:barrelbot/puzzle_instance/block_to_chunk
scoreboard players operation $source_chunk_max_x whimc.dummy = $chunk_x whimc.dummy
scoreboard players operation $source_chunk_max_z whimc.dummy = $chunk_z whimc.dummy
execute store result storage whimc:macro region.x1 int 1 run scoreboard players get $source_chunk_min_x whimc.dummy
execute store result storage whimc:macro region.z1 int 1 run scoreboard players get $source_chunk_min_z whimc.dummy
execute store result storage whimc:macro region.x2 int 1 run scoreboard players get $source_chunk_max_x whimc.dummy
execute store result storage whimc:macro region.z2 int 1 run scoreboard players get $source_chunk_max_z whimc.dummy
execute as @a[tag=whimc.queue_initiator, limit=1] at @s run function whimc:barrelbot/puzzle_instance/forceload_add_region with storage whimc:macro region
scoreboard players set $source_forceload_active whimc.dummy 1
