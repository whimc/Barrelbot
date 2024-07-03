data modify storage whimc:storage current_arc set from storage whimc:storage DisplayArcs[-1]
execute if data storage whimc:storage {current_arc: {Pos2: "self"}} run data modify storage whimc:storage current_arc.Pos2 set from entity @s Pos
execute store result score $x1 whimc.dummy run data get storage whimc:storage current_arc.Pos1[0] 1000
execute store result score $y1 whimc.dummy run data get storage whimc:storage current_arc.Pos1[1] 1000
execute store result score $z1 whimc.dummy run data get storage whimc:storage current_arc.Pos1[2] 1000
execute store result score $x2 whimc.dummy run data get storage whimc:storage current_arc.Pos2[0] 1000
execute store result score $y2 whimc.dummy run data get storage whimc:storage current_arc.Pos2[1] 1000
execute store result score $z2 whimc.dummy run data get storage whimc:storage current_arc.Pos2[2] 1000
function whimc:barrelbot/functions/display_arc
data remove storage whimc:storage DisplayArcs[-1]
scoreboard players remove $arc_count whimc.dummy 1
execute if score $arc_count whimc.dummy matches 1.. run function whimc:barrelbot/functions/display_arcs
