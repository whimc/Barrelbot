tag @s add whimc.success
playsound minecraft:entity.player.levelup player @a ~ ~ ~ 2 1
execute at @e[type=item_display, tag=whimc.barrelbot, tag=!whimc.dispenser_bot, predicate=whimc:barrelbot/match_id] run particle happy_villager ~ ~ ~ 0.6 0.6 0.6 0 35 force
execute as @e[type=item_display, tag=whimc.barrelbot, tag=!whimc.dispenser_bot, predicate=whimc:barrelbot/match_id] run item replace entity @s container.0 with black_stained_glass_pane{CustomModelData: 130001}
execute as @a if score @s whimc.barrelbot.in_puzzle_id = $temp whimc.barrelbot.puzzle_id run tag @s add whimc.success_haver
tellraw @a ["", {"text": "[Barrelbot] ", "bold": true, "color": "gray"}, {"selector": "@a[tag=whimc.success_haver]", "color": "gold"}, " has completed puzzle #", {"score": {"name": "@s", "objective": "whimc.barrelbot.puzzle_type_id"}, "color": "green"}, "!"]
tag @s remove whimc.success_haver
