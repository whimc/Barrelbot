setblock ~ ~ ~ barrel[facing=up]{components:{"minecraft:custom_name":{text:"Barrelbot",color:"#FFFF55",italic:false}}}
data modify block ~ ~ ~ Items set from storage whimc:storage Items
execute if entity @s[tag=whimc.barrelbot.locked] run function whimc:barrelbot/bot/reset/nested_execute_0
