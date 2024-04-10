#> whimc:barrelbot/manager/active_tick
#   Ticks the puzzle while its running

scoreboard players add @s whimc.barrelbot.step_timer 1

execute if score @s whimc.barrelbot.step_timer matches 10.. run function whimc:barrelbot/manager/step