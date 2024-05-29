execute on vehicle on passengers as @s[type=interaction] run data modify entity @s height set value 1.15f
scoreboard players operation $temp whimc.barrelbot.edit_instance_id = @s whimc.barrelbot.edit_instance_id
execute as @e[type=text_display, tag=whimc.barrelbot.puzzle_manager, limit=1, predicate=whimc:barrelbot/match_edit_id] store result storage whimc:macro puzzle_id int 1 run scoreboard players get @s whimc.barrelbot.puzzle_type_id
function kmc.ui:int/process_input/name_puzzle/nested_macro_0 with storage whimc:macro
tellraw @s ["", {"text": "[Notice] Your puzzle is now named ", "color": "gray"}, {"nbt": "text_input[0]", "storage": "kmc:io", "color": "gold"}]
