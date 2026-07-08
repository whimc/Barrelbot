execute if score $propagate_active whimc.dummy matches 1 run function whimc:barrelbot/clone_paste/busy
execute if score $propagate_active whimc.dummy matches 1 run return 0
execute if score $clone_paste_active whimc.dummy matches 1 run function whimc:barrelbot/clone_paste/busy
execute if score $clone_paste_active whimc.dummy matches 1 run return 0
execute store result score $clone_paste_count whimc.dummy if data storage whimc:storage clone_paste_queue[]
execute if score $clone_paste_count whimc.dummy matches 0 run tellraw @a[tag=whimc.queue_initiator] ["", {"text": "[Barrelbot] ", "color": "gold", "bold": true}, {"text": "No paste locations in queue.", "color": "yellow"}]
execute if score $clone_paste_count whimc.dummy matches 0 run tag @a remove whimc.queue_initiator
execute if score $clone_paste_count whimc.dummy matches 0 run return 0
tellraw @a[tag=whimc.queue_initiator] ["", {"text": "[Barrelbot] ", "color": "gold", "bold": true}, {"text": "Pasting ", "color": "white"}, {"score": {"name": "$clone_paste_count", "objective": "whimc.dummy"}, "color": "aqua"}, {"text": " puzzle copy/copies (loading chunks as needed)...", "color": "white"}]
function whimc:barrelbot/clone_paste/load_source_chunks
scoreboard players set $clone_paste_active whimc.dummy 1
scoreboard players set $clone_paste_loading whimc.dummy 0
scoreboard players set $clone_paste_wait whimc.dummy 0
