execute store result score $block_x whimc.dummy run data get storage whimc:storage propagate_queue[0].x
execute store result score $block_z whimc.dummy run data get storage whimc:storage propagate_queue[0].z
function whimc:barrelbot/puzzle_instance/block_to_chunk
execute store result storage whimc:macro chunk.x int 1 run scoreboard players get $chunk_x whimc.dummy
execute store result storage whimc:macro chunk.z int 1 run scoreboard players get $chunk_z whimc.dummy
execute as @a[tag=whimc.queue_initiator, limit=1] at @s run function whimc:barrelbot/puzzle_instance/forceload_add with storage whimc:macro chunk
scoreboard players set $propagate_wait whimc.dummy 20
scoreboard players set $propagate_loading whimc.dummy 1
