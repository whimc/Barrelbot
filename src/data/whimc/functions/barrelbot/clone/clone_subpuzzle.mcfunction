#> whimc:barrelbot/clone/clone_subpuzzle
#   Clones a subpuzzle

scoreboard players operation $temp whimc.barrelbot.puzzle_id = @s whimc.barrelbot.puzzle_id

execute store result score $manager_offset_x whimc.dummy run data get entity @s Pos[0]
execute store result score $manager_offset_y whimc.dummy run data get entity @s Pos[1]
execute store result score $manager_offset_z whimc.dummy run data get entity @s Pos[2]

scoreboard players operation $temp_source_x whimc.dummy = $manager_offset_x whimc.dummy
scoreboard players operation $temp_source_y whimc.dummy = $manager_offset_y whimc.dummy
scoreboard players operation $temp_source_z whimc.dummy = $manager_offset_z whimc.dummy
scoreboard players operation $old_source_x whimc.dummy = $source_x whimc.dummy
scoreboard players operation $old_source_y whimc.dummy = $source_y whimc.dummy
scoreboard players operation $old_source_z whimc.dummy = $source_z whimc.dummy


scoreboard players operation $manager_offset_x whimc.dummy -= $source_x whimc.dummy
scoreboard players operation $manager_offset_y whimc.dummy -= $source_y whimc.dummy
scoreboard players operation $manager_offset_z whimc.dummy -= $source_z whimc.dummy

execute store result storage whimc:macro Pos.x int 1 run scoreboard players operation $manager_offset_x whimc.dummy += $paste_x whimc.dummy
execute store result storage whimc:macro Pos.y int 1 run scoreboard players operation $manager_offset_y whimc.dummy += $paste_y whimc.dummy
execute store result storage whimc:macro Pos.z int 1 run scoreboard players operation $manager_offset_z whimc.dummy += $paste_z whimc.dummy

#Create the new puzzle
function whimc:barrelbot/clone/position_subpuzzle_clone with storage whimc:macro Pos

#Get coordinates
scoreboard players operation $source_x whimc.dummy = $temp_source_x whimc.dummy
scoreboard players operation $source_y whimc.dummy = $temp_source_y whimc.dummy
scoreboard players operation $source_z whimc.dummy = $temp_source_z whimc.dummy

#Clone entities
scoreboard players operation $temp whimc.barrelbot.puzzle_id = $new_id whimc.barrelbot.puzzle_id
execute at @e[type=text_display,tag=whimc.barrelbot.puzzle_manager,predicate=whimc:barrelbot/match_id] run function whimc:barrelbot/clone/clone_entities

scoreboard players operation $source_x whimc.dummy = $old_source_x whimc.dummy
scoreboard players operation $source_y whimc.dummy = $old_source_y whimc.dummy
scoreboard players operation $source_z whimc.dummy = $old_source_z whimc.dummy