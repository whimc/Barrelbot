#> whimc:barrelbot/clone/manager_setup
#   Sets up a cloned manager entity

#Perform all normal setup
function whimc:barrelbot/manager/setup

scoreboard players operation @s whimc.barrelbot.puzzle_type_id = $temp whimc.barrelbot.puzzle_type_id

function whimc:barrelbot/clone/get_new_hitbox