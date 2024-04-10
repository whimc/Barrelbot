function whimc:barrelbot/instructions/if/check_condition with storage whimc:storage current_step
scoreboard players set $code_block_depth whimc.dummy 0
execute if score $success whimc.dummy matches 0 run function whimc:barrelbot/instructions/if/failure
execute if score $success whimc.dummy matches 0 run scoreboard players set $queued_instruction whimc.dummy 1
execute if score $success whimc.dummy matches 1 run function whimc:barrelbot/instructions/loop/while/begin
