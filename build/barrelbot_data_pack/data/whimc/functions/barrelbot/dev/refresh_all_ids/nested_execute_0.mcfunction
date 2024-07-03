scoreboard players add $global whimc.barrelbot.puzzle_id 1
scoreboard players operation @s whimc.barrelbot.puzzle_id = $global whimc.barrelbot.puzzle_id
execute on passengers as @s[type=marker] run scoreboard players operation @s whimc.barrelbot.puzzle_id = $global whimc.barrelbot.puzzle_id
function whimc:barrelbot/manager/get_dimensions
function whimc:barrelbot/dev/refresh_all_ids/nested_macro_0 with storage whimc:macro Pos
