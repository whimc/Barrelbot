execute unless block ~ ~ ~ #whimc:air unless entity @e[type=marker, tag=whimc.barrelbot.move_marker, dx=0, dy=0, dz=0] run scoreboard players set $area_free whimc.dummy 0
scoreboard players remove $loop_count whimc.dummy 1
execute if score $loop_count whimc.dummy matches 0.. positioned ~ ~1 ~ run function whimc:barrelbot/bot/check_area_loop
