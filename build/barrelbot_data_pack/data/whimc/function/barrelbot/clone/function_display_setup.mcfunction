data merge entity @s {brightness: {sky: 15, block: 15}, billboard: "center", transformation: {scale: [0.5f, 0.5f, 0.001f]}}
data modify entity @s item set from storage whimc:storage display_item
tag @s add whimc.function_display
execute if score #locked whimc.dummy matches 1 run tag @s add whimc.function_display.locked
