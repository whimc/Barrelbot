scoreboard players operation $temp whimc.barrelbot.edit_instance_id = @s whimc.barrelbot.edit_instance_id
execute as @e[type=item_display, tag=whimc.barrelbot, predicate=whimc:barrelbot/match_edit_id] at @s run function whimc:barrelbot/editor/edit_wand/edit_mode/pages/lock_bot/nested_execute_2
execute if score $locked whimc.dummy matches 0 run tellraw @s {"text": "Bot is now locked", "color": "gold"}
execute if score $locked whimc.dummy matches 1 run tellraw @s {"text": "Bot is now unlocked", "color": "gray"}
