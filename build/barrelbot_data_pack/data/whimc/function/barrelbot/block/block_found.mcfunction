data modify storage whimc:macro block set value {id:""}
execute if data block ~ ~ ~ Items[0].components."minecraft:custom_data".whimc.block.id run data modify storage whimc:macro block.id set from block ~ ~ ~ Items[0].components."minecraft:custom_data".whimc.block.id
execute unless data storage whimc:macro block.id run execute if data block ~ ~ ~ Items[0].tag.whimc.block.id run data modify storage whimc:macro block.id set from block ~ ~ ~ Items[0].tag.whimc.block.id
execute unless data storage whimc:macro block.id run execute if data block ~ ~ ~ Items[0].components."minecraft:custom_data".whimc.block.id run data modify storage whimc:macro block.id set from block ~ ~ ~ items[0].components."minecraft:custom_data".whimc.block.id
execute unless data storage whimc:macro block.id run execute if data block ~ ~ ~ items[0].item.components."minecraft:custom_data".whimc.block.id run data modify storage whimc:macro block.id set from block ~ ~ ~ items[0].item.components."minecraft:custom_data".whimc.block.id
function whimc:barrelbot/block/initialize with storage whimc:macro block
