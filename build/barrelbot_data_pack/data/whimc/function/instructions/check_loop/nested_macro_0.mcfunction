scoreboard players set $block_found whimc.dummy 1
$execute if block ~ ~ ~ $(id) run function whimc:instructions/block_success
execute if score $block_success whimc.dummy matches 0 run function whimc:instructions/block_failure
data remove storage whimc:storage current_check
