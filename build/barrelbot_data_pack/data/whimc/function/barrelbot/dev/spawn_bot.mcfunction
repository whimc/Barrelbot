execute unless block ~ ~ ~ barrel run setblock ~ ~ ~ minecraft:barrel[facing=up]{components:{"minecraft:custom_name":{text:"Barrelbot",color:"#FFFF55",italic:false}}}
execute summon marker run function whimc:barrelbot/manager/get_execution_direction
execute align xyz positioned ~0.5 ~0.5 ~0.5 summon item_display run function whimc:barrelbot/bot/setup
