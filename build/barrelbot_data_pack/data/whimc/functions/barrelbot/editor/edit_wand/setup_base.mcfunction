execute positioned as @s run tp @s ~ ~ ~ ~ ~
tag @s remove whimc.editor_base.init
scoreboard players operation @s whimc.barrelbot.edit_instance_id = $temp whimc.barrelbot.edit_instance_id
data merge entity @s {transformation: {scale: [0.0f, 0.0f, 0.0f]}, item: {id: "minecraft:stone_button", Count: 1b}}
data modify entity @s item.tag.Page set from storage whimc:storage Page
