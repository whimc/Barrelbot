execute if data storage whimc:storage Inventory[0].tag.barrelbot.puzzle_item run function whimc:barrelbot/no_smuggle/clear_functions/nested_execute_0
scoreboard players remove $items whimc.dummy 1
data remove storage whimc:storage Inventory[0]
execute if score $items whimc.dummy matches 1.. run function whimc:barrelbot/no_smuggle/clear_functions
