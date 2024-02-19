#> whimc:barrelbot/editor/outline/adjust/main
#   Adjusts all of the text displays


tp @s ~ ~ ~

execute as @s[tag=whimc.editor_outline.max_x] run function whimc:barrelbot/editor/outline/adjust/max_x
execute as @s[tag=whimc.editor_outline.max_y] run function whimc:barrelbot/editor/outline/adjust/max_y
execute as @s[tag=whimc.editor_outline.max_z] run function whimc:barrelbot/editor/outline/adjust/max_z
execute as @s[tag=whimc.editor_outline.min_x] run function whimc:barrelbot/editor/outline/adjust/min_x
execute as @s[tag=whimc.editor_outline.min_y] run function whimc:barrelbot/editor/outline/adjust/min_y
execute as @s[tag=whimc.editor_outline.min_z] run function whimc:barrelbot/editor/outline/adjust/min_z

execute as @s[tag=whimc.editor_outline.inverted_max_x] run function whimc:barrelbot/editor/outline/adjust/inverted_max_x
execute as @s[tag=whimc.editor_outline.inverted_max_y] run function whimc:barrelbot/editor/outline/adjust/inverted_max_y
execute as @s[tag=whimc.editor_outline.inverted_max_z] run function whimc:barrelbot/editor/outline/adjust/inverted_max_z
execute as @s[tag=whimc.editor_outline.inverted_min_x] run function whimc:barrelbot/editor/outline/adjust/inverted_min_x
execute as @s[tag=whimc.editor_outline.inverted_min_y] run function whimc:barrelbot/editor/outline/adjust/inverted_min_y
execute as @s[tag=whimc.editor_outline.inverted_min_z] run function whimc:barrelbot/editor/outline/adjust/inverted_min_z