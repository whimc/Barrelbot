execute align xyz run tp @s ~0.5 ~ ~0.5
execute as @s[tag=whimc.min_node] at @s run function whimc:barrelbot/dev/set_lower_bound
execute as @s[tag=whimc.max_node] at @s run function whimc:barrelbot/dev/set_upper_bound
execute at @s run particle dust 1.0 0.7 0.2 0.8 ~ ~0.5 ~ 0.3 0.3 0.3 0 1
