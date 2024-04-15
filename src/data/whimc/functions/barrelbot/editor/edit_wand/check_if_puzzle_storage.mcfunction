execute positioned ~ ~1 ~1 as @e[type=text_display,tag=whimc.barrelbot.puzzle_manager,dx=0,dy=0,dz=0,y_rotation=0] positioned ~ ~-1 ~-1 run function whimc:barrelbot/editor/edit_wand/lock_puzzle_items
execute positioned ~ ~1 ~-1 as @e[type=text_display,tag=whimc.barrelbot.puzzle_manager,dx=0,dy=0,dz=0,y_rotation=180] positioned ~ ~-1 ~1 run function whimc:barrelbot/editor/edit_wand/lock_puzzle_items
execute positioned ~1 ~1 ~ as @e[type=text_display,tag=whimc.barrelbot.puzzle_manager,dx=0,dy=0,dz=0,y_rotation=-90] positioned ~-1 ~-1 ~ run function whimc:barrelbot/editor/edit_wand/lock_puzzle_items
execute positioned ~-1 ~1 ~ as @e[type=text_display,tag=whimc.barrelbot.puzzle_manager,dx=0,dy=0,dz=0,y_rotation=90] positioned ~1 ~-1 ~ run function whimc:barrelbot/editor/edit_wand/lock_puzzle_items

function whimc:barrelbot/editor/edit_wand/lock_puzzle_items:
    execute at @s run function whimc:barrelbot/no_smuggle/define_items
    scoreboard players set #raycast_length whimc.dummy 0
    particle end_rod ~ ~1 ~1
    particle end_rod ~ ~1 ~
    particle end_rod ~ ~ ~1
    particle end_rod ~ ~ ~
    particle end_rod ~1 ~1 ~1
    particle end_rod ~1 ~1 ~
    particle end_rod ~1 ~ ~1
    particle end_rod ~1 ~ ~
    playsound minecraft:entity.player.levelup block @a ~ ~ ~ 1 2