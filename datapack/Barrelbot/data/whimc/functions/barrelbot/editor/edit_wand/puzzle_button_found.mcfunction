#> whimc:barrelbot/editor/edit_wand/puzzle_button_found

scoreboard players set #success whimc.dummy 1

data remove storage whimc:macro page
data modify storage whimc:macro page.page set value "puzzle"
scoreboard players operation @s whimc.barrelbot.edit_instance_id = $temp whimc.barrelbot.edit_instance_id
execute on passengers run scoreboard players operation @s whimc.barrelbot.edit_instance_id = $temp whimc.barrelbot.edit_instance_id

scoreboard players operation $out whimc.barrelbot.puzzle_id = @s whimc.barrelbot.puzzle_id

tag @s add whimc.edit_subject