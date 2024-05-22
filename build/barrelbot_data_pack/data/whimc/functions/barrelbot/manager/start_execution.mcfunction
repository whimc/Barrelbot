scoreboard players operation $temp whimc.barrelbot.puzzle_id = @s whimc.barrelbot.puzzle_id
data modify entity @s text set from storage whimc:const text.barrelbot.stop
tag @s add whimc.barrelbot.puzzle_manager.active
function whimc:barrelbot/manager/assign_ids
execute on passengers run data modify entity @s data.functions set from storage whimc:storage functions
function whimc:barrelbot/manager/assign_instructors
