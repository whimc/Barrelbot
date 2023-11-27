#> whimc:barrelbot/bot/short_circuit
#   Short circuits the barrelbot when it is destroyed

tag @s add whimc.barrelbot.short_circuited
execute on passengers as @s[type=marker] run data remove entity @s data.stack[]
playsound minecraft:block.fire.extinguish block @a ~ ~ ~ 2 1
playsound minecraft:block.respawn_anchor.deplete player @a ~ ~ ~ 1 1.3
particle minecraft:angry_villager ~ ~ ~ 0.7 0.7 0.7 0 10 normal
particle minecraft:smoke ~ ~1 ~ 0.3 0.1 0.3 0 30 normal

item replace entity @s container.0 with black_stained_glass_pane{CustomModelData:130002}