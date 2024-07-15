#> whimc:barrelbot/clone/manager_setup
#   Sets up a cloned manager entity

#Perform all normal setup
function whimc:barrelbot/manager/setup

#Clone success condition data
execute on passengers run say hi
execute on passengers run data modify entity @s data.success_function set from storage whimc:storage clone.success_function

scoreboard players operation @s whimc.barrelbot.puzzle_type_id = $temp whimc.barrelbot.puzzle_type_id

function whimc:barrelbot/clone/get_new_hitbox