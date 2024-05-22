#> whimc:barrelbot/manager/start_execution
#   Begins execution of the given puzzle

scoreboard players operation $temp whimc.barrelbot.puzzle_id = @s whimc.barrelbot.puzzle_id

#Change text
data modify entity @s text set from storage whimc:const text.barrelbot.stop

#Add tag
tag @s add whimc.barrelbot.puzzle_manager.active

#Get all entities in the area and set them up
function whimc:barrelbot/manager/assign_ids

execute on passengers run data modify entity @s data.functions set from storage whimc:storage functions

function ./assign_instructors