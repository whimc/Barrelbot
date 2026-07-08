scoreboard players set $block_found whimc.dummy 0
scoreboard players set $block_success whimc.dummy 0
execute positioned ^ ^ ^1 run function whimc:instructions/check_not_loop
scoreboard players set $code_block_depth whimc.dummy 0
execute if score $block_success whimc.dummy matches 0 run function whimc:barrelbot/instructions/if/failure
execute if score $block_success whimc.dummy matches 1 run function whimc:barrelbot/instructions/if/success
execute at @s as @e[type=item_display, tag=whimc.execution_display_cursor, predicate=whimc:barrelbot/match_bot_id, scores={whimc.barrelbot.display_layer=0}] run function whimc:barrelbot/display/update_cursor
