#> whimc:barrelbot/functions/recursion_limit_reached
#   Terminates the proccess and provides some visual feedback when the recursion limit is reached

data remove storage whimc:storage marker_data.stack[]
particle minecraft:angry_villager ~ ~ ~ 0.7 0.7 0.7 0 10 normal
particle minecraft:smoke ~ ~1 ~ 0.3 0.1 0.3 0 30 normal

playsound minecraft:block.fire.extinguish block @a ~ ~ ~ 2 1
item replace entity @s container.0 with black_stained_glass_pane{CustomModelData:130002}