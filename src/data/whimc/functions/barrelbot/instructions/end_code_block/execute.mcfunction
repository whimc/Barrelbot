#> whimc:barrelbot/instructions/end_code_block/execute
#   Ends the current code block (if inside of one)
#   This function should not actually do anything, this should never be called

return 0

#Exit if not in a code block ############################################################
execute unless data storage whimc:storage marker_data.stack[-1].code_block run return 0
# #######################################################################################

execute store success score $in_loop whimc.dummy if data storage whimc:storage marker_data.stack[-1].loop
#> IF IN LOOP

execute if score $in_loop whimc.dummy matches 1 run function whimc:barrelbot/instructions/loop/end_code_block






#If the code block was successfully exited, step forward 
