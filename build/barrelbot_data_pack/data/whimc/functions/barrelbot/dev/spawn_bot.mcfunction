execute unless block ~ ~ ~ barrel run setblock ~ ~ ~ minecraft:barrel[facing=up]{CustomName: '{"text":"Barrelbot"}'}
execute summon marker run function whimc:barrelbot/manager/get_execution_direction
execute align xyz positioned ~0.5 ~0.5 ~0.5 summon item_display run function whimc:barrelbot/bot/setup
