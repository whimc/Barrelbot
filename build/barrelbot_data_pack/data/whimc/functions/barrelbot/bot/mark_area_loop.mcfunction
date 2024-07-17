summon marker ~ ~ ~ {Tags: ["whimc.barrelbot.move_marker"]}
scoreboard players remove $loop_count whimc.dummy 1
execute if score $loop_count whimc.dummy matches 1.. positioned ~ ~1 ~ run function whimc:barrelbot/bot/mark_area_loop
