execute if score $cascade_iz whimc.dummy >= $temp whimc.barrelbot.cascade.z run return 0
scoreboard players set $offset_x whimc.dummy 0
scoreboard players operation $counter whimc.dummy = $cascade_ix whimc.dummy
execute if score $counter whimc.dummy matches 1.. run function whimc:barrelbot/clone_paste/accumulate_x_offset
scoreboard players set $offset_z whimc.dummy 0
scoreboard players operation $counter whimc.dummy = $cascade_iz whimc.dummy
execute if score $counter whimc.dummy matches 1.. run function whimc:barrelbot/clone_paste/accumulate_z_offset
scoreboard players operation $paste_x whimc.dummy = $source_x whimc.dummy
scoreboard players operation $paste_x whimc.dummy += $offset_x whimc.dummy
scoreboard players operation $paste_y whimc.dummy = $source_y whimc.dummy
scoreboard players operation $paste_z whimc.dummy = $source_z whimc.dummy
scoreboard players operation $paste_z whimc.dummy += $offset_z whimc.dummy
function whimc:barrelbot/clone_paste/append_queue_entry
scoreboard players add $cascade_iz whimc.dummy 1
function whimc:barrelbot/clone_paste/build_cascade_loop_z
