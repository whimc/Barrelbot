scoreboard players operation $temp whimc.barrelbot.puzzle_id = @s whimc.barrelbot.puzzle_id
execute store result score $in_edit_mode whimc.dummy if entity @s[tag=whimc.edit_mode]
execute if score $in_edit_mode whimc.dummy matches 0 run function whimc:barrelbot/editor/enable_edit_mode
execute if score $in_edit_mode whimc.dummy matches 1 run function whimc:barrelbot/editor/disable_edit_mode
