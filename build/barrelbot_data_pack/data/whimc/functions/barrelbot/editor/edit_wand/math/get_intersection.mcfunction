scoreboard players operation #dot.x1 whimc.dummy = #lookvec.x whimc.dummy
scoreboard players operation #dot.y1 whimc.dummy = #lookvec.y whimc.dummy
scoreboard players operation #dot.z1 whimc.dummy = #lookvec.z whimc.dummy
scoreboard players operation #dot.x2 whimc.dummy = #intersection.basis.x whimc.dummy
scoreboard players operation #dot.y2 whimc.dummy = #intersection.basis.y whimc.dummy
scoreboard players operation #dot.z2 whimc.dummy = #intersection.basis.z whimc.dummy
function whimc:barrelbot/editor/edit_wand/math/dot_product
scoreboard players operation #intersection.out whimc.dummy = #dot.out whimc.dummy
scoreboard players operation #intersection.out whimc.dummy *= #EDITOR_DISPLAY_DISTANCE whimc.const
scoreboard players operation #dot.x2 whimc.dummy = @s whimc.math.wx
scoreboard players operation #dot.y2 whimc.dummy = @s whimc.math.wy
scoreboard players operation #dot.z2 whimc.dummy = @s whimc.math.wz
function whimc:barrelbot/editor/edit_wand/math/dot_product
scoreboard players operation #intersection.out whimc.dummy /= #dot.out whimc.dummy
