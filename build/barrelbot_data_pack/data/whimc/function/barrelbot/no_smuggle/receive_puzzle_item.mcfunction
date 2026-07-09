advancement revoke @s only whimc:inventory/receive_puzzle_item
data modify storage whimc:storage Inventory set from entity @s Inventory
function whimc:barrelbot/no_smuggle/assign_id
execute store result storage whimc:macro puzzle_id.id int 1 run scoreboard players get @s whimc.barrelbot.in_puzzle_id
function whimc:barrelbot/no_smuggle/scan_for_mismatch with storage whimc:macro puzzle_id
