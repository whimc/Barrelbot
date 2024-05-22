scoreboard players set #max_stack_size kmc.dummy 64
execute store result score #slot_item_count kmc.dummy run data get storage kmc.item:api container[0].Count
scoreboard players operation #slot_item_count kmc.dummy += #item_count kmc.dummy
scoreboard players set #item_count kmc.dummy 0
execute if score #slot_item_count kmc.dummy > #max_stack_size kmc.dummy run function kmc.item:int/look_for_match/nested_execute_0
execute store result storage kmc.item:api item_stack.Count byte 1 run scoreboard players get #item_count kmc.dummy
execute store result storage kmc.item:api container[0].Count byte 1 run scoreboard players get #slot_item_count kmc.dummy
