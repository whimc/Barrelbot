tag @s add whimc.in_puzzle
execute store result score @s whimc.barrelbot.in_puzzle_id run data get storage whimc:storage Inventory[{tag: {barrelbot: {puzzle_item: 1b}}}].tag.barrelbot.puzzle_id
scoreboard players operation $temp whimc.barrelbot.puzzle_id = @s whimc.barrelbot.in_puzzle_id
execute as @e[type=text_display, tag=whimc.barrelbot.puzzle_manager, limit=1, predicate=whimc:barrelbot/match_id] on passengers run data modify storage whimc:storage bounding_box set from entity @s data.bounding_box
execute store result score $min_x whimc.dummy run data get storage whimc:storage bounding_box.min_x
execute store result score $min_y whimc.dummy run data get storage whimc:storage bounding_box.min_y
execute store result score $min_z whimc.dummy run data get storage whimc:storage bounding_box.min_z
execute store result score $max_x whimc.dummy run data get storage whimc:storage bounding_box.max_x
execute store result score $max_y whimc.dummy run data get storage whimc:storage bounding_box.max_y
execute store result score $max_z whimc.dummy run data get storage whimc:storage bounding_box.max_z
scoreboard players operation @s whimc.barrelbot.bound_x = $min_x whimc.dummy
scoreboard players operation @s whimc.barrelbot.bound_x < $max_x whimc.dummy
scoreboard players operation @s whimc.barrelbot.bound_y = $min_y whimc.dummy
scoreboard players operation @s whimc.barrelbot.bound_y < $max_y whimc.dummy
scoreboard players operation @s whimc.barrelbot.bound_z = $min_z whimc.dummy
scoreboard players operation @s whimc.barrelbot.bound_z < $max_z whimc.dummy
scoreboard players operation @s whimc.barrelbot.bound_dx = $min_x whimc.dummy
scoreboard players operation @s whimc.barrelbot.bound_dx > $max_x whimc.dummy
scoreboard players operation @s whimc.barrelbot.bound_dy = $min_y whimc.dummy
scoreboard players operation @s whimc.barrelbot.bound_dy > $max_y whimc.dummy
scoreboard players operation @s whimc.barrelbot.bound_dz = $min_z whimc.dummy
scoreboard players operation @s whimc.barrelbot.bound_dz > $max_z whimc.dummy
scoreboard players operation @s whimc.barrelbot.bound_dx -= @s whimc.barrelbot.bound_x
scoreboard players operation @s whimc.barrelbot.bound_dy -= @s whimc.barrelbot.bound_y
scoreboard players operation @s whimc.barrelbot.bound_dz -= @s whimc.barrelbot.bound_z
