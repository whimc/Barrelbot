tag @s add whimc.dispenser_bot
execute on passengers run data modify entity @s[tag=!whimc.dispenser_bot] data.instructions set from block ~ ~ ~ Items
setblock ~ ~ ~ minecraft:dispenser[facing=up]{Lock: "hurdy gurdy"}
item replace entity @s container.0 with red_stained_glass_pane{CustomModelData: 130000}
