execute if entity @s[tag=whimc.function_display.locked] run scoreboard players set $link_error_flag whimc.dummy 1
execute if entity @s[tag=whimc.function_display.locked] run return 0
execute if data storage whimc:storage item.tag.barrelbot.instruction unless data storage whimc:storage item.tag.barrelbot.function_id run scoreboard players set $link_error_flag whimc.dummy 2
execute if data storage whimc:storage item.tag.barrelbot.instruction unless data storage whimc:storage item.tag.barrelbot.function_id run return 0
execute unless data storage whimc:storage item.tag.display.Name if data storage whimc:storage item.id run scoreboard players set $link_error_flag whimc.dummy 3
execute unless data storage whimc:storage item.tag.display.Name if data storage whimc:storage item.id run return 0
data modify entity @s item set from storage whimc:storage item
execute positioned ~ ~0.35 ~ as @e[type=text_display, tag=whimc.barrelbot.function_text, distance=..0.001, limit=1] run data modify entity @s text set from storage whimc:storage item.tag.display.Name
execute unless data storage whimc:storage item.id run item replace entity @s container.0 with barrier{Enchantments: [{}]}
execute unless data storage whimc:storage item.id positioned ~ ~0.35 ~ as @e[type=text_display, tag=whimc.barrelbot.function_text, distance=..0.001, limit=1] run data modify entity @s text set value '{"text":"Click to link a function item!"}'
scoreboard players set $link_success whimc.dummy 1
