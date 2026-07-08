scoreboard players operation $chunk_x whimc.dummy = $block_x whimc.dummy
scoreboard players operation $chunk_z whimc.dummy = $block_z whimc.dummy
scoreboard players operation $chunk_x /= #16 whimc.const
scoreboard players operation $chunk_z /= #16 whimc.const
scoreboard players operation $rem whimc.dummy = $block_x whimc.dummy
scoreboard players operation $rem %= #16 whimc.const
execute if score $block_x whimc.dummy matches ..-1 unless score $rem whimc.dummy matches 0 run scoreboard players remove $chunk_x whimc.dummy 1
scoreboard players operation $rem whimc.dummy = $block_z whimc.dummy
scoreboard players operation $rem %= #16 whimc.const
execute if score $block_z whimc.dummy matches ..-1 unless score $rem whimc.dummy matches 0 run scoreboard players remove $chunk_z whimc.dummy 1
