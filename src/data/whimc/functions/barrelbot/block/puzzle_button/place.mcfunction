#> whimc:barrelbot/block/puzzle_button/place
#   Sets up a puzzle button when it is placed

advancement revoke @s only whimc:block/place_puzzle_button

#Raycast to find the button
scoreboard players set $raycast whimc.dummy 60
execute anchored eyes positioned ^ ^ ^ run function whimc:barrelbot/block/puzzle_button/raycast