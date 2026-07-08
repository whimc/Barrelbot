execute store result score $paste_x whimc.dummy run data get storage whimc:storage clone_paste_queue[0].x
execute store result score $paste_y whimc.dummy run data get storage whimc:storage clone_paste_queue[0].y
execute store result score $paste_z whimc.dummy run data get storage whimc:storage clone_paste_queue[0].z
scoreboard players operation $dest_min_x whimc.dummy = $real_min_x whimc.dummy
scoreboard players operation $dest_min_x whimc.dummy -= $source_x whimc.dummy
scoreboard players operation $dest_min_x whimc.dummy += $paste_x whimc.dummy
scoreboard players operation $dest_min_z whimc.dummy = $real_min_z whimc.dummy
scoreboard players operation $dest_min_z whimc.dummy -= $source_z whimc.dummy
scoreboard players operation $dest_min_z whimc.dummy += $paste_z whimc.dummy
scoreboard players operation $dest_max_x whimc.dummy = $dest_min_x whimc.dummy
scoreboard players operation $dest_max_x whimc.dummy += $vol_x whimc.dummy
scoreboard players operation $dest_max_z whimc.dummy = $dest_min_z whimc.dummy
scoreboard players operation $dest_max_z whimc.dummy += $vol_z whimc.dummy
