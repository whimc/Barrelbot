#> whimc:barrelbot/editor/edit_wand/edit_mode/load_page_display
#   Loads all the display entities for a page

#Load from storage based on key
data modify storage whimc:storage Page set value {}
$data modify storage whimc:storage Page set from storage whimc:const WandPages[{key:"$(page)"}]

#Loop through all buttons
data modify storage whimc:storage Buttons set from storage whimc:storage Page.Buttons
execute store result score $buttons whimc.dummy if data storage whimc:storage Buttons[]
execute if score $buttons whimc.dummy matches 1.. run function whimc:barrelbot/editor/edit_wand/edit_mode/load_button_display_loop

#Loop through all text displays
data modify storage whimc:storage Text set from storage whimc:storage Page.Text
execute store result score $displays whimc.dummy if data storage whimc:storage Text[]
execute if score $displays whimc.dummy matches 1.. run function whimc:barrelbot/editor/edit_wand/edit_mode/load_text_display_loop