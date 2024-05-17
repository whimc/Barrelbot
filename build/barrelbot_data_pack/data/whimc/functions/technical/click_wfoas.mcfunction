scoreboard players set @s whimc.click_wfoas 0
execute if predicate whimc:holding_coas_mainhand run return 0
execute store result score #hand whimc.dummy if predicate whimc:holding_wfoas_mainhand
execute if score #hand whimc.dummy matches 1 run data modify storage whimc:storage ClickedItem set from entity @s SelectedItem
execute if score #hand whimc.dummy matches 0 run data modify storage whimc:storage ClickedItem set from entity @s Inventory[{Slot: -106b}]
execute if data storage whimc:storage {ClickedItem: {tag: {whimc_puzzle_wand: 1b}}} run function whimc:barrelbot/editor/edit_wand/click
