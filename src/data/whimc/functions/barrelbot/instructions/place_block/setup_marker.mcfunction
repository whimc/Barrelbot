#> whimc:barrelbot/instructions/place_block/setup_marker
#   Sets a marker at the block so it can be tracked and destroyed

tag @s add whimc.barrelbot.placed_block
scoreboard players operation @s whimc.barrelbot.puzzle_id = $temp whimc.barrelbot.puzzle_id