#> whimc:barrelbot/editor/edit_wand/barrelbot_found
#   Returns that a barrelbot was found by the scan

scoreboard players set #success whimc.dummy 1

data remove storage whimc:macro page
data modify storage whimc:macro page.page set value "barrelbot"
scoreboard players operation @s whimc.barrelbot.edit_instance_id = $temp whimc.barrelbot.edit_instance_id