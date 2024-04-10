#> whimc:barrelbot/dev/link_puzzle
#   Link yourself to the ID of the nearest puzzle

scoreboard players operation @s whimc.barrelbot.puzzle_id = @e[type=text_display,limit=1,sort=nearest] whimc.barrelbot.puzzle_id
tellraw @s {"text": "Successfully linked to puzzle", "color": "green"}