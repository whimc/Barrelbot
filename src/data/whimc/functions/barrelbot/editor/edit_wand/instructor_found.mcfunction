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

function whimc:barrelbot/block/instructor/get_linked_puzzle