#> whimc:barrelbot/no_smuggle/receive_puzzle_item
#   When a player receives a puzzle item, either mark them for boundary checking or check if they have an invalid item

advancement revoke @s only whimc:inventory/receive_puzzle_item

execute store success score $in_puzzle whimc.dummy if entity @s[tag=whimc.in_puzzle]
data modify storage whimc:storage Inventory set from entity @s Inventory

execute if score $in_puzzle whimc.dummy matches 0 run function whimc:barrelbot/no_smuggle/assign_id
execute store result storage whimc:macro puzzle_id.id int 1 run scoreboard players get @s whimc.barrelbot.in_puzzle_id
function whimc:barrelbot/no_smuggle/scan_for_mismatch with storage whimc:macro puzzle_id