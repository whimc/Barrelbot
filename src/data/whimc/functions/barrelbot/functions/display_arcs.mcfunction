#> whimc:barrelbot/functions/display_arcs
#   Displays all the arcs between functions and bots when a function is called

#> INPUT:
#   - whimc:storage DisplayArcs

data modify storage whimc:storage current_arc set from storage whimc:storage DisplayArcs[-1]

# This is done now so the position can respond to any movements that the barrelbot made within the tick
#execute if data storage whimc:storage {current_arc:{Pos2:"self"}} run say HI
execute if data storage whimc:storage {current_arc:{Pos2:"self"}} run data modify storage whimc:storage current_arc.Pos2 set from entity @s Pos

# Load in data
execute store result score $x1 whimc.dummy run data get storage whimc:storage current_arc.Pos1[0] 1000
execute store result score $y1 whimc.dummy run data get storage whimc:storage current_arc.Pos1[1] 1000
execute store result score $z1 whimc.dummy run data get storage whimc:storage current_arc.Pos1[2] 1000

execute store result score $x2 whimc.dummy run data get storage whimc:storage current_arc.Pos2[0] 1000
execute store result score $y2 whimc.dummy run data get storage whimc:storage current_arc.Pos2[1] 1000
execute store result score $z2 whimc.dummy run data get storage whimc:storage current_arc.Pos2[2] 1000
# Do the thing
function ./display_arc


# Loop logic
data remove storage whimc:storage DisplayArcs[-1]
scoreboard players remove $arc_count whimc.dummy 1
execute if score $arc_count whimc.dummy matches 1.. run function ~/



############################# ARC DISPLAY LOGIC #####################################
# Note: This is mostly copy-pasted from another function with some minor adjustments

from whimc:constants import display
from bolt_expressions import Scoreboard, Data
dummy = Scoreboard.objective("whimc.dummy")
import math

arclength = 500        # Spacing between particles for drawing the arc leading back to the instructor
storage = Data.storage(whimc:storage)
macro = Data.storage(whimc:macro)

# Inputs x1/y1/z1 and x2/y2/z2
#   Displays an arc of particles between the two input points
function ./display_arc:
    # Step 1: Find midpoint
    scoreboard players operation $midpoint.x whimc.dummy = $x1 whimc.dummy
    scoreboard players operation $midpoint.y whimc.dummy = $y1 whimc.dummy
    scoreboard players operation $midpoint.z whimc.dummy = $z1 whimc.dummy
    scoreboard players operation $midpoint.x whimc.dummy += $x2 whimc.dummy
    scoreboard players operation $midpoint.y whimc.dummy += $y2 whimc.dummy
    scoreboard players operation $midpoint.z whimc.dummy += $z2 whimc.dummy
    
    scoreboard players operation $midpoint.x whimc.dummy /= #2 whimc.const
    scoreboard players operation $midpoint.y whimc.dummy /= #2 whimc.const
    scoreboard players operation $midpoint.z whimc.dummy /= #2 whimc.const

    # Find d, the distance between the two points
    data modify storage whimc:storage transformation set value [0f,0f,0f,0f,0f,0f,0f,0f,0f,0f,0f,0f,0f,0f,0f,1f]
    
    t1 = storage.transformation[0](type='float')
    t2 = storage.transformation[4](type='float')
    t3 = storage.transformation[8](type='float')
    t1 = (dummy["$x2"] - dummy["$x1"])
    t2 = (dummy["$y2"] - dummy["$y1"])
    t3 = (dummy["$z2"] - dummy["$z1"])

    data modify entity display transformation set from storage whimc:storage transformation
    execute store result score $d whimc.dummy run data get entity display transformation.scale[0]

    # Calculate r, the radius of curvature
    #   r = sqrt(2)/2 * d
    # Side note: I LOVE BOLT EXPRESSIONS THIS IS SO NICE
    dummy['$r'] = dummy['$d'] * 707 / 1000

    # Calculate the angle step
    #   theta = degrees(arclength / r)
    dummy['$theta'] = (int((180 / 3.141592) * arclength * 1000) / dummy['$r'])

    # Step 2: Execute at midpoint

    # Get Pos1 into storage so we can get the right facing direction
    execute store result storage whimc:macro start_x double 0.001 run scoreboard players get $x1 whimc.dummy
    execute store result storage whimc:macro start_y double 0.001 run scoreboard players get $y1 whimc.dummy
    execute store result storage whimc:macro start_z double 0.001 run scoreboard players get $z1 whimc.dummy

    execute summon marker with storage whimc:macro:
        execute store result storage whimc:storage Pos[0] double 0.001 run scoreboard players get $midpoint.x whimc.dummy
        execute store result storage whimc:storage Pos[1] double 0.001 run scoreboard players get $midpoint.y whimc.dummy
        execute store result storage whimc:storage Pos[2] double 0.001 run scoreboard players get $midpoint.z whimc.dummy
        data modify entity @s Pos set from storage whimc:storage Pos

        # Enforce proper rotation
        $execute positioned $(start_x) $(start_y) $(start_z) facing entity @s feet positioned as @s run tp @s ~ ~ ~ ~ ~

        execute at @s:
            # Shift downwards by d/2
            execute store result storage whimc:macro shift float 0.0005 run scoreboard players get $d whimc.dummy
            execute store result storage whimc:macro x1 float 0.001 run scoreboard players get $x1 whimc.dummy
            execute store result storage whimc:macro y1 float 0.001 run scoreboard players get $y1 whimc.dummy
            execute store result storage whimc:macro z1 float 0.001 run scoreboard players get $z1 whimc.dummy
            execute store result storage whimc:macro x2 float 0.001 run scoreboard players get $x2 whimc.dummy
            execute store result storage whimc:macro y2 float 0.001 run scoreboard players get $y2 whimc.dummy
            execute store result storage whimc:macro z2 float 0.001 run scoreboard players get $z2 whimc.dummy
            execute store result storage whimc:macro r float 0.001 run scoreboard players get $r whimc.dummy
            scoreboard players set $angle whimc.dummy 0
            with storage whimc:macro:
                # Test if positive or negative should be used

                #TO-DO: Probably just use a marker for this
                $execute positioned ^ ^-$(shift) ^ facing $(x1) $(y1) $(z1) rotated ~ 0 run summon marker ^ ^ ^1 {Tags:["whimc.temp"]}
                $execute positioned ^ ^-$(shift) ^ facing $(x2) $(y2) $(z2) rotated ~ 0 positioned ^ ^ ^1 unless entity @e[type=marker,tag=whimc.temp,distance=..1] run scoreboard players operation $theta whimc.dummy *= #-1 whimc.const
                kill @e[type=marker,limit=1,tag=whimc.temp]

                macro.theta = dummy['$theta'] / 1000
                $execute positioned ^ ^-$(shift) ^ facing $(x1) $(y1) $(z1) run function whimc:barrelbot/functions/draw_loop with storage whimc:macro


        kill @s

function ./draw_loop:
    $particle dust 0.2 0.7 1.0 2 ^ ^ ^$(r) 0 0 0 0 1 force
    # Loop condition
    dummy['$angle'] += dummy['$theta']
    $execute if score $angle whimc.dummy matches -90000..90000 rotated ~ ~$(theta) run function whimc:barrelbot/functions/draw_loop with storage whimc:macro