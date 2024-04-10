#> whimc:barrelbot/editor/edit_wand/math/dot_product
#   Takes the dot product of two vectors

#> Inputs:
#  Scale factor 1000
#   
#   - #dot.x1 whimc.dummy       |
#   - #dot.y1 whimc.dummy       | First input vector
#   - #dot.z1 whimc.dummy       |
#
#   - #dot.x2 whimc.dummy       |
#   - #dot.y2 whimc.dummy       | Second input vector
#   - #dot.z2 whimc.dummy       |

#> Outputs:
#  Scale factor 1000
#   
#   - #dot.out whimc.dummy


scoreboard players operation #dot.out whimc.dummy = #dot.x1 whimc.dummy
scoreboard players operation #dot.out whimc.dummy *= #dot.x2 whimc.dummy

scoreboard players operation #dot.temp whimc.dummy = #dot.y1 whimc.dummy
scoreboard players operation #dot.temp whimc.dummy *= #dot.y2 whimc.dummy
scoreboard players operation #dot.out whimc.dummy += #dot.temp whimc.dummy

scoreboard players operation #dot.temp whimc.dummy = #dot.z1 whimc.dummy
scoreboard players operation #dot.temp whimc.dummy *= #dot.z2 whimc.dummy
scoreboard players operation #dot.out whimc.dummy += #dot.temp whimc.dummy

scoreboard players operation #dot.out whimc.dummy /= #1000 whimc.const