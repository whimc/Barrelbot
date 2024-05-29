execute store result storage kmc.item:storage Slot byte 1 run scoreboard players get #slot kmc
function kmc.item:int/look_for_empty_slot/nested_macro_0 with storage kmc.item:storage
scoreboard players add #slot kmc 1
execute if score #slot kmc < #slot_count kmc unless score #item_count kmc matches 0 run function kmc.item:int/look_for_empty_slot
