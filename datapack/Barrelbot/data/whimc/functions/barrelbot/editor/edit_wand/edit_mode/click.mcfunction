#> whimc:barrelbot/editor/edit_wand/edit_mode/click
#   Interacts with the interface when the player clicks while in edit mode

advancement revoke @s only whimc:interact/right_click_editor

#Get looking vector
execute positioned 0.0 0.0 0.0 positioned ^ ^ ^1 summon marker run function whimc:barrelbot/editor/edit_wand/math/get_vec
execute store result score #lookvec.x whimc.dummy run data get storage whimc:storage Pos[0] 1000
execute store result score #lookvec.y whimc.dummy run data get storage whimc:storage Pos[1] 1000
execute store result score #lookvec.z whimc.dummy run data get storage whimc:storage Pos[2] 1000

#Find point where player's eyes meet the "screen" using cool math stuff
scoreboard players operation #intersection.basis.x whimc.dummy = @s whimc.math.ux
scoreboard players operation #intersection.basis.y whimc.dummy = @s whimc.math.uy
scoreboard players operation #intersection.basis.z whimc.dummy = @s whimc.math.uz
function whimc:barrelbot/editor/edit_wand/math/get_intersection
scoreboard players operation #u_proj whimc.dummy = #intersection.out whimc.dummy

scoreboard players operation #intersection.basis.x whimc.dummy = @s whimc.math.vx
scoreboard players operation #intersection.basis.y whimc.dummy = @s whimc.math.vy
scoreboard players operation #intersection.basis.z whimc.dummy = @s whimc.math.vz
function whimc:barrelbot/editor/edit_wand/math/get_intersection
scoreboard players operation #v_proj whimc.dummy = #intersection.out whimc.dummy

#Iterate through all buttons, see which one was pressed
execute on vehicle run data modify storage whimc:storage Page set from entity @s item.tag.Page
scoreboard players set $success whimc.dummy 0
function whimc:barrelbot/editor/edit_wand/edit_mode/find_clicked_button

#If the button is clicked, run the function
execute if score $success whimc.dummy matches 1 if data storage whimc:storage ClickedButton.command run function whimc:barrelbot/editor/edit_wand/edit_mode/execute_button_action with storage whimc:storage ClickedButton
execute if score $success whimc.dummy matches 1 if data storage whimc:storage ClickedButton.page run function whimc:barrelbot/editor/edit_wand/edit_mode/change_page