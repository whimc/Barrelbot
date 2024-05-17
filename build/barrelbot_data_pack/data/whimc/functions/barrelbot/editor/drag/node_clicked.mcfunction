data remove entity @s interaction
scoreboard players operation $temp whimc.barrelbot.node_id = @s whimc.barrelbot.node_id
execute if score $dragging whimc.dummy matches 0 run playsound minecraft:entity.item_frame.remove_item player @a ~ ~ ~ 1 1.3
execute if score $dragging whimc.dummy matches 1 run playsound minecraft:entity.item_frame.remove_item player @a ~ ~ ~ 1 0.9
