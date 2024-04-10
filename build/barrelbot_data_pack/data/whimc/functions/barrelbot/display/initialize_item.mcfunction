data merge entity @s {teleport_duration: 0, billboard: "center", transformation: {scale: [0.2f, 0.2f, 0.0f], left_rotation: {angle: 3.141592f, axis: [0.0f, 1.0f, 0.0f]}}, item_display: "gui", brightness: {sky: 15, block: 15}}
data modify entity @s {} merge from storage whimc:storage execution_displays[0]
tag @s add whimc.execution_display
tag @s add whimc.execution_display_item
scoreboard players operation @s whimc.barrelbot.bot_id = $temp whimc.barrelbot.bot_id
scoreboard players set @s whimc.barrelbot.display_layer 0
