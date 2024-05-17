#> whimc:barrelbot/editor/edit_wand/math/get_intersection
#   Finds where a raycast from the player's eyes intersects with an invisible "screen" in front of the player

#Find projection of looking vector onto interface plane, scaled by distance (This is the coolest commment I have ever written)
#   1. Take dot product of looking vector and u hat
#   2. Multiply by constant distance D
#   3. Take dot product of looking vector and w hat
#   4. Divide product from step 2 by product from step 3
#   5. Repeat these steps but with v hat instead of u hat

#l dot u
scoreboard players operation #dot.x1 whimc.dummy = #lookvec.x whimc.dummy
scoreboard players operation #dot.y1 whimc.dummy = #lookvec.y whimc.dummy
scoreboard players operation #dot.z1 whimc.dummy = #lookvec.z whimc.dummy
scoreboard players operation #dot.x2 whimc.dummy = #intersection.basis.x whimc.dummy
scoreboard players operation #dot.y2 whimc.dummy = #intersection.basis.y whimc.dummy
scoreboard players operation #dot.z2 whimc.dummy = #intersection.basis.z whimc.dummy
function whimc:barrelbot/editor/edit_wand/math/dot_product
scoreboard players operation #intersection.out whimc.dummy = #dot.out whimc.dummy

#multiply by D
scoreboard players operation #intersection.out whimc.dummy *= #EDITOR_DISPLAY_DISTANCE whimc.const

#l dot w
scoreboard players operation #dot.x2 whimc.dummy = @s whimc.math.wx
scoreboard players operation #dot.y2 whimc.dummy = @s whimc.math.wy
scoreboard players operation #dot.z2 whimc.dummy = @s whimc.math.wz
function whimc:barrelbot/editor/edit_wand/math/dot_product

scoreboard players operation #intersection.out whimc.dummy /= #dot.out whimc.dummy