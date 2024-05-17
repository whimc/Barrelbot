#> whimc:barrelbot/dev/delete_function
#   Deletes the nearest function barrel

execute as @e[type=marker,tag=whimc.barrelbot.function,limit=1,sort=nearest] at @s run function whimc:barrelbot/functions/delete