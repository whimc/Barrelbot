data modify storage whimc:storage current_display set value {transformation: {translation: [0.0f, 0.0f, 0.0f]}, item: {id: "minecraft:barrier", Count: 1b}}
execute store result score $slot whimc.dummy run data get storage whimc:storage display_instructions[0].Slot
scoreboard players operation $x whimc.dummy = $slot whimc.dummy
scoreboard players operation $x whimc.dummy %= #DISPLAY_WIDTH whimc.const
scoreboard players operation $y whimc.dummy = $slot whimc.dummy
scoreboard players operation $y whimc.dummy /= #DISPLAY_WIDTH whimc.const
scoreboard players remove $x whimc.dummy 4
scoreboard players remove $y whimc.dummy 1
execute store result storage whimc:storage current_display.transformation.translation[0] float 0.228 run scoreboard players get $x whimc.dummy
execute store result storage whimc:storage current_display.transformation.translation[1] float -0.225 run scoreboard players get $y whimc.dummy
data modify storage whimc:storage current_display.item set from storage whimc:storage display_instructions[0]
data modify storage whimc:storage execution_displays append from storage whimc:storage current_display
scoreboard players remove $entries whimc.dummy 1
data remove storage whimc:storage display_instructions[0]
execute if score $entries whimc.dummy matches 1.. run function whimc:barrelbot/display/generate_data_recursive
