function whimc:barrelbot/bot/grab_marker_data
data modify storage whimc:storage BotItems set from block ~ ~ ~ Items
tag @s remove whimc.barrelbot.short_circuited
execute as @s[tag=!whimc.dispenser_bot] at @s run item replace entity @s container.0 with black_stained_glass_pane{CustomModelData: 130000}
execute as @s[tag=whimc.dispenser_bot] at @s run item replace entity @s container.0 with red_stained_glass_pane{CustomModelData: 130000}
scoreboard players set @s whimc.barrelbot.slot 0
execute at @s run data modify storage whimc:storage Items set from block ~ ~ ~ Items
setblock ~ ~ ~ air
data modify entity @s Pos set from storage whimc:storage marker_data.SpawnPos
data modify entity @s Rotation set from storage whimc:storage marker_data.SpawnRotation
execute at @s run function whimc:barrelbot/bot/reset/nested_execute_1
scoreboard players operation $temp whimc.barrelbot.bot_id = @s whimc.barrelbot.bot_id
execute at @s as @e[type=item_display, tag=whimc.execution_display, predicate=whimc:barrelbot/match_bot_id] run kill @s
execute if score @s whimc.barrelbot.stack_height matches 1.. positioned ~ ~1 ~ run function whimc:barrelbot/bot/return_block_cycle
scoreboard players reset @s whimc.barrelbot.push_count
