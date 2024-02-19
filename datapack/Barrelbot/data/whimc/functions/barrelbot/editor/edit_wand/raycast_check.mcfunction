#> whimc:barrelbot/editor/edit_wand/raycast_check
#   Checks the current block, whether it is something that should be scanned

execute if block ~ ~ ~ #whimc:barrelbot as @e[type=item_display,tag=whimc.barrelbot,dx=0,dy=0,dz=0,limit=1] run function whimc:barrelbot/editor/edit_wand/barrelbot_found
execute if block ~ ~ ~ #minecraft:buttons as @e[type=text_display,tag=whimc.barrelbot.puzzle_manager,dx=0,dy=0,dz=0,limit=1] run function whimc:barrelbot/editor/edit_wand/puzzle_button_found