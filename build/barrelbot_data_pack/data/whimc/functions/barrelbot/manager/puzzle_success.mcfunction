tag @s add whimc.success
playsound minecraft:entity.player.levelup player @a ~ ~ ~ 2 1
execute at @e[type=item_display, tag=whimc.barrelbot, tag=!whimc.dispenser_bot, predicate=whimc:barrelbot/match_id] run particle happy_villager ~ ~ ~ 0.6 0.6 0.6 0 35 force
execute as @e[type=item_display, tag=whimc.barrelbot, tag=!whimc.dispenser_bot, predicate=whimc:barrelbot/match_id] run item replace entity @s container.0 with black_stained_glass_pane{CustomModelData: 130001}
