execute as @e[type=text_display, tag=whimc.barrelbot.puzzle_manager] run function whimc:barrelbot/puzzle_instance/register
execute store result score $count whimc.dummy if data storage whimc:storage puzzle_instances[]
tellraw @s ["", {"text": "[Barrelbot] ", "color": "gold", "bold": true}, {"text": "Registered ", "color": "white"}, {"score": {"name": "$count", "objective": "whimc.dummy"}, "color": "aqua"}, {"text": " puzzle instance(s) in loaded chunks.", "color": "white"}]
tellraw @s {"text": "Fly near unregistered copies once so they can be tracked for propagate/clone updates.", "color": "gray", "italic": true}
