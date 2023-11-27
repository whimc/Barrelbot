#> whimc:barrelbot/functions/delete
#   Deletes a function

setblock ~ ~ ~ air
execute positioned ~ ~1 ~ as @e[type=item_display,tag=whimc.function_display,limit=1,sort=nearest,distance=..0.1] run kill @s
kill @s