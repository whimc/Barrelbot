execute store result score $locked whimc.dummy if entity @s[tag=whimc.barrelbot.locked]
execute if score $locked whimc.dummy matches 0 run function whimc:barrelbot/editor/edit_wand/edit_mode/pages/lock_bot/nested_execute_0
execute if score $locked whimc.dummy matches 1 run function whimc:barrelbot/editor/edit_wand/edit_mode/pages/lock_bot/nested_execute_1
