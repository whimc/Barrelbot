#> whimc:barrelbot/manager/get_execution_direction

tp @s ~ ~ ~ ~ ~

execute if entity @s[y_rotation=-45..45] run scoreboard players set $direction whimc.dummy 0
execute if entity @s[y_rotation=45..135] run scoreboard players set $direction whimc.dummy 1
execute if entity @s[y_rotation=135..225] run scoreboard players set $direction whimc.dummy 2
execute if entity @s[y_rotation=225..315] run scoreboard players set $direction whimc.dummy 3

kill @s