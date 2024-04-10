scoreboard players operation $temp whimc.barrelbot.puzzle_id = @s whimc.barrelbot.puzzle_id
execute as @e[type=interaction, predicate=whimc:barrelbot/match_id, tag=whimc.max_node] at @s run function whimc:barrelbot/editor/set_max
function whimc:barrelbot/editor/set_min
function whimc:barrelbot/editor/outline/adjust
execute as @e[type=marker, predicate=whimc:barrelbot/match_id, tag=whimc.edit_mode] run function whimc:barrelbot/editor/apply_lower_bound
