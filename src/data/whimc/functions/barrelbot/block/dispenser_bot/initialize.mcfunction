#> whimc:barrelbot/block/barrelbot/initialize
#   Sets up a barrelbot block when it is placed

execute summon marker run function whimc:barrelbot/manager/get_execution_direction
setblock ~ ~ ~ air
setblock ~ ~ ~ dispenser[facing=up]

execute align xyz positioned ~0.5 ~0.5 ~0.5 summon item_display:
    function whimc:barrelbot/bot/setup
    function whimc:barrelbot/dispenser_bot/convert