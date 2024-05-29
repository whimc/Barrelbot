execute store result score #prompt_open kmc if entity @s[tag=kmc.ui.prompted]
execute if score #prompt_open kmc matches 1 run return 0
tag @s add kmc.ui.prompted
function kmc.ui:int/save_hotbar
item replace entity @s hotbar.0 with minecraft:barrier
item replace entity @s hotbar.0 with minecraft:writable_book{CustomModelData: 130000, display: {Name: '{"text":""}'}, kmc.ui.text_input: 1b}
item replace entity @s hotbar.1 with minecraft:barrier
item replace entity @s hotbar.1 with minecraft:writable_book{CustomModelData: 130001, display: {Name: '{"text":""}'}, kmc.ui.text_input: 1b}
item replace entity @s hotbar.2 with minecraft:barrier
item replace entity @s hotbar.2 with minecraft:writable_book{CustomModelData: 130002, display: {Name: '{"text":""}'}, kmc.ui.text_input: 1b}
item replace entity @s hotbar.3 with minecraft:barrier
item replace entity @s hotbar.3 with minecraft:writable_book{CustomModelData: 130003, display: {Name: '{"text":""}'}, kmc.ui.text_input: 1b}
item replace entity @s hotbar.4 with minecraft:barrier
item replace entity @s hotbar.4 with minecraft:writable_book{CustomModelData: 130004, display: {Name: '{"text":""}'}, kmc.ui.text_input: 1b}
item replace entity @s hotbar.5 with minecraft:barrier
item replace entity @s hotbar.5 with minecraft:writable_book{CustomModelData: 130005, display: {Name: '{"text":""}'}, kmc.ui.text_input: 1b}
item replace entity @s hotbar.6 with minecraft:barrier
item replace entity @s hotbar.6 with minecraft:writable_book{CustomModelData: 130006, display: {Name: '{"text":""}'}, kmc.ui.text_input: 1b}
item replace entity @s hotbar.7 with minecraft:barrier
item replace entity @s hotbar.7 with minecraft:writable_book{CustomModelData: 130007, display: {Name: '{"text":""}'}, kmc.ui.text_input: 1b}
item replace entity @s hotbar.8 with minecraft:barrier
item replace entity @s hotbar.8 with minecraft:writable_book{CustomModelData: 130008, display: {Name: '{"text":""}'}, kmc.ui.text_input: 1b}
