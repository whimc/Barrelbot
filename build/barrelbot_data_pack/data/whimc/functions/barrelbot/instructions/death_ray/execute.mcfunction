scoreboard players set $steps whimc.dummy 3
execute if data storage whimc:storage current_step.reach store result score $steps whimc.dummy run data get storage whimc:storage current_step.reach
playsound minecraft:block.fire.extinguish block @a ~ ~ ~ 1 2
execute positioned ^ ^ ^1 run function whimc:instructions/recurse
