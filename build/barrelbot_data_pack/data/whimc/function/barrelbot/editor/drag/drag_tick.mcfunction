scoreboard players operation $temp whimc.barrelbot.node_id = @s whimc.barrelbot.node_id
execute anchored eyes positioned ^ ^ ^3 as @e[type=interaction, tag=whimc.editor_node, predicate=whimc:barrelbot/match_node_id, limit=1] run function whimc:barrelbot/editor/drag/node_tick
