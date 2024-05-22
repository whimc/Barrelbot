summon item ~ ~0.8 ~ {Item: {id: "minecraft:stone", Count: 1b}, PickupDelay: 20, Age: 0, Tags: ["whimc.item.init"], Motion: [0.0d, 0.25d, 0.0d]}
data modify entity @e[type=item, limit=1, tag=whimc.item.init] Item set from storage kmc.item:api item_stack
tag @e[type=item, limit=1, tag=whimc.item.init] remove whimc.item.init
