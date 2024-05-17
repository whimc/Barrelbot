execute summon marker run function whimc:barrelbot/manager/get_execution_direction
setblock ~ ~ ~ air
setblock ~ ~ ~ barrel[facing=up]
execute align xyz positioned ~0.5 ~0.5 ~0.5 summon item_display run function whimc:barrelbot/bot/setup
