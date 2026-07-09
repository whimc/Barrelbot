execute on vehicle on passengers as @s[type=interaction] run data modify entity @s height set value 1.15f
scoreboard players set $rename_target whimc.dummy 0
scoreboard players operation $temp whimc.barrelbot.edit_instance_id = @s whimc.barrelbot.edit_instance_id
execute store result score $rename_target whimc.dummy run scoreboard players get @e[type=text_display, tag=whimc.barrelbot.puzzle_manager, limit=1, predicate=whimc:barrelbot/match_edit_id] whimc.barrelbot.puzzle_type_id
execute unless score $rename_target whimc.dummy matches 1.. run scoreboard players operation $temp whimc.barrelbot.puzzle_id = @s whimc.barrelbot.puzzle_id
execute unless score $rename_target whimc.dummy matches 1.. store result score $rename_target whimc.dummy run scoreboard players get @e[type=text_display, tag=whimc.barrelbot.puzzle_manager, limit=1, predicate=whimc:barrelbot/match_id] whimc.barrelbot.puzzle_type_id
execute store result storage whimc:macro puzzle_id int 1 run scoreboard players get $rename_target whimc.dummy
function kmc.ui:int/process_input/name_puzzle/nested_macro_0 with storage whimc:macro
tellraw @s ["", {"text": "[Notice] Your puzzle is now named ", "color": "gray"}, {"nbt": "text_input[0].text", "storage": "kmc:io", "color": "gold"}]
