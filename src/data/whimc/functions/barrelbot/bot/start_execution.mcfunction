#> whimc:barrelbot/bot/start_execution
#   Commands run when a barrelbot starts executing

scoreboard players operation @s whimc.barrelbot.puzzle_id = $temp whimc.barrelbot.puzzle_id

scoreboard players operation $temp whimc.barrelbot.bot_id = @s whimc.barrelbot.bot_id
#execute store success score $is_dispenser whimc.dummy if entity @s[tag=whimc.dispenser_bot]
execute on passengers run function whimc:barrelbot/bot/load_instructions

execute unless entity @s[tag=whimc.barrelbot.locked] run data modify block ~ ~ ~ Lock set value "_LOCKTYPE: RUNNING_"

# Set up stack stuff
scoreboard players set @s whimc.barrelbot.stack_height 0
data modify storage whimc:storage block_stack set value []
execute positioned ~ ~1 ~ if block ~ ~ ~ #whimc:stackable run function ./stack_loop
execute on passengers run data modify entity @s data.block_stack set from storage whimc:storage block_stack

function ./stack_loop:
    scoreboard players add @s whimc.barrelbot.stack_height 1
    execute summon marker run function whimc:barrelbot/clone/get_pos
    data modify storage whimc:storage stack_entry set value {}
    execute store result storage whimc:storage stack_entry.x int 1 run data get storage whimc:storage Pos[0]
    execute store result storage whimc:storage stack_entry.y int 1 run data get storage whimc:storage Pos[1]
    execute store result storage whimc:storage stack_entry.z int 1 run data get storage whimc:storage Pos[2]
    data modify storage whimc:storage block_stack append from storage whimc:storage stack_entry
    execute positioned ~ ~1 ~ if block ~ ~ ~ #whimc:stackable run function ./stack_loop