scoreboard players operation $offset_z whimc.dummy += $jump_z whimc.dummy
scoreboard players remove $counter whimc.dummy 1
execute if score $counter whimc.dummy matches 1.. run function whimc:barrelbot/clone_paste/accumulate_z_offset
