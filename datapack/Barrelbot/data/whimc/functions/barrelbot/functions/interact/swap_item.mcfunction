#> whimc:barrelbot/functions/interact/swap_item
#   Swaps out a function's item

#If the item is a honeycomb, toggle lock
execute if data storage whimc:storage {item:{id:"minecraft:honeycomb"}} run function whimc:barrelbot/functions/interact/lock
execute if data storage whimc:storage {item:{id:"minecraft:honeycomb"}} run return 0
execute if entity @s[tag=whimc.function_display.locked] run return 0

data modify entity @s item set from storage whimc:storage item
execute positioned ~ ~0.35 ~ as @e[type=text_display,tag=whimc.barrelbot.function_text,distance=..0.001,limit=1] run data modify entity @s text set from storage whimc:storage item.tag.display.Name
execute unless data storage whimc:storage item.id run item replace entity @s container.0 with barrier{Enchantments:[{}]}
execute unless data storage whimc:storage item.id positioned ~ ~0.35 ~ as @e[type=text_display,tag=whimc.barrelbot.function_text,distance=..0.001,limit=1] run data modify entity @s text set value '{"text":"Click to link a function item!"}'

scoreboard players set $link_success whimc.dummy 1
