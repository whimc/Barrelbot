#> whimc:barrelbot/clone/cascade/iterate_x

scoreboard players operation $paste_z whimc.dummy = $original_paste_z whimc.dummy
scoreboard players operation $paste_x whimc.dummy += $jump_x whimc.dummy

scoreboard players operation $z_iter whimc.dummy = $temp whimc.barrelbot.cascade.z
execute if score $z_iter whimc.dummy matches 1.. run function whimc:barrelbot/clone/cascade/iterate_z with storage whimc:macro jump

scoreboard players remove $x_iter whimc.dummy 1
$execute if score $x_iter whimc.dummy matches 1.. positioned ~$(x) ~ ~ run function whimc:barrelbot/clone/cascade/iterate_x with storage whimc:macro jump