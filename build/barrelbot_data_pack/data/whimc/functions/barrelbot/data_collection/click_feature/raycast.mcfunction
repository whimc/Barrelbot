execute if block ~ ~ ~ #whimc:interactables align xyz as @e[type=#whimc:features, dx=0, dy=0, dz=0, scores={whimc.barrelbot.puzzle_id=-2147483648..2147483647}] run scoreboard players operation $out whimc.barrelbot.in_puzzle_id = @s whimc.barrelbot.puzzle_id
scoreboard players remove $raycast whimc.dummy 1
execute if score $raycast whimc.dummy matches 1.. if score $out whimc.barrelbot.in_puzzle_id matches -1 positioned ^ ^ ^0.2 run function whimc:barrelbot/data_collection/click_feature/raycast
