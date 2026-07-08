setblock ~ ~ ~ barrel[facing=up]{CustomName: '{"text":"Barrelbot"}'}
data modify block ~ ~ ~ Items set from storage whimc:storage Items
execute if entity @s[tag=whimc.barrelbot.locked] run function whimc:barrelbot/bot/reset/nested_execute_0
