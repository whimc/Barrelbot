execute if score $is_dispenser whimc.dummy matches 1 run function whimc:barrelbot/dispenser_bot/convert
execute on passengers run data modify entity @s data.instructions set from storage whimc:storage marker_data.instructions
data modify entity @s Tags set from storage whimc:storage bot_temp_data.Tags
