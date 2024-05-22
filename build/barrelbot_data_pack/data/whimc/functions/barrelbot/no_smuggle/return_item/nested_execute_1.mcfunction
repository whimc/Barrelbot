function kmc.item:api/insert_item_block
playsound minecraft:entity.item.pickup block @a ~ ~ ~ 1.5 1
execute if score #item_count kmc.dummy matches 1.. run function whimc:barrelbot/no_smuggle/return_item/nested_execute_0
data modify storage whimc:storage Pos set from entity @s Pos
execute store result score $x2 whimc.dummy run data get storage whimc:storage Pos[0] 1000
execute store result score $y2 whimc.dummy run data get storage whimc:storage Pos[1] 1000
execute store result score $z2 whimc.dummy run data get storage whimc:storage Pos[2] 1000
function whimc:barrelbot/no_smuggle/display_item_return
