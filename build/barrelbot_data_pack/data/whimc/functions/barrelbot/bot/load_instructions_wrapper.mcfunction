scoreboard players operation @s whimc.barrelbot.puzzle_id = $temp whimc.barrelbot.puzzle_id
scoreboard players operation $temp whimc.barrelbot.bot_id = @s whimc.barrelbot.bot_id
execute store success score $is_dispenser whimc.dummy if entity @s[tag=whimc.dispenser_bot]
execute on passengers run function whimc:barrelbot/bot/load_instructions
