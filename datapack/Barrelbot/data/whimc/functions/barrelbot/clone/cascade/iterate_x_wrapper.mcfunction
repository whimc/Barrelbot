#> whimc:barrelbot/clone/cascade/iterate_x_wrapper
#   Does the first iteration along the x-axis for a cascade clone

#Get center coordinates
execute store result score $paste_x whimc.dummy run data get entity @s Pos[0]
execute store result score $paste_y whimc.dummy run data get entity @s Pos[1]
execute store result score $paste_z whimc.dummy run data get entity @s Pos[2]

scoreboard players operation $original_paste_z whimc.dummy = $paste_z whimc.dummy

#Check to see if it should be cloned along the z-axis 
scoreboard players operation $z_iter whimc.dummy = $temp whimc.barrelbot.cascade.z
scoreboard players remove $z_iter whimc.dummy 1
execute if score $z_iter whimc.dummy matches 1.. run function whimc:barrelbot/clone/cascade/iterate_z_wrapper with storage whimc:macro jump


scoreboard players remove $x_iter whimc.dummy 1
$execute if score $x_iter whimc.dummy matches 1.. positioned ~$(x) ~ ~ run function whimc:barrelbot/clone/cascade/iterate_x with storage whimc:macro jump