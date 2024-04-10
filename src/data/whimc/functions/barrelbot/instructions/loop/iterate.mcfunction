#> whimc:barrelbot/instructions/loop/iterate
#   Iterates through the loop, checking the exit condition

#Add to step
execute store result score $step whimc.dummy run data get storage whimc:storage marker_data.stack[-1].step
execute store result storage whimc:storage marker_data.stack[-1].step int 1 run scoreboard players add $step whimc.dummy 1