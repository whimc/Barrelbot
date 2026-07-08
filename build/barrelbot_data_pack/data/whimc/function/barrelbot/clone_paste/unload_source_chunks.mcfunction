execute unless score $source_forceload_active whimc.dummy matches 1 run return 0
execute store result storage whimc:macro region.x1 int 1 run scoreboard players get $source_chunk_min_x whimc.dummy
execute store result storage whimc:macro region.z1 int 1 run scoreboard players get $source_chunk_min_z whimc.dummy
execute store result storage whimc:macro region.x2 int 1 run scoreboard players get $source_chunk_max_x whimc.dummy
execute store result storage whimc:macro region.z2 int 1 run scoreboard players get $source_chunk_max_z whimc.dummy
execute as @a[tag=whimc.queue_initiator, limit=1] at @s run function whimc:barrelbot/puzzle_instance/forceload_remove_region with storage whimc:macro region
scoreboard players set $source_forceload_active whimc.dummy 0
