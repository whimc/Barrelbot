execute store result score $locked whimc.dummy if entity @s[tag=whimc.function_display.locked]
execute if score $locked whimc.dummy matches 1 run tag @s remove whimc.function_display.locked
execute if score $locked whimc.dummy matches 0 run tag @s add whimc.function_display.locked
execute if score $locked whimc.dummy matches 1 run particle wax_off ~ ~ ~ 0.3 0.3 0.3 0 10 normal
execute if score $locked whimc.dummy matches 0 run particle wax_on ~ ~ ~ 0.3 0.3 0.3 0 10 normal
