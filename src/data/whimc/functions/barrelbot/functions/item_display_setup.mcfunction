#> whimc:barrelbot/functions/item_display_setup
#   Sets up the item display that hovers above a function barrel

data merge entity @s {brightness:{sky:15,block:15},billboard:"center",transformation:{scale:[0.5f,0.5f,0.001f]}}
item replace entity @s container.0 with barrier{Enchantments:[{}]}
tag @s add whimc.function_display