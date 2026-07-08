data modify storage whimc:macro target set from storage whimc:storage propagate_queue[0]
$execute positioned $(x) $(y) $(z) as @e[type=text_display, tag=whimc.barrelbot.puzzle_manager, limit=1, distance=..3] at @s run function whimc:barrelbot/clone/propagate/update_puzzle
$execute positioned $(x) $(y) $(z) as @e[type=text_display, tag=whimc.barrelbot.puzzle_manager, limit=1, distance=..3] at @s run function whimc:barrelbot/clone/propagate/clone_details
$execute positioned $(x) $(y) $(z) as @e[type=text_display, tag=whimc.barrelbot.puzzle_manager, limit=1, distance=..3] on passengers run data modify entity @s data.success_function set from storage whimc:storage clone.success_function
$execute positioned $(x) $(y) $(z) unless entity @e[type=text_display, tag=whimc.barrelbot.puzzle_manager, distance=..3] run tellraw @a[tag=whimc.queue_initiator] ["", {"text": "[Barrelbot] ", "color": "gold", "bold": true}, {"text": "Could not find puzzle at $(x) $(y) $(z); skipping.", "color": "red"}]
