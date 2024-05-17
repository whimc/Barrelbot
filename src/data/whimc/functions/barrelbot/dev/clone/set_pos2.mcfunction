#> whimc:barrelbot/dev/clone/set_pos2
#   Sets position two to the player's feet

execute store result score @s whimc.barrelbot.clone.x2 run data get entity @s Pos[0]
execute store result score @s whimc.barrelbot.clone.y2 run data get entity @s Pos[1]
execute store result score @s whimc.barrelbot.clone.z2 run data get entity @s Pos[2]

function whimc:barrelbot/dev/clone/send_nudge_message