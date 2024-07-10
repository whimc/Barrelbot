scoreboard players operation @s whimc.barrelbot.puzzle_id = $temp whimc.barrelbot.puzzle_id
scoreboard players operation $temp whimc.barrelbot.bot_id = @s whimc.barrelbot.bot_id
execute on passengers run function whimc:barrelbot/bot/load_instructions
scoreboard players set @s whimc.barrelbot.stack_height 0
execute if block ~ ~1 ~ #whimc:stackable run function whimc:barrelbot/bot/stack_loop
