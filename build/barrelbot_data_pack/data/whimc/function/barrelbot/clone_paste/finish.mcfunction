tellraw @a[tag=whimc.queue_initiator] ["", {"text": "[Barrelbot] ", "color": "gold", "bold": true}, {"text": "Finished pasting puzzle copies.", "color": "green"}]
function whimc:barrelbot/clone_paste/unload_source_chunks
tag @a remove whimc.queue_initiator
scoreboard players set $clone_paste_active whimc.dummy 0
scoreboard players set $clone_paste_loading whimc.dummy 0
scoreboard players set $clone_paste_wait whimc.dummy 0
