scoreboard players set @s whimc.button_delay 25
execute store result score $is_active whimc.dummy if entity @s[tag=whimc.barrelbot.puzzle_manager.active]
execute if score $is_active whimc.dummy matches 0 run function whimc:barrelbot/manager/start_execution
execute if score $is_active whimc.dummy matches 1 run function whimc:barrelbot/manager/stop_execution
