#> whimc:barrelbot/manager/puzzle_success
#   Party time

tag @s add whimc.success

playsound minecraft:entity.player.levelup player @a ~ ~ ~ 2 1
execute at @e[type=item_display,tag=whimc.barrelbot,tag=!whimc.dispenser_bot,predicate=whimc:barrelbot/match_id] run particle happy_villager ~ ~ ~ 0.6 0.6 0.6 0 35 force

execute as @e[type=item_display,tag=whimc.barrelbot,tag=!whimc.dispenser_bot,predicate=whimc:barrelbot/match_id] run item replace entity @s container.0 with black_stained_glass_pane{CustomModelData:130001}

execute store result storage whimc:macro puzzle_type int 1 run scoreboard players get $temp whimc.barrelbot.puzzle_type_id
function whimc:barrelbot/manager/get_puzzle_name

execute as @a if score @s whimc.barrelbot.in_puzzle_id = $temp whimc.barrelbot.puzzle_id run tag @s add whimc.success_haver
tellraw @a[tag=whimc.success_haver] ["",{"text":"[Barrelbot] ","bold":true,"color":"gray"},{"selector":"@a[tag=whimc.success_haver]","color":"gold"}," has completed ",{"nbt":"puzzle_name","storage":"whimc:storage","color":"green"},"!"]
tag @a[tag=whimc.success_haver] remove whimc.success_haver