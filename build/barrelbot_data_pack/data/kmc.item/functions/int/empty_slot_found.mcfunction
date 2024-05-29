data modify storage kmc.item:api item_stack.Slot set from storage kmc.item:storage Slot
data modify storage kmc.item:api container append from storage kmc.item:api item_stack
data modify storage kmc.item:api item_stack.Count set value 0
scoreboard players set #item_count kmc 0
