execute unless score $propagate_active whimc.dummy matches 1 run return 0
execute if score $propagate_wait whimc.dummy matches 1.. run scoreboard players remove $propagate_wait whimc.dummy 1
execute if score $propagate_wait whimc.dummy matches 1.. run return 0
execute unless data storage whimc:storage propagate_queue[0] run function whimc:barrelbot/puzzle_instance/propagate_finish
execute unless data storage whimc:storage propagate_queue[0] run return 0
execute unless score $propagate_loading whimc.dummy matches 1 run function whimc:barrelbot/puzzle_instance/propagate_load_chunk
execute unless score $propagate_loading whimc.dummy matches 1 run return 0
data modify storage whimc:macro target set from storage whimc:storage propagate_queue[0]
$execute positioned $(x) $(y) $(z) unless loaded ~ ~ ~ run scoreboard players set $propagate_wait whimc.dummy 10
$execute positioned $(x) $(y) $(z) unless loaded ~ ~ ~ run return 0
function whimc:barrelbot/puzzle_instance/propagate_process_target
function whimc:barrelbot/puzzle_instance/propagate_unload_chunk
data remove storage whimc:storage propagate_queue[0]
scoreboard players set $propagate_loading whimc.dummy 0
scoreboard players set $propagate_wait whimc.dummy 5
