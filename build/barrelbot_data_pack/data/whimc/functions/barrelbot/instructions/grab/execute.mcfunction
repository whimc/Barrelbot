scoreboard players operation $temp whimc.dummy = @s whimc.barrelbot.stack_height
execute store result storage whimc:macro stack_height int 1 run scoreboard players add $temp whimc.dummy 1
scoreboard players set $stack_success whimc.dummy 0
execute positioned ^ ^ ^1 align xyz if entity @e[type=item_display, tag=whimc.barrelbot, dx=0, dy=0, dz=0] run return 0
function whimc:barrelbot/instructions/grab/execute/nested_macro_0 with storage whimc:macro
execute if score $stack_success whimc.dummy matches 0 run return 0
function whimc:barrelbot/bot/grab_marker_data
execute positioned ^ ^ ^1 summon marker run function whimc:barrelbot/clone/get_pos
data modify storage whimc:storage stack_entry set value {}
execute store result storage whimc:storage stack_entry.x int 1 run data get storage whimc:storage Pos[0]
execute store result storage whimc:storage stack_entry.y int 1 run data get storage whimc:storage Pos[1]
execute store result storage whimc:storage stack_entry.z int 1 run data get storage whimc:storage Pos[2]
scoreboard players set $dropped_block whimc.dummy 0
execute positioned ^ ^ ^1 align xyz store success score $dropped_block whimc.dummy if entity @e[type=marker, tag=whimc.barrelbot.dropped_block, dx=0, dy=0, dz=0]
execute if score $dropped_block whimc.dummy matches 1 run function whimc:barrelbot/instructions/grab/execute/nested_execute_0
data modify storage whimc:storage marker_data.block_stack append from storage whimc:storage stack_entry
function whimc:barrelbot/bot/write_marker_data
