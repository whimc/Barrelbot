#> whimc:barrelbot/editor/drag/node_clicked
#   Commands run as the node clicked

#Data stuff
data remove entity @s interaction
scoreboard players operation $temp whimc.barrelbot.node_id = @s whimc.barrelbot.node_id

#Feedback
execute if score $dragging whimc.dummy matches 0 run playsound minecraft:entity.item_frame.remove_item player @a ~ ~ ~ 1 1.3
execute if score $dragging whimc.dummy matches 1 run playsound minecraft:entity.item_frame.remove_item player @a ~ ~ ~ 1 0.9

# Just a little extra check to make sure instructors are always linked
function whimc:barrelbot/block/instructor/get_linked_puzzle