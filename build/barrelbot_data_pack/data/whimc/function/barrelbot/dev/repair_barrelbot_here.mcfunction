execute unless block ~ ~ ~ barrel run tellraw @s [{"text":"[Barrelbot] ","color":"gold","bold":true},{"text":"Stand on a barrel block.","color":"red"}]
execute unless block ~ ~ ~ barrel run return 0
execute if entity @e[type=item_display, tag=whimc.barrelbot, distance=..1.5] run tellraw @s [{"text":"[Barrelbot] ","color":"gold","bold":true},{"text":"A barrelbot display is already present here.","color":"yellow"}]
execute unless entity @e[type=item_display, tag=whimc.barrelbot, distance=..1.5] align xyz positioned ~0.5 ~0.5 ~0.5 run summon item_display run function whimc:barrelbot/bot/setup
execute unless entity @e[type=item_display, tag=whimc.barrelbot, distance=..1.5] run tellraw @s [{"text":"[Barrelbot] ","color":"gold","bold":true},{"text":"Spawned missing barrelbot display.","color":"green"}]
