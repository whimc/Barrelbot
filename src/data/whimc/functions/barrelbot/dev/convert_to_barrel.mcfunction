#> whimc:barrelbot/dev/convert_to_barrel
# Converts a barrelbot to a dispenser bot

execute as @e[type=item_display,tag=whimc.dispenser_bot,limit=1,sort=nearest] at @s run function whimc:barrelbot/dispenser_bot/convert_to_barrel