execute store result storage kmc:macro id int 1 run scoreboard players get @s kmc.id
function kmc:api/player_storage/read/nested_macro_0 with storage kmc:macro
scoreboard players operation #last_access kmc.id = @s kmc.id
