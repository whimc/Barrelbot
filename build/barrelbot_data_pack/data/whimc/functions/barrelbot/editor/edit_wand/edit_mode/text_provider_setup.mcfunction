data modify entity @s text set from storage whimc:storage Text[0].text_provider
summon marker ~ ~ ~ {Tags: ["whimc.text_provider_storage", "whimc.text_provider_storage.init"]}
ride @e[type=marker, tag=whimc.text_provider_storage.init, limit=1] mount @s
execute on passengers run function whimc:barrelbot/editor/edit_wand/edit_mode/initialize_text_provider
