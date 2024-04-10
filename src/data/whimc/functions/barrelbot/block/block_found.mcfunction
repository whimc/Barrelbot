#> whimc:barrelbot/block/block_found
#   Sets up a custom block

data modify storage whimc:macro block.id set from block ~ ~ ~ Items[0].tag.whimc.block.id
function whimc:barrelbot/block/initialize with storage whimc:macro block