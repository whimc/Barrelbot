#> whimc:barrelbot/no_smuggle/return_item
#   Spawns a singular item back at the hopper

execute store result score $temp whimc.barrelbot.puzzle_id run data get storage whimc:storage Inventory[0].tag.barrelbot.puzzle_id
execute at @e[type=text_display,tag=whimc.barrelbot.puzzle_manager,predicate=whimc:barrelbot/match_id] positioned ^1 ^ ^-1 run summon item ~ ~ ~ {Item:{id:"minecraft:stone",Count:1b},PickupDelay:100000000,Age:0,Tags:["whimc.item.init"]}
execute at @e[type=text_display,tag=whimc.barrelbot.puzzle_manager,predicate=whimc:barrelbot/match_id] positioned ^ ^ ^-1 run particle end_rod ~ ~ ~ 0.05 0.05 0.05 0 1 normal
execute at @e[type=text_display,tag=whimc.barrelbot.puzzle_manager,predicate=whimc:barrelbot/match_id] positioned ^ ^ ^-1 run playsound minecraft:entity.item.pickup block @a ~ ~ ~ 1.5 1

data modify entity @e[type=item,limit=1,tag=whimc.item.init] Item set from storage whimc:storage Inventory[0]
tag @e[type=item,limit=1,tag=whimc.item.init] remove whimc.item.init