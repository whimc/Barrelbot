function kmc:api/player_storage/read
item replace entity @s hotbar.0 with minecraft:air
execute if data storage kmc:io player.kmc.ui.Hotbar[{Slot: 0b}] run function kmc.ui:int/load_hotbar/nested_execute_0
item replace entity @s hotbar.1 with minecraft:air
execute if data storage kmc:io player.kmc.ui.Hotbar[{Slot: 1b}] run function kmc.ui:int/load_hotbar/nested_execute_1
item replace entity @s hotbar.2 with minecraft:air
execute if data storage kmc:io player.kmc.ui.Hotbar[{Slot: 2b}] run function kmc.ui:int/load_hotbar/nested_execute_2
item replace entity @s hotbar.3 with minecraft:air
execute if data storage kmc:io player.kmc.ui.Hotbar[{Slot: 3b}] run function kmc.ui:int/load_hotbar/nested_execute_3
item replace entity @s hotbar.4 with minecraft:air
execute if data storage kmc:io player.kmc.ui.Hotbar[{Slot: 4b}] run function kmc.ui:int/load_hotbar/nested_execute_4
item replace entity @s hotbar.5 with minecraft:air
execute if data storage kmc:io player.kmc.ui.Hotbar[{Slot: 5b}] run function kmc.ui:int/load_hotbar/nested_execute_5
item replace entity @s hotbar.6 with minecraft:air
execute if data storage kmc:io player.kmc.ui.Hotbar[{Slot: 6b}] run function kmc.ui:int/load_hotbar/nested_execute_6
item replace entity @s hotbar.7 with minecraft:air
execute if data storage kmc:io player.kmc.ui.Hotbar[{Slot: 7b}] run function kmc.ui:int/load_hotbar/nested_execute_7
item replace entity @s hotbar.8 with minecraft:air
execute if data storage kmc:io player.kmc.ui.Hotbar[{Slot: 8b}] run function kmc.ui:int/load_hotbar/nested_execute_8
function kmc:api/player_storage/write
