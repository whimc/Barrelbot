scoreboard players operation $temp whimc.barrelbot.in_puzzle_id = @s whimc.barrelbot.puzzle_id
execute as @a[predicate=whimc:barrelbot/match_in_puzzle_id] run function whimc:barrelbot/no_smuggle/return_all_items
execute as @s[tag=whimc.barrelbot.puzzle_manager.active] at @s run function whimc:barrelbot/manager/stop_execution
function whimc:barrelbot/manager/get_dimensions
function whimc:barrelbot/manager/reset_puzzle/nested_macro_0 with storage whimc:macro Pos
