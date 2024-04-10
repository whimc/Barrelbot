scoreboard players operation @s whimc.barrelbot.bot_id = $temp whimc.barrelbot.bot_id
scoreboard players set @s whimc.barrelbot.display_layer 0
tag @s add whimc.execution_display
tag @s add whimc.execution_display_cursor
item replace entity @s container.0 with glowstone_dust{CustomModelData: 130001}
data merge entity @s {billboard: "center", transformation: {scale: [0.26f, 0.26f, 0.0f], translation: [100000.0f, 0.225f, 0.01f], left_rotation: {angle: 3.141592f, axis: [0.0f, 1.0f, 0.0f]}}, item_display: "gui", brightness: {sky: 15, block: 15}}
