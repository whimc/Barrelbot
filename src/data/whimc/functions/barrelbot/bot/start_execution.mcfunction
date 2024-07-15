#> whimc:barrelbot/bot/start_execution
#   Commands run when a barrelbot starts executing

scoreboard players operation @s whimc.barrelbot.puzzle_id = $temp whimc.barrelbot.puzzle_id

scoreboard players operation $temp whimc.barrelbot.bot_id = @s whimc.barrelbot.bot_id
#execute store success score $is_dispenser whimc.dummy if entity @s[tag=whimc.dispenser_bot]
execute on passengers run function whimc:barrelbot/bot/load_instructions

execute unless entity @s[tag=whimc.barrelbot.locked] run data modify block ~ ~ ~ Lock set value "_LOCKTYPE: RUNNING_"

# Set up stack stuff
scoreboard players set @s whimc.barrelbot.stack_height 0
execute if block ~ ~1 ~ #whimc:stackable run function ./stack_loop

function ./stack_loop:
    scoreboard players add @s whimc.barrelbot.stack_height 1
    execute positioned ~ ~1 ~ if block ~ ~1 ~ #whimc:stackable run function ./stack_loop