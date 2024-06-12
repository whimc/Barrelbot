#> whimc:barrelbot/functions/interact/right_click
#   Run when a player right clicks a function item

advancement revoke @s only whimc:interact/right_click_function

data modify storage whimc:storage item set value {}
data modify storage whimc:storage item set from entity @s SelectedItem
data modify storage whimc:storage item.tag.Enchantments set value [{}]


scoreboard players set $link_error_flag whimc.dummy 0
scoreboard players set $link_success whimc.dummy 0
tag @s add whimc.clicker
execute as @e[type=interaction,tag=whimc.barrelbot.function_interaction,distance=..6] run function whimc:barrelbot/functions/interact/check_match
tag @s remove whimc.clicker


execute if score $link_error_flag whimc.dummy matches 1 run tellraw @s {"text": "This function is locked!","color":"red"}
execute if score $link_error_flag whimc.dummy matches 2 run tellraw @s {"text": "This instruction already does something! Try a different item instead!","color":"red"}
execute if score $link_error_flag whimc.dummy matches 3 run tellraw @s {"text":"Try giving this item a name with an anvil before linking it!","color":"red"}

execute if score $link_success whimc.dummy matches 1 unless data storage whimc:storage item.tag.barrelbot.instruction run item modify entity @s weapon.mainhand whimc:barrelbot/set_function_item