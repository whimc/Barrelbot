#> whimc:barrelbot/dev/cascade_clone
#   Brings up the prompt for a cascade clone

tellraw @s {"text":"Cascade Clone","bold": true,"underlined": true}
tellraw @s ["","-  ",{"text":"Set x-axis cascade count","color":"gold","clickEvent":{"action":"suggest_command","value":"/scoreboard players set @s whimc.barrelbot.cascade.x 1"}}]
tellraw @s ["","-  ",{"text":"Set z-axis cascade count","color":"gold","clickEvent":{"action":"suggest_command","value":"/scoreboard players set @s whimc.barrelbot.cascade.z 1"}}]
tellraw @s ["","-  ",{"text":"Set x-axis spacing","color":"yellow","clickEvent":{"action":"suggest_command","value":"/scoreboard players set @s whimc.barrelbot.cascade.x_spacing 1"}}]
tellraw @s ["","-  ",{"text":"Set z-axis spacing","color":"yellow","clickEvent":{"action":"suggest_command","value":"/scoreboard players set @s whimc.barrelbot.cascade.z_spacing 1"}}]
tellraw @s ["",{"text":"Preview  ","bold":true,"color":"blue","clickEvent":{"action":"run_command","value":"/function whimc:barrelbot/dev/clone/preview_cascade"}},{"text":"|","bold":true,"color":"white"},{"text":"  Paste","bold":true,"color":"green","clickEvent":{"action":"run_command","value":"/function whimc:barrelbot/dev/clone/paste_cascade"}}]