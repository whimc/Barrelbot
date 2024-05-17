scoreboard players operation @s whimc.barrelbot.puzzle_id = $temp whimc.barrelbot.puzzle_id
tag @s add whimc.editor_outline
tag @s add whimc.editor_outline.min_x
data merge entity @s {see_through: 1b, brightness: {sky: 15, block: 15}, background: 855618304, transformation: {left_rotation: {angle: 1.570796326f, axis: [0.0f, 1.0f, 0.0f]}}}
execute store result entity @s transformation.scale[0] float -40 run scoreboard players get $size_z whimc.dummy
execute store result entity @s transformation.scale[1] float 40 run scoreboard players get $size_y whimc.dummy
