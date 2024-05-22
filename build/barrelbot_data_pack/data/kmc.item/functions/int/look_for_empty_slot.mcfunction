execute store result storage kmc.item:storage Slot byte 1 run scoreboard players get #slot kmc.dummy
function kmc.item:int/look_for_empty_slot/nested_macro_0 with storage kmc.item:storage
scoreboard players add #slot kmc.dummy 1
execute if score #slot kmc.dummy < #slot_count kmc.dummy unless score #item_count kmc.dummy matches 0 run function kmc.item:int/look_for_empty_slot
