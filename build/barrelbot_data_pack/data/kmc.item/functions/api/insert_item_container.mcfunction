execute store result score #entries kmc if data storage kmc.item:api container[]
data modify storage kmc.item:storage compare2 set from storage kmc.item:api item_stack
data remove storage kmc.item:storage compare2.Count
data remove storage kmc.item:storage compare2.Slot
execute store result score #item_count kmc run data get storage kmc.item:api item_stack.Count
execute if score #entries kmc matches 1.. run function kmc.item:int/look_for_match
execute unless score #slot_count kmc matches 1..128 run scoreboard players set #slot_count kmc 27
scoreboard players set #slot kmc 0
execute if score #item_count kmc matches 1.. run function kmc.item:int/look_for_empty_slot
