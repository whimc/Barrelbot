scoreboard players set $bot_count whimc.dummy 0
scoreboard players set $linked_bot_count whimc.dummy 0
$execute store result score $bot_count whimc.dummy if entity @e[type=item_display, tag=whimc.barrelbot, tag=!whimc.dispenser_bot, x=$(min_x), y=$(min_y), z=$(min_z), dx=$(vol_x), dy=$(vol_y), dz=$(vol_z)]
$execute store result score $linked_bot_count whimc.dummy if entity @e[type=item_display, tag=whimc.barrelbot, tag=!whimc.dispenser_bot, predicate=whimc:barrelbot/match_id, x=$(min_x), y=$(min_y), z=$(min_z), dx=$(vol_x), dy=$(vol_y), dz=$(vol_z)]
