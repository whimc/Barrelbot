tag @s remove whimc.dispenser_bot
setblock ~ ~ ~ minecraft:barrel[facing=up]
execute on passengers run data modify block ~ ~ ~ Items set from entity @s[tag=!whimc.dispenser_bot] data.instructions
item replace entity @s container.0 with black_stained_glass_pane{CustomModelData: 130000}
