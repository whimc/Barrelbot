#> whimc:barrelbot/instructions/place_block/execute
#   Places a block in front of the barrelbot

execute store success score $block_placed whimc.dummy run setblock ^ ^ ^1 minecraft:black_stained_glass keep
execute if score $block_placed whimc.dummy matches 1 positioned ^ ^ ^1 summon marker run function whimc:barrelbot/instructions/place_block/setup_marker