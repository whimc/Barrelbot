scoreboard players add @s whimc.barrelbot.stack_height 1
function whimc:barrelbot/bot/grab_marker_data
data modify storage whimc:storage marker_data.block_stack append from storage whimc:storage stack_entry
function whimc:barrelbot/bot/write_marker_data
