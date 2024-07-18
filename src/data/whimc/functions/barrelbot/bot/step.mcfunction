#> whimc:barrelbot/bot/step
#   Steps the barrel bot forward once through its instructions

#> Need to make a way to track the current state of the system
#   Maybe stack-based?
#   Index based
#   Can literally just use an array of indices to represent the stack
#   How to do while loops?
#       When entering a while loop, keep track of starting point
#       When execution completes, pop index off of stack

scoreboard players operation $temp whimc.barrelbot.bot_id = @s whimc.barrelbot.bot_id
scoreboard players set $queued_instruction whimc.dummy 0
data modify storage whimc:storage DisplayArcs set value []
scoreboard players set $arc_count whimc.dummy 0

#Get stack data from the barrelbot
function whimc:barrelbot/bot/grab_marker_data

#If there were previous push_forwards queued, run them now
#execute if score @s whimc.barrelbot.push_count matches 1.. as @e[type=item_display,tag=whimc.execution_display,predicate=whimc:barrelbot/match_bot_id] run function whimc:barrelbot/display/push_forward
execute if score @s whimc.barrelbot.push_count matches 1.. run function whimc:barrelbot/display/push_forward_loop

#Update visual cursor on display
execute at @s as @e[type=item_display,tag=whimc.execution_display_cursor,predicate=whimc:barrelbot/match_bot_id,scores={whimc.barrelbot.display_layer=0}] run function whimc:barrelbot/display/update_cursor

#If execution has completed, don't do anything
execute unless data storage whimc:storage marker_data.stack[] run return 0

#Debug toggle
#tellraw @p {"nbt":"marker_data.stack","storage":"whimc:storage"}
#tellraw @p {"text":""}

#Get the individual instruction to be called
function whimc:barrelbot/bot/grab_slot

function whimc:barrelbot/instructions/general/execute_instruction with storage whimc:storage current_step

#Iterate forward
execute store result score $step whimc.dummy run data get storage whimc:storage marker_data.stack[-1].step
execute store result storage whimc:storage marker_data.stack[-1].step int 1 run scoreboard players add $step whimc.dummy 1

function whimc:barrelbot/functions/check_step_out

#Update execution display
scoreboard players operation $temp whimc.barrelbot.bot_id = @s whimc.barrelbot.bot_id
execute at @s as @e[type=item_display,tag=whimc.execution_display,predicate=whimc:barrelbot/match_bot_id] run function whimc:barrelbot/display/update

execute at @s if block ~ ~-1 ~ lime_concrete on passengers run data remove storage whimc:storage marker_data.stack[]
execute at @s if block ~ ~-1 ~ black_concrete run function whimc:barrelbot/functions/recursion_limit_reached

#Write data back to marker
function whimc:barrelbot/bot/write_marker_data

#Display function arcs if there are any to display
execute if score $arc_count whimc.dummy matches 1.. run function whimc:barrelbot/functions/display_arcs

#If there is a queued instruction, repeat this process. (This only goes if an if statement fails)
execute if score $queued_instruction whimc.dummy matches 1 at @s run function whimc:barrelbot/bot/step