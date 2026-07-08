execute store result score $step whimc.dummy run data get storage whimc:storage marker_data.stack[-1].step
execute store result score $max_step whimc.dummy run data get storage whimc:storage marker_data.stack[-1].length
execute if score $step whimc.dummy > $max_step whimc.dummy run function whimc:barrelbot/functions/pop_stack
