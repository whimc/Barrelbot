data modify storage whimc:storage Page set value {Buttons: [], Text: []}
data modify storage whimc:storage Page.key set value "puzzle"
data modify storage whimc:storage Page.Buttons append value {item: {id: "minecraft:yellow_stained_glass"}, x_min: -250, x_max: 250, y_min: -600, y_max: -100, command: "function whimc:barrelbot/editor/edit_wand/edit_mode/buttons/puzzle/toggle_size_editor"}
data modify storage whimc:storage Page.Buttons append value {item: {id: "minecraft:orange_stained_glass"}, x_min: -800, x_max: -300, y_min: -600, y_max: -100, command: "function whimc:barrelbot/dev/propagate_changes"}
data modify storage whimc:storage Page.Buttons append value {item: {id: "minecraft:barrier", tag: {CustomModelData: 129999}}, x_min: -125, x_max: 125, y_min: -875, y_max: -625, command: "function whimc:barrelbot/editor/edit_wand/edit_mode/buttons/close"}
