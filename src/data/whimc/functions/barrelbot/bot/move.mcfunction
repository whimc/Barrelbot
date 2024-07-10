#> whimc:barrelbot/bot/move
#   Moves the barrelbot if it is able to

#> INPUTS
#   - whimc:macro destination    < The relative location to attempt to move the barrelbot to formatted as a string ("~x ~y ~z")

# Simple case: No stack
execute if score @s whimc.barrelbot.stack_height matches 0 with storage whimc:macro:
    $execute unless block $(destination) #whimc:air run return 1
    $clone ~ ~ ~ ~ ~ ~ $(destination) masked move
    $tp @s $(destination)

execute if score @s whimc.barrelbot.stack_height matches 0 run return 0

# Complex case: Move with stack
scoreboard players operation $temp whimc.dummy = @s whimc.barrelbot.stack_height
execute store result storage whimc:macro stack_height int 1 run scoreboard players add $temp whimc.dummy 1

with storage whimc:macro:
    # Check if area is free
    scoreboard players set $area_free whimc.dummy 1
    scoreboard players operation $loop_count whimc.dummy = @s whimc.barrelbot.stack_height
    $execute positioned $(destination) run function whimc:barrelbot/bot/check_area_loop

    # If the area is free, move the stack
    execute if score $area_free whimc.dummy matches 0 run return 0

    $clone ~ ~ ~ ~ ~$(stack_height) ~ $(destination) masked move
    $tp @s $(destination)

function ./check_area_loop:
    execute unless block ~ ~ ~ air run scoreboard players set $area_free whimc.dummy 0
    scoreboard players remove $loop_count whimc.dummy 1

    # Note: Checking 0 instead of 1 here because we need to go 1 extra block to check the barrel itself
    execute if score $loop_count whimc.dummy matches 0.. positioned ~ ~1 ~ run function ./check_area_loop
