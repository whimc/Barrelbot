#> whimc:barrelbot/editor/edit_wand/edit_mode/initialize_text_provider
#   Initializes a text provider storage

data modify entity @s data.text set from storage whimc:storage Text[0].text_provider
tag @s remove whimc.text_provider_storage.init