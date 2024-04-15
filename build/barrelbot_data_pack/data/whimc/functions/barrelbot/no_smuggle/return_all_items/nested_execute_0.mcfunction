data modify storage whimc:storage Inventory set from entity @s Inventory
execute store result score $items whimc.dummy if data storage whimc:storage Inventory[]
function whimc:barrelbot/no_smuggle/clear_functions
