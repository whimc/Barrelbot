scoreboard players operation $offset_x whimc.dummy += $jump_x whimc.dummy
scoreboard players remove $counter whimc.dummy 1
execute if score $counter whimc.dummy matches 1.. run function whimc:barrelbot/clone_paste/accumulate_x_offset
