scoreboard players add @s whimc.barrelbot.stack_height 1
execute summon marker run function whimc:barrelbot/clone/get_pos
data modify storage whimc:storage stack_entry set value {}
execute store result storage whimc:storage stack_entry.x int 1 run data get storage whimc:storage Pos[0]
execute store result storage whimc:storage stack_entry.y int 1 run data get storage whimc:storage Pos[1]
execute store result storage whimc:storage stack_entry.z int 1 run data get storage whimc:storage Pos[2]
data modify storage whimc:storage block_stack append from storage whimc:storage stack_entry
execute positioned ~ ~1 ~ if block ~ ~ ~ #whimc:stackable run function whimc:barrelbot/bot/stack_loop
