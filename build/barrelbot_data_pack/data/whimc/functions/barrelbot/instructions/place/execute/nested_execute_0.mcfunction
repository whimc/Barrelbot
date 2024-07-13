tag @s add whimc.barrelbot.dropped_block
data modify entity @s data.location set from storage whimc:storage stack_entry
scoreboard players operation @s whimc.barrelbot.puzzle_id = $temp whimc.barrelbot.puzzle_id
