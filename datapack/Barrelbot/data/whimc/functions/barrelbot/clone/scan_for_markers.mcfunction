#> whimc:barrelbot/clone/scan_for_markers
#   Scans the area for any other puzzles containted within the bounding box

$execute positioned $(x) $(y) $(z) as @e[type=text_display,dx=$(dx),dy=$(dy),dz=$(dz),tag=whimc.barrelbot.puzzle_manager,tag=!whimc.this] run function whimc:barrelbot/clone/clone_subpuzzle