tag @s add whimc.barrelbot.locked
data modify block ~ ~ ~ components."minecraft:lock" set value {predicates:{"minecraft:custom_name":{text:"_LOCKTYPE: PERMALOCK"}}}
