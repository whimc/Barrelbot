# Repair bounding boxes on all linked puzzles (run once after migrating an existing world).
scoreboard players operation $temp whimc.barrelbot.puzzle_id = @s whimc.barrelbot.puzzle_id
execute as @e[type=text_display, tag=whimc.barrelbot.puzzle_manager, predicate=whimc:barrelbot/match_id] at @s run function whimc:barrelbot/no_smuggle/compute_default_bounding_box
execute as @e[type=text_display, tag=whimc.barrelbot.puzzle_manager, predicate=whimc:barrelbot/match_id] at @s run function whimc:barrelbot/no_smuggle/define_items
tellraw @s [{"text":"[Barrelbot] ","color":"gold","bold":true},{"text":"Repaired puzzle bounds and refreshed instructor item tags for linked puzzles. Re-expand bounds with the wand if needed.","color":"yellow"}]
