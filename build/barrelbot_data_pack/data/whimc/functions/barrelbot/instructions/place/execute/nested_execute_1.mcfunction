data modify storage whimc:storage stack_entry set from storage whimc:storage marker_data.block_stack[-1]
data remove storage whimc:storage marker_data.block_stack[-1]
execute positioned ^ ^ ^1 summon marker run function whimc:barrelbot/instructions/place/execute/nested_execute_0
