#> whimc:barrelbot/dev/link_function_item
#   Links the item the player is holding to the nearest function

data modify storage whimc:storage item_modifier.id set from entity @e[type=marker,limit=1,sort=nearest,tag=whimc.barrelbot.function] data.id
item modify entity @s weapon.mainhand whimc:barrelbot/set_function_id
item replace entity @e[type=item_display,limit=1,sort=nearest,tag=whimc.function_display] container.0 from entity @s weapon.mainhand