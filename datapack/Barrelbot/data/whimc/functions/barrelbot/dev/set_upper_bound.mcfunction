#> whimc:barrelbot/dev/set_upper_bound

function whimc:barrelbot/editor/set_max

scoreboard players operation $temp whimc.barrelbot.puzzle_id = @s whimc.barrelbot.puzzle_id

execute unless entity @e[type=marker,predicate=whimc:barrelbot/match_id,tag=whimc.edit_mode] run tellraw @s {"text":"Linked Puzzle is not in edit mode!","color": "red"}
execute unless entity @e[type=marker,predicate=whimc:barrelbot/match_id,tag=whimc.edit_mode] run return 0

function whimc:barrelbot/editor/outline/adjust
execute as @e[type=marker,predicate=whimc:barrelbot/match_id,tag=whimc.edit_mode] run function whimc:barrelbot/editor/apply_upper_bound