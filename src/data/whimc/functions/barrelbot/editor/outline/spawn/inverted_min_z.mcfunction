#> whimc:barrelbot/editor/outline/spawn/inverted_min_z

scoreboard players operation @s whimc.barrelbot.puzzle_id = $temp whimc.barrelbot.puzzle_id

tag @s add whimc.editor_outline
tag @s add whimc.editor_outline.inverted_min_z
data merge entity @s {see_through:1b,brightness:{sky:15,block:15},background:855618304}

execute store result entity @s transformation.scale[0] float 40 run scoreboard players get $size_x whimc.dummy
execute store result entity @s transformation.scale[1] float 40 run scoreboard players get $size_y whimc.dummy