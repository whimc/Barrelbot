scoreboard objectives add whimc.timer dummy
scoreboard objectives add whimc.click minecraft.used:minecraft.carrot_on_a_stick
scoreboard objectives add whimc.click_wfoas minecraft.used:minecraft.warped_fungus_on_a_stick
scoreboard objectives add whimc.dummy dummy
scoreboard objectives add whimc.barrelbot.slot dummy
scoreboard objectives add whimc.barrelbot.step_timer dummy
scoreboard objectives add whimc.barrelbot.puzzle_id dummy
scoreboard objectives add whimc.barrelbot.bot_id dummy
scoreboard objectives add whimc.barrelbot.node_id dummy
scoreboard objectives add whimc.button_delay dummy
scoreboard objectives add whimc.barrelbot.display_layer dummy
scoreboard objectives add whimc.barrelbot.push_count dummy
scoreboard objectives add whimc.barrelbot.in_puzzle_id dummy
scoreboard objectives add whimc.barrelbot.puzzle_type_id dummy
scoreboard objectives add whimc.barrelbot.edit_instance_id dummy
scoreboard objectives add whimc.barrelbot.stack_height dummy
scoreboard objectives add whimc.barrelbot.ui.stored_x dummy
scoreboard objectives add whimc.barrelbot.ui.stored_y dummy
scoreboard objectives add whimc.barrelbot.ui.stored_scale dummy
scoreboard objectives add whimc.barrelbot.bound_x dummy
scoreboard objectives add whimc.barrelbot.bound_y dummy
scoreboard objectives add whimc.barrelbot.bound_z dummy
scoreboard objectives add whimc.barrelbot.bound_dx dummy
scoreboard objectives add whimc.barrelbot.bound_dy dummy
scoreboard objectives add whimc.barrelbot.bound_dz dummy
scoreboard objectives add whimc.barrelbot.cascade.x dummy
scoreboard objectives add whimc.barrelbot.cascade.z dummy
scoreboard objectives add whimc.barrelbot.cascade.x_spacing dummy
scoreboard objectives add whimc.barrelbot.cascade.z_spacing dummy
scoreboard objectives add whimc.math.ux dummy
scoreboard objectives add whimc.math.uy dummy
scoreboard objectives add whimc.math.uz dummy
scoreboard objectives add whimc.math.vx dummy
scoreboard objectives add whimc.math.vy dummy
scoreboard objectives add whimc.math.vz dummy
scoreboard objectives add whimc.math.wx dummy
scoreboard objectives add whimc.math.wy dummy
scoreboard objectives add whimc.math.wz dummy
data modify storage whimc:const text.barrelbot.start set value '{"text":"Run","color":"green","bold":true}'
data modify storage whimc:const text.barrelbot.stop set value '{"text":"Reset","color":"red","bold":true}'
function whimc:barrelbot/editor/edit_wand/edit_mode/pages/register_pages
execute unless data storage whimc:storage puzzle_names run data modify storage whimc:storage puzzle_names set value []
scoreboard objectives add whimc.const dummy
scoreboard players set #MAX_RECURSION_DEPTH whimc.const 32
scoreboard players set #DISPLAY_WIDTH whimc.const 9
scoreboard players set #EDITOR_DISPLAY_DISTANCE whimc.const 1250
scoreboard players set #-1 whimc.const -1
scoreboard players set #2 whimc.const 2
scoreboard players set #1000 whimc.const 1000
