function whimc:barrelbot/editor/edit_wand/edit_mode/erase_page
execute on vehicle rotated as @s on passengers as @s[type=player] anchored eyes positioned ^ ^ ^1.25 run function whimc:barrelbot/editor/edit_wand/edit_mode/load_page_display with storage whimc:storage ClickedButton
execute on vehicle run data modify entity @s item.tag.Page set from storage whimc:storage Page
