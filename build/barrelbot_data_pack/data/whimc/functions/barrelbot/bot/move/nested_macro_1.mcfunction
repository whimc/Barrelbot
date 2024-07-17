scoreboard players set $area_free whimc.dummy 1
scoreboard players operation $loop_count whimc.dummy = @s whimc.barrelbot.stack_height
$execute positioned $(destination) align xyz run function whimc:barrelbot/bot/check_area_loop
kill @e[type=marker, tag=whimc.barrelbot.move_marker]
execute if score $area_free whimc.dummy matches 0 run return 0
$clone ~ ~ ~ ~ ~$(stack_height) ~ $(destination) masked move
$tp @s $(destination)
