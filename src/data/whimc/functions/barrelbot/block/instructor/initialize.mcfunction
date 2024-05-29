#> whimc:barrelbot/block/barrelbot/initialize
#   Sets up a barrelbot block when it is placed

execute summon marker run function whimc:barrelbot/manager/get_execution_direction
setblock ~ ~ ~ air
setblock ~ ~ ~ yellow_shulker_box[facing=up]{CustomName:"Instructor"}

execute align xyz positioned ~0.5 ~0.5 ~0.5 summon item_display run function ./setup

function ./get_linked_puzzle