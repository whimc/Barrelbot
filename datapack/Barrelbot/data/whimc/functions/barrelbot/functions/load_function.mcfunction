#> whimc:barrelbot/functions/load_function
#   Loads a function into the active puzzle context

scoreboard players operation @s whimc.barrelbot.puzzle_id = $temp whimc.barrelbot.puzzle_id

data modify storage whimc:storage current_function set value {}
data modify storage whimc:storage current_function.function set from block ~ ~ ~ Items
data modify storage whimc:storage current_function.id set from entity @s data.id
data modify storage whimc:storage current_function.length set from storage whimc:storage current_function.function[-1].Slot

data modify storage whimc:storage functions append from storage whimc:storage current_function