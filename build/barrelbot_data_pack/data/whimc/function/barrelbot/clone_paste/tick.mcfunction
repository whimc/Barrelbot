execute unless score $clone_paste_active whimc.dummy matches 1 run return 0
execute if score $clone_paste_wait whimc.dummy matches 1.. run scoreboard players remove $clone_paste_wait whimc.dummy 1
execute if score $clone_paste_wait whimc.dummy matches 1.. run return 0
execute unless data storage whimc:storage clone_paste_queue[0] run function whimc:barrelbot/clone_paste/finish
execute unless data storage whimc:storage clone_paste_queue[0] run return 0
execute unless score $clone_paste_loading whimc.dummy matches 1 run function whimc:barrelbot/clone_paste/load_dest_chunks
execute unless score $clone_paste_loading whimc.dummy matches 1 run return 0
data modify storage whimc:macro target set from storage whimc:storage clone_paste_queue[0]
$execute positioned $(x) $(y) $(z) unless loaded ~ ~ ~ run scoreboard players set $clone_paste_wait whimc.dummy 10
$execute positioned $(x) $(y) $(z) unless loaded ~ ~ ~ run return 0
function whimc:barrelbot/clone_paste/process_entry
function whimc:barrelbot/clone_paste/unload_dest_chunks
data remove storage whimc:storage clone_paste_queue[0]
scoreboard players set $clone_paste_loading whimc.dummy 0
scoreboard players set $clone_paste_wait whimc.dummy 5
