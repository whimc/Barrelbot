#> whimc:technical/load
#   Sets up all necessary scoreboards

scoreboard objectives add whimc.timer dummy
scoreboard objectives add whimc.click minecraft.used:minecraft.carrot_on_a_stick
scoreboard objectives add whimc.dummy dummy
scoreboard objectives add whimc.const dummy

scoreboard objectives add whimc.barrelbot.slot dummy
scoreboard objectives add whimc.barrelbot.step_timer dummy
scoreboard objectives add whimc.barrelbot.puzzle_id dummy
scoreboard objectives add whimc.barrelbot.bot_id dummy
scoreboard objectives add whimc.barrelbot.node_id dummy
scoreboard objectives add whimc.button_delay dummy
scoreboard objectives add whimc.barrelbot.display_layer dummy
scoreboard objectives add whimc.barrelbot.push_count dummy
scoreboard objectives add whimc.barrelbot.in_puzzle_id dummy

#Bounding box
scoreboard objectives add whimc.barrelbot.bound_x dummy
scoreboard objectives add whimc.barrelbot.bound_y dummy
scoreboard objectives add whimc.barrelbot.bound_z dummy
scoreboard objectives add whimc.barrelbot.bound_dx dummy
scoreboard objectives add whimc.barrelbot.bound_dy dummy
scoreboard objectives add whimc.barrelbot.bound_dz dummy

#Cloning
scoreboard objectives add whimc.barrelbot.cascade.x dummy
scoreboard objectives add whimc.barrelbot.cascade.z dummy
scoreboard objectives add whimc.barrelbot.cascade.x_spacing dummy
scoreboard objectives add whimc.barrelbot.cascade.z_spacing dummy

#Storage things
#declare storage whimc:macro
#declare storage whimc:storage

#declare storage whimc:const
data modify storage whimc:const text.barrelbot.start set value '{"text":"Run","color":"green","bold":true}'
data modify storage whimc:const text.barrelbot.stop set value '{"text":"Reset","color":"red","bold":true}'


#Constants
scoreboard players set #MAX_RECURSION_DEPTH whimc.const 32
scoreboard players set #DISPLAY_WIDTH whimc.const 9
scoreboard players set #-1 whimc.const -1