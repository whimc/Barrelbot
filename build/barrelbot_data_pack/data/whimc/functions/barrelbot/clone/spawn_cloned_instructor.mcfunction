execute rotated as @s rotated ~180 ~ run function whimc:barrelbot/block/instructor/initialize
execute as @e[type=item_display, tag=whimc.instructor, limit=1, sort=nearest] run function whimc:barrelbot/clone/spawn_cloned_instructor/nested_execute_0
