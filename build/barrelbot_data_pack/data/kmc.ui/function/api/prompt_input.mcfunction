execute store result score #prompt_open kmc if entity @s[tag=kmc.ui.prompted]
execute if score #prompt_open kmc matches 1 run return 0
tag @s add kmc.ui.prompted
function kmc.ui:int/save_hotbar
item replace entity @s hotbar.0 with minecraft:barrier
item replace entity @s hotbar.0 with minecraft:writable_book[minecraft:custom_model_data={floats:[130000.0f]},minecraft:custom_name={text:""},minecraft:custom_data={"kmc.ui.text_input":true}]
item replace entity @s hotbar.1 with minecraft:barrier
item replace entity @s hotbar.1 with minecraft:writable_book[minecraft:custom_model_data={floats:[130001.0f]},minecraft:custom_name={text:""},minecraft:custom_data={"kmc.ui.text_input":true}]
item replace entity @s hotbar.2 with minecraft:barrier
item replace entity @s hotbar.2 with minecraft:writable_book[minecraft:custom_model_data={floats:[130002.0f]},minecraft:custom_name={text:""},minecraft:custom_data={"kmc.ui.text_input":true}]
item replace entity @s hotbar.3 with minecraft:barrier
item replace entity @s hotbar.3 with minecraft:writable_book[minecraft:custom_model_data={floats:[130003.0f]},minecraft:custom_name={text:""},minecraft:custom_data={"kmc.ui.text_input":true}]
item replace entity @s hotbar.4 with minecraft:barrier
item replace entity @s hotbar.4 with minecraft:writable_book[minecraft:custom_model_data={floats:[130004.0f]},minecraft:custom_name={text:""},minecraft:custom_data={"kmc.ui.text_input":true}]
item replace entity @s hotbar.5 with minecraft:barrier
item replace entity @s hotbar.5 with minecraft:writable_book[minecraft:custom_model_data={floats:[130005.0f]},minecraft:custom_name={text:""},minecraft:custom_data={"kmc.ui.text_input":true}]
item replace entity @s hotbar.6 with minecraft:barrier
item replace entity @s hotbar.6 with minecraft:writable_book[minecraft:custom_model_data={floats:[130006.0f]},minecraft:custom_name={text:""},minecraft:custom_data={"kmc.ui.text_input":true}]
item replace entity @s hotbar.7 with minecraft:barrier
item replace entity @s hotbar.7 with minecraft:writable_book[minecraft:custom_model_data={floats:[130007.0f]},minecraft:custom_name={text:""},minecraft:custom_data={"kmc.ui.text_input":true}]
item replace entity @s hotbar.8 with minecraft:barrier
item replace entity @s hotbar.8 with minecraft:writable_book[minecraft:custom_model_data={floats:[130008.0f]},minecraft:custom_name={text:""},minecraft:custom_data={"kmc.ui.text_input":true}]
