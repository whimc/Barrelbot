#> whimc:barrelbot/clone/position_bot_clone

$execute positioned ~$(x) ~$(y) ~$(z) run function whimc:barrelbot/dev/spawn_bot
$execute positioned ~$(x) ~$(y) ~$(z) align xyz positioned ~0.5 ~0.5 ~0.5 as @e[type=item_display,tag=whimc.barrelbot,limit=1,sort=nearest] run function whimc:barrelbot/clone/set_bot_data