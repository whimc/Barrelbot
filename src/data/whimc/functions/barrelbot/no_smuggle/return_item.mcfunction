#> whimc:barrelbot/no_smuggle/return_item
#   Returns one item stack back to the instructor

scoreboard players set $item_returned whimc.dummy 1

from whimc:constants import display
from bolt_expressions import Scoreboard, Data
dummy = Scoreboard.objective("whimc.dummy")
import math

arclength = 500        # Spacing between particles for drawing the arc leading back to the instructor
storage = Data.storage(whimc:storage)
macro = Data.storage(whimc:macro)

#execute store result score $temp whimc.barrelbot.puzzle_id run data get storage whimc:storage Inventory[0].tag.barrelbot.puzzle_id
#execute at @e[type=text_display,tag=whimc.barrelbot.puzzle_manager,predicate=whimc:barrelbot/match_id] positioned ^1 ^ ^-1 run summon item ~ ~ ~ {Item:{id:"minecraft:stone",Count:1b},PickupDelay:100000000,Age:0,Tags:["whimc.item.init"]}
#execute at @e[type=text_display,tag=whimc.barrelbot.puzzle_manager,predicate=whimc:barrelbot/match_id] positioned ^ ^ ^-1 run particle end_rod ~ ~ ~ 0.05 0.05 0.05 0 1 normal
#execute at @e[type=text_display,tag=whimc.barrelbot.puzzle_manager,predicate=whimc:barrelbot/match_id] positioned ^ ^ ^-1 run playsound minecraft:entity.item.pickup block @a ~ ~ ~ 1.5 1

#data modify entity @e[type=item,limit=1,tag=whimc.item.init] Item set from storage whimc:storage Inventory[0]
#tag @e[type=item,limit=1,tag=whimc.item.init] remove whimc.item.init

# Get position of player into score for displaying the arc leading back to the instructor
data modify storage whimc:storage Pos set from entity @s Pos
execute store result score $x1 whimc.dummy run data get storage whimc:storage Pos[0] 1000
execute store result score $y1 whimc.dummy run data get storage whimc:storage Pos[1] 1000
execute store result score $z1 whimc.dummy run data get storage whimc:storage Pos[2] 1000
scoreboard players add $y1 whimc.dummy 1650

execute store result score $temp whimc.barrelbot.bot_id run data get storage whimc:storage Inventory[0].tag.barrelbot.instructor_id
data modify storage kmc.item:api item_stack set from storage whimc:storage Inventory[0]
execute as @e[type=item_display,tag=whimc.instructor,predicate=whimc:barrelbot/match_bot_id] at @s:
    function kmc.item:api/insert_item_block
    playsound minecraft:entity.item.pickup block @a ~ ~ ~ 1.5 1

    # Overflow handling - If the instructor is full, spawn the item stack as an entity
    execute if score #item_count kmc.dummy matches 1..:
        summon item ~ ~0.8 ~ {Item:{id:"minecraft:stone",Count:1b},PickupDelay:20,Age:0,Tags:["whimc.item.init"],Motion:[0.0d,0.25d,0.0d]}
        data modify entity @e[type=item,limit=1,tag=whimc.item.init] Item set from storage kmc.item:api item_stack
        tag @e[type=item,limit=1,tag=whimc.item.init] remove whimc.item.init

    # Get position of instructor into score for particle display
    data modify storage whimc:storage Pos set from entity @s Pos
    execute store result score $x2 whimc.dummy run data get storage whimc:storage Pos[0] 1000
    execute store result score $y2 whimc.dummy run data get storage whimc:storage Pos[1] 1000
    execute store result score $z2 whimc.dummy run data get storage whimc:storage Pos[2] 1000
    function ./display_item_return


# Inputs x1/y1/z1 and x2/y2/z2
#   Displays an arc of particles between the two input points
function ./display_item_return:
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
    execute summon marker:
        execute store result storage whimc:storage Pos[0] double 0.001 run scoreboard players get $midpoint.x whimc.dummy
        execute store result storage whimc:storage Pos[1] double 0.001 run scoreboard players get $midpoint.y whimc.dummy
        execute store result storage whimc:storage Pos[2] double 0.001 run scoreboard players get $midpoint.z whimc.dummy
        data modify entity @s Pos set from storage whimc:storage Pos

        execute facing entity @s feet positioned as @s:
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
                $execute positioned ^ ^-$(shift) ^ facing $(x1) $(y1) $(z1) run function whimc:barrelbot/no_smuggle/draw_loop with storage whimc:macro


        kill @s

# TO-DO: Try using dot product between two looking vectors to see if negative or positive angle should be used

function ./draw_loop:
    $particle end_rod ^ ^ ^$(r) 0 0 0 0 1 force
    # Loop condition
    dummy['$angle'] += dummy['$theta']
    $execute if score $angle whimc.dummy matches -90000..90000 rotated ~ ~$(theta) run function whimc:barrelbot/no_smuggle/draw_loop with storage whimc:macro