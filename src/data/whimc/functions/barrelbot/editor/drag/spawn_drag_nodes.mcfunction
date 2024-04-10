#> whimc:barrelbot/editor/drag/spawn_drag_nodes
#   Spawns the clickable and draggable nodes for the bounding box

$execute positioned $(min_x) $(min_y) $(min_z) summon interaction run function whimc:barrelbot/editor/drag/setup_min_node
$execute positioned $(max_x) $(max_y) $(max_z) summon interaction run function whimc:barrelbot/editor/drag/setup_max_node
