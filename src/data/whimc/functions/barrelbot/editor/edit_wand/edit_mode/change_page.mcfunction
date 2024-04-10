#> whimc:barrelbot/editor/edit_wand/edit_mode/change_page
#   Swaps the page being displayed

#Unrender previous page
function whimc:barrelbot/editor/edit_wand/edit_mode/erase_page

#Render new page
execute on vehicle rotated as @s on passengers as @s[type=player] anchored eyes positioned ^ ^ ^1.25 run function whimc:barrelbot/editor/edit_wand/edit_mode/load_page_display with storage whimc:storage ClickedButton

#Load new page into base
execute on vehicle run data modify entity @s item.tag.Page set from storage whimc:storage Page