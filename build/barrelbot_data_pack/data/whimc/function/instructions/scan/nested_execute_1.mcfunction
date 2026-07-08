playsound minecraft:block.glass.break block @a ~ ~ ~ 1 1.3
scoreboard players set $ray_length whimc.dummy 0
execute if block ~ ~ ~ ice run function whimc:instructions/scan/nested_execute_0
execute if block ~ ~ ~ packed_ice run setblock ~ ~ ~ ice
execute if block ~ ~ ~ blue_ice run setblock ~ ~ ~ packed_ice
