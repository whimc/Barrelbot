#> whimc:barrelbot/bot/kill
#   Cleanly removes the bot from the world

execute on passengers run kill @s
scoreboard players operation $temp whimc.barrelbot.bot_id = @s whimc.barrelbot.bot_id
kill @e[type=item_display,tag=whimc.execution_display,predicate=whimc:barrelbot/match_bot_id]

setblock ~ ~ ~ air
kill @s