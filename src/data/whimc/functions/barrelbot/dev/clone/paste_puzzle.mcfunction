#> whimc:barrelbot/dev/clone/paste_puzzle
#   Pastes the puzzle

scoreboard players operation $temp whimc.barrelbot.puzzle_id = @s whimc.barrelbot.puzzle_id

# If there's currently a puzzle entity here, replace it
execute align xyz as @e[type=text_display,tag=whimc.barrelbot.puzzle_manager,dx=0,dy=0,dz=0] at @s run function whimc:barrelbot/manager/delete_puzzle

#Get center coordinates
execute store result score $paste_x whimc.dummy run data get entity @s Pos[0]
execute store result score $paste_y whimc.dummy run data get entity @s Pos[1]
execute store result score $paste_z whimc.dummy run data get entity @s Pos[2]
#
##Get source min and max coordinates
#scoreboard players operation $min_source_x whimc.dummy = @s whimc.barrelbot.clone.x1
#scoreboard players operation $min_source_x whimc.dummy < @s whimc.barrelbot.clone.x2
#scoreboard players operation $min_source_y whimc.dummy = @s whimc.barrelbot.clone.y1
#scoreboard players operation $min_source_y whimc.dummy < @s whimc.barrelbot.clone.y2
#scoreboard players operation $min_source_z whimc.dummy = @s whimc.barrelbot.clone.z1
#scoreboard players operation $min_source_z whimc.dummy < @s whimc.barrelbot.clone.z2
#
#scoreboard players operation $max_source_x whimc.dummy = @s whimc.barrelbot.clone.x1
#scoreboard players operation $max_source_x whimc.dummy > @s whimc.barrelbot.clone.x2
#scoreboard players operation $max_source_y whimc.dummy = @s whimc.barrelbot.clone.y1
#scoreboard players operation $max_source_y whimc.dummy > @s whimc.barrelbot.clone.y2
#scoreboard players operation $max_source_z whimc.dummy = @s whimc.barrelbot.clone.z1
#scoreboard players operation $max_source_z whimc.dummy > @s whimc.barrelbot.clone.z2
#
##Get dimensions of bounding box
#scoreboard players operation $vol_x whimc.dummy = $max_source_x whimc.dummy
#scoreboard players operation $vol_x whimc.dummy -= $min_source_x whimc.dummy
#scoreboard players operation $vol_y whimc.dummy = $max_source_y whimc.dummy
#scoreboard players operation $vol_y whimc.dummy -= $min_source_y whimc.dummy
#scoreboard players operation $vol_z whimc.dummy = $max_source_z whimc.dummy
#scoreboard players operation $vol_z whimc.dummy -= $min_source_z whimc.dummy
#
##Cancel if not bound to a puzzle
#execute unless entity @s[tag=whimc.barrelbot.cloning] run tellraw @s {"text":"Not bound to a puzzle!","color":"red"}
#execute unless entity @s[tag=whimc.barrelbot.cloning] run return 0

execute unless entity @e[type=text_display,tag=whimc.barrelbot.puzzle_manager,predicate=whimc:barrelbot/match_id] run tellraw @s {"text":"Not bound to a puzzle!","color":"red"}
execute unless entity @e[type=text_display,tag=whimc.barrelbot.puzzle_manager,predicate=whimc:barrelbot/match_id] run return 0

#Run all cloning stuff from the manager entity (but positioned at the player)
execute as @e[type=text_display,tag=whimc.barrelbot.puzzle_manager,limit=1,predicate=whimc:barrelbot/match_id] run function whimc:barrelbot/clone/clone_as_manager
