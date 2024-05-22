execute rotated as @s rotated ~180 ~ run function whimc:barrelbot/block/instructor/initialize
data modify entity @e[type=item_display, tag=whimc.instructor, limit=1, sort=nearest] item.tag.Items set from storage whimc:storage Items
data modify block ~ ~ ~ Items set from storage whimc:storage Items
