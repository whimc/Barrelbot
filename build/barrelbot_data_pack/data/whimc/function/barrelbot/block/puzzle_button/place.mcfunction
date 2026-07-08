advancement revoke @s only whimc:block/place_puzzle_button
scoreboard players set $raycast whimc.dummy 60
execute anchored eyes positioned ^ ^ ^ run function whimc:barrelbot/block/puzzle_button/raycast
