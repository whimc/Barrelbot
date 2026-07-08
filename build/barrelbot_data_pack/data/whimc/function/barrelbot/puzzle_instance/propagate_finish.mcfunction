tellraw @a[tag=whimc.queue_initiator] ["", {"text": "[Barrelbot] ", "color": "gold", "bold": true}, {"text": "Finished propagating puzzle changes.", "color": "green"}]
tag @a remove whimc.queue_initiator
scoreboard players set $propagate_active whimc.dummy 0
scoreboard players set $propagate_loading whimc.dummy 0
scoreboard players set $propagate_wait whimc.dummy 0
