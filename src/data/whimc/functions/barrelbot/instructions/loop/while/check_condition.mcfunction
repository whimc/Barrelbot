#> whimc:barrelbot/instructions/loop/while/check_condition
#   Checks if a while loop should be exited

execute at @s run function whimc:barrelbot/instructions/if/check_condition with storage whimc:storage marker_data.stack[-1]

execute if score $success whimc.dummy matches 0 run scoreboard players set $exit_loop whimc.dummy 1