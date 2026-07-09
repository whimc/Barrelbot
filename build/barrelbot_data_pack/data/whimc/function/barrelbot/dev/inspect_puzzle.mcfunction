scoreboard players operation $temp whimc.barrelbot.puzzle_id = @s whimc.barrelbot.puzzle_id
execute unless entity @e[type=text_display, tag=whimc.barrelbot.puzzle_manager, predicate=whimc:barrelbot/match_id] run tellraw @s [{"text":"[Barrelbot] ","color":"gold","bold":true},{"text":"Not linked to a puzzle. Use Link to Puzzle from the dev book first.","color":"red"}]
execute unless entity @e[type=text_display, tag=whimc.barrelbot.puzzle_manager, predicate=whimc:barrelbot/match_id] run return 0
execute store result score $type_id whimc.dummy run scoreboard players get @e[type=text_display, tag=whimc.barrelbot.puzzle_manager, limit=1, predicate=whimc:barrelbot/match_id] whimc.barrelbot.puzzle_type_id
execute store result storage whimc:macro puzzle_type int 1 run scoreboard players get $type_id whimc.dummy
execute as @e[type=text_display, tag=whimc.barrelbot.puzzle_manager, limit=1, predicate=whimc:barrelbot/match_id] on passengers as @s[type=marker] run data modify storage whimc:storage InspectBounds set from entity @s data.bounding_box
execute as @e[type=text_display, tag=whimc.barrelbot.puzzle_manager, limit=1, predicate=whimc:barrelbot/match_id] on passengers as @s[type=marker] run data modify storage whimc:storage InspectSuccess set from entity @s data.success_function
function whimc:barrelbot/manager/get_puzzle_name
tellraw @s ["", {"text": "[Barrelbot] ", "color": "gold", "bold": true}, {"text": "Inspecting linked puzzle", "color": "white"}]
tellraw @s ["", {"text": "  Name: ", "color": "gray"}, {"nbt": "puzzle_name", "storage": "whimc:storage", "color": "green"}]
tellraw @s ["", {"text": "  puzzle_id: ", "color": "gray"}, {"score": {"name": "$temp", "objective": "whimc.barrelbot.puzzle_id"}, "color": "aqua"}, {"text": "  puzzle_type_id: ", "color": "gray"}, {"score": {"name": "$type_id", "objective": "whimc.dummy"}, "color": "aqua"}]
tellraw @s ["", {"text": "  bounds min: ", "color": "gray"}, {"nbt": "InspectBounds.min_x", "storage": "whimc:storage", "color": "yellow"}, {"text": " ", "color": "gray"}, {"nbt": "InspectBounds.min_y", "storage": "whimc:storage", "color": "yellow"}, {"text": " ", "color": "gray"}, {"nbt": "InspectBounds.min_z", "storage": "whimc:storage", "color": "yellow"}]
tellraw @s ["", {"text": "  bounds max: ", "color": "gray"}, {"nbt": "InspectBounds.max_x", "storage": "whimc:storage", "color": "yellow"}, {"text": " ", "color": "gray"}, {"nbt": "InspectBounds.max_y", "storage": "whimc:storage", "color": "yellow"}, {"text": " ", "color": "gray"}, {"nbt": "InspectBounds.max_z", "storage": "whimc:storage", "color": "yellow"}]
tellraw @s ["", {"text": "  success: ", "color": "gray"}, {"nbt": "InspectSuccess", "storage": "whimc:storage", "color": "yellow"}]
execute as @e[type=text_display, tag=whimc.barrelbot.puzzle_manager, limit=1, predicate=whimc:barrelbot/match_id] run function whimc:barrelbot/manager/get_dimensions
function whimc:barrelbot/dev/inspect_puzzle/count_bots with storage whimc:macro Pos
tellraw @s ["", {"text": "  barrelbots in bounds: ", "color": "gray"}, {"score": {"name": "$bot_count", "objective": "whimc.dummy"}, "color": "aqua"}, {"text": " (linked: ", "color": "gray"}, {"score": {"name": "$linked_bot_count", "objective": "whimc.dummy"}, "color": "aqua"}, {"text": ")", "color": "gray"}]
function whimc:barrelbot/dev/highlight_linked_puzzle
