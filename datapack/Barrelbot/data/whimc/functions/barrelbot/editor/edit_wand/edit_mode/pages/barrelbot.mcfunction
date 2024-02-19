#> whimc:barrelbot/editor/edit_wand/edit_mode/pages/barrelbot
data modify storage whimc:storage Page set value {Buttons:[],Text:[]}

#ID
data modify storage whimc:storage Page.key set value "barrelbot"

#Buttons
data modify storage whimc:storage Page.Buttons append value {item:{id:"minecraft:barrier",tag:{CustomModelData:130000}},x_min:-250,x_max:250,y_min:-600,y_max:-100,command:"function whimc:barrelbot/editor/edit_wand/edit_mode/buttons/barrelbot/swap_mode"}

#Close button
data modify storage whimc:storage Page.Buttons append value {item:{id:"minecraft:barrier",tag:{CustomModelData:129999}},x_min:-125,x_max:125,y_min:-875,y_max:-625,command:"function whimc:barrelbot/editor/edit_wand/edit_mode/buttons/close"}

#Text
#data modify storage whimc:storage Page.Text append value {data:{transformation:{translation:[0.0f,0.0f,0.0f],scale:[1.0f,1.0f,1.0f]}},text_provider:'{"text":"Hello world!","color":"green"}'}

#Append to storage
data modify storage whimc:const WandPages append from storage whimc:storage Page