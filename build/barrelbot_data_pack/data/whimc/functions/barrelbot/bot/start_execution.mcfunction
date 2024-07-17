scoreboard players operation @s whimc.barrelbot.puzzle_id = $temp whimc.barrelbot.puzzle_id
scoreboard players operation $temp whimc.barrelbot.bot_id = @s whimc.barrelbot.bot_id
execute on passengers run function whimc:barrelbot/bot/load_instructions
execute unless entity @s[tag=whimc.barrelbot.locked] run data modify block ~ ~ ~ Lock set value "_LOCKTYPE: RUNNING_"
scoreboard players set @s whimc.barrelbot.stack_height 0
data modify storage whimc:storage block_stack set value []
execute positioned ~ ~1 ~ if block ~ ~ ~ #whimc:stackable run function whimc:barrelbot/bot/stack_loop
execute on passengers run data modify entity @s data.block_stack set from storage whimc:storage block_stack
