setblock ~ ~ ~ shulker_box[facing=up]{components:{"minecraft:custom_name":{text:"Function",color:"#55FFFF",italic:false}}}
execute align xyz positioned ~0.5 ~0.5 ~0.5 summon marker at @s run function whimc:barrelbot/functions/marker_setup
