scoreboard players operation $temp whimc.barrelbot.puzzle_id = @s whimc.barrelbot.puzzle_id
execute on passengers if entity @s[tag=whimc.edit_mode] at @s run function whimc:barrelbot/editor/disable_edit_mode
execute on passengers run kill @s
kill @s
