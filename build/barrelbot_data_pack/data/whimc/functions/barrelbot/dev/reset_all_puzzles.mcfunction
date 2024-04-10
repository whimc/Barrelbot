execute as @e[type=text_display, tag=whimc.barrelbot.puzzle_manager.active] at @s run function whimc:barrelbot/manager/stop_execution
execute as @e[type=text_display, tag=whimc.barrelbot.puzzle_manager] at @s positioned ~ ~-1 ~ on passengers run data modify block ^ ^ ^-1 Items set from entity @s data.Items
