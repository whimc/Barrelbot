function whimc:barrelbot/clone/clone_as_manager
scoreboard players remove $z_iter whimc.dummy 1
execute if score $z_iter whimc.dummy matches 1.. run function whimc:barrelbot/clone/cascade/iterate_z_wrapper with storage whimc:macro jump
