function kmc:api/player_storage/read
data modify storage kmc:io player.kmc.ui.Hotbar set value []
data modify storage kmc:io player.kmc.ui.Hotbar append from entity @s Inventory[{Slot: 0b}]
data modify storage kmc:io player.kmc.ui.Hotbar append from entity @s Inventory[{Slot: 1b}]
data modify storage kmc:io player.kmc.ui.Hotbar append from entity @s Inventory[{Slot: 2b}]
data modify storage kmc:io player.kmc.ui.Hotbar append from entity @s Inventory[{Slot: 3b}]
data modify storage kmc:io player.kmc.ui.Hotbar append from entity @s Inventory[{Slot: 4b}]
data modify storage kmc:io player.kmc.ui.Hotbar append from entity @s Inventory[{Slot: 5b}]
data modify storage kmc:io player.kmc.ui.Hotbar append from entity @s Inventory[{Slot: 6b}]
data modify storage kmc:io player.kmc.ui.Hotbar append from entity @s Inventory[{Slot: 7b}]
data modify storage kmc:io player.kmc.ui.Hotbar append from entity @s Inventory[{Slot: 8b}]
function kmc:api/player_storage/write
