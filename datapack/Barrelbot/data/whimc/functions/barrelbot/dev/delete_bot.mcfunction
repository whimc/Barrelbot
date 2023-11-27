#> whimc:barrelbot/dev/delete_bot
#   Deletes the nearest barrel bot

execute as @e[type=item_display,tag=whimc.barrelbot,limit=1,sort=nearest] at @s run function whimc:barrelbot/bot/kill