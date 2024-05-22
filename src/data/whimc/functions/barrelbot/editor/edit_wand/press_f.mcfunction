
# Swap mainhand and offhand
summon item_display ~ 1000000 ~ {Tags:["whimc.temp_display"]}
item replace entity @e[type=item_display,tag=whimc.temp_display,limit=1] container.0 from entity @s weapon.offhand
item replace entity @s weapon.offhand from entity @s weapon.mainhand
item replace entity @s weapon.mainhand from entity @e[type=item_display,tag=whimc.temp_display,limit=1] container.0

#TO-DO: Reset linkage to puzzle entity
execute if entity @s[tag=whimc.in_edit_menu] run function ./edit_mode/erase_page
scoreboard players reset @s whimc.barrelbot.edit_instance_id

# Open menu
data remove storage whimc:macro page
data modify storage whimc:macro page.page set value "general"
function ./enter_edit_mode

advancement revoke @s only whimc:interact/press_f_wand
kill @e[type=item_display,tag=whimc.temp_display]