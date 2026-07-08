# Validate bounding_box in storage; repair from puzzle manager if missing or degenerate.
execute store result score $min_x whimc.dummy run data get storage whimc:storage bounding_box.min_x
execute store result score $max_x whimc.dummy run data get storage whimc:storage bounding_box.max_x
execute if score $max_x whimc.dummy > $min_x whimc.dummy run return 0
execute store result score $min_y whimc.dummy run data get storage whimc:storage bounding_box.min_y
execute store result score $max_y whimc.dummy run data get storage whimc:storage bounding_box.max_y
execute if score $max_y whimc.dummy > $min_y whimc.dummy run return 0
execute store result score $min_z whimc.dummy run data get storage whimc:storage bounding_box.min_z
execute store result score $max_z whimc.dummy run data get storage whimc:storage bounding_box.max_z
execute if score $max_z whimc.dummy > $min_z whimc.dummy run return 0
execute as @e[type=text_display, tag=whimc.barrelbot.puzzle_manager, limit=1, predicate=whimc:barrelbot/match_id] at @s run function whimc:barrelbot/no_smuggle/compute_default_bounding_box
