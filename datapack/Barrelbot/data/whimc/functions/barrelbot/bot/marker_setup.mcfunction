#> whimc:barrelbot/bot/marker_setup
#   Sets up the marker that rides the barrelbot item display for data storage

tag @s remove whimc.barrelbot.marker.init
data modify entity @s data.SpawnPos set from storage whimc:storage SpawnPos
data modify entity @s data.SpawnRotation set from storage whimc:storage SpawnRotation