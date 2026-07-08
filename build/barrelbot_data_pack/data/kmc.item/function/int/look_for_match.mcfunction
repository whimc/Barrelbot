data modify storage kmc.item:storage compare1 set from storage kmc.item:api container[0]
data remove storage kmc.item:storage compare1.Count
data remove storage kmc.item:storage compare1.Slot
execute store success score #compare kmc run data modify storage kmc.item:storage compare1 set from storage kmc.item:storage compare2
execute if score #compare kmc matches 0 run function kmc.item:int/look_for_match/nested_execute_1
data modify storage kmc.item:api container append from storage kmc.item:api container[0]
data remove storage kmc.item:api container[0]
scoreboard players remove #entries kmc 1
execute if score #entries kmc matches 1.. if score #item_count kmc matches 1.. run function kmc.item:int/look_for_match
