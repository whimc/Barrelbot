particle smoke ~ ~ ~ 0.5 0.5 0.5 0.1 20 normal
execute store result score $is_dispenser whimc.dummy if entity @s[tag=whimc.dispenser_bot]
execute if score $is_dispenser whimc.dummy matches 0 run function whimc:barrelbot/dispenser_bot/convert
execute if score $is_dispenser whimc.dummy matches 1 run function whimc:barrelbot/dispenser_bot/convert_to_barrel
