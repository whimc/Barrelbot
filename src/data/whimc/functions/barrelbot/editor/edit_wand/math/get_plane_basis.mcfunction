#> whimc:barrelbot/editor/edit_wand/math/get_plane_basis
#   Outputs a basis of the plane that the puzzle icons lie on

#> Outputs
# - @s whimc.math.u<x/y/z>      | Horizontal basis vector
# - @s whimc.math.v<x/y/z>      | Vertical basis vector

execute positioned 0.0 0.0 0.0 positioned ^1 ^ ^ summon marker run function whimc:barrelbot/editor/edit_wand/math/get_vec
execute store result score @s whimc.math.ux run data get storage whimc:storage Pos[0] 1000
execute store result score @s whimc.math.uy run data get storage whimc:storage Pos[1] 1000
execute store result score @s whimc.math.uz run data get storage whimc:storage Pos[2] 1000

execute positioned 0.0 0.0 0.0 positioned ^ ^1 ^ summon marker run function whimc:barrelbot/editor/edit_wand/math/get_vec
execute store result score @s whimc.math.vx run data get storage whimc:storage Pos[0] 1000
execute store result score @s whimc.math.vy run data get storage whimc:storage Pos[1] 1000
execute store result score @s whimc.math.vz run data get storage whimc:storage Pos[2] 1000

#This is used for some projection math later on, not part of the plane basis (though it is normal to it)
execute positioned 0.0 0.0 0.0 positioned ^ ^ ^1 summon marker run function whimc:barrelbot/editor/edit_wand/math/get_vec
execute store result score @s whimc.math.wx run data get storage whimc:storage Pos[0] 1000
execute store result score @s whimc.math.wy run data get storage whimc:storage Pos[1] 1000
execute store result score @s whimc.math.wz run data get storage whimc:storage Pos[2] 1000