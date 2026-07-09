execute if data storage whimc:storage Items[0].item.id run data modify storage whimc:storage Items[0].id set from storage whimc:storage Items[0].item.id
execute if data storage whimc:storage Items[0].item.count run data modify storage whimc:storage Items[0].count set from storage whimc:storage Items[0].item.count
execute if data storage whimc:storage Items[0].item.components run data modify storage whimc:storage Items[0].components set from storage whimc:storage Items[0].item.components
execute if data storage whimc:storage Items[0].slot run execute store result storage whimc:storage Items[0].Slot byte 1 run data get storage whimc:storage Items[0].slot
execute unless data storage whimc:storage Items[0].Count if data storage whimc:storage Items[0].count run data modify storage whimc:storage Items[0].Count set from storage whimc:storage Items[0].count
execute if data storage whimc:storage Items[0].tag.barrelbot unless data storage whimc:storage Items[0].components."minecraft:custom_data".barrelbot run data modify storage whimc:storage Items[0].components."minecraft:custom_data".barrelbot set from storage whimc:storage Items[0].tag.barrelbot
data modify storage whimc:storage Items append from storage whimc:storage Items[0]
data remove storage whimc:storage Items[0]
scoreboard players remove $item_count whimc.dummy 1
execute if score $item_count whimc.dummy matches 1.. run function whimc:barrelbot/bot/canonicalize_item_entry
