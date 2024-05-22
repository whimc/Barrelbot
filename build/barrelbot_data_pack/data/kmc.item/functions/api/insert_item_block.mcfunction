data modify storage kmc.item:api container set from block ~ ~ ~ Items
execute unless data block ~ ~ ~ Items run data modify storage kmc.item:api container set value []
scoreboard players set #slot_count kmc.dummy 27
function kmc.item:api/insert_item_container
data modify block ~ ~ ~ Items set from storage kmc.item:api container
