#> whimc:barrelbot/no_smuggle/check_leave_boundary
#   Check to see if the player has left the boundary of the puzzle they are currently interacting with

execute store result storage whimc:macro volume.x int 1 run scoreboard players get @s whimc.barrelbot.bound_x
execute store result storage whimc:macro volume.y int 1 run scoreboard players get @s whimc.barrelbot.bound_y
execute store result storage whimc:macro volume.z int 1 run scoreboard players get @s whimc.barrelbot.bound_z

execute store result storage whimc:macro volume.dx int 1 run scoreboard players get @s whimc.barrelbot.bound_dx
execute store result storage whimc:macro volume.dy int 1 run scoreboard players get @s whimc.barrelbot.bound_dy
execute store result storage whimc:macro volume.dz int 1 run scoreboard players get @s whimc.barrelbot.bound_dz

function whimc:barrelbot/no_smuggle/volume_check with storage whimc:macro volume