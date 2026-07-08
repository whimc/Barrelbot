data modify storage kmc:temp player_data set value {}
execute store result storage kmc:temp player_data.id int 1 run scoreboard players get @s kmc.id
data modify storage kmc:storage players append from storage kmc:temp player_data
