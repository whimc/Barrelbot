#> whimc:barrelbot/dev/spawn_bot
#   Spawns a barrel bot, linked to the current puzzle

setblock ~ ~ ~ minecraft:barrel[facing=up]{CustomName:'{"text":"Barrelbot"}'}
execute summon marker run function whimc:barrelbot/manager/get_execution_direction

scoreboard players operation $temp whimc.barrelbot.puzzle_id = @s whimc.barrelbot.puzzle_id
execute if score $bot_summon.call_type whimc.dummy matches 1 run scoreboard players operation $temp whimc.barrelbot.puzzle_id = $new_id whimc.barrelbot.puzzle_id
execute align xyz positioned ~0.5 ~0.5 ~0.5 summon item_display run function whimc:barrelbot/bot/setup