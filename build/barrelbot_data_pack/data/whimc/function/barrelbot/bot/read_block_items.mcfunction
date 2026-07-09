data modify storage whimc:storage Items set value []
execute if data block ~ ~ ~ Items[] run data modify storage whimc:storage Items set from block ~ ~ ~ Items
execute if data block ~ ~ ~ items[] unless data storage whimc:storage Items[] run data modify storage whimc:storage Items set from block ~ ~ ~ items
execute if data block ~ ~ ~ components."minecraft:container"[] unless data storage whimc:storage Items[] run data modify storage whimc:storage Items set from block ~ ~ ~ components."minecraft:container"
execute if data block ~ ~ ~ components."minecraft:container".items[] unless data storage whimc:storage Items[] run data modify storage whimc:storage Items set from block ~ ~ ~ components."minecraft:container".items
