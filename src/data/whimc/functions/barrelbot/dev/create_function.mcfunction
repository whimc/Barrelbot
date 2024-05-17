#> whimc:barrelbot/dev/create_function
#   Creates a function barrel linked to the current puzzle

# How to display/link?
#   Should have a connected item that displays above the function barrel
#   Actual linking is all handled internally
#   Make a "Link item" function that updates the display and links the current item to the barrel
#   Functions are stored in an array of functions on the manager marker

setblock ~ ~ ~ shulker_box[facing=up]{CustomName:'{"text":"Function"}'}
#scoreboard players operation $temp whimc.barrelbot.puzzle_id = @s whimc.barrelbot.puzzle_id
execute align xyz positioned ~0.5 ~0.5 ~0.5 summon marker at @s run function whimc:barrelbot/functions/marker_setup