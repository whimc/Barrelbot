data modify storage whimc:storage Page set value {Buttons: [], Text: []}
data modify storage whimc:storage Page.key set value "success_conditions_0"
data modify storage whimc:storage Page.Buttons append value {item: {id: "minecraft:barrier", tag: {CustomModelData: 130002}}, x_min: 449, x_max: 750, y_min: -650, y_max: -350, page: "success_conditions_0", hover_text: "Previous Page"}
data modify storage whimc:storage Page.Buttons append value {item: {id: "minecraft:barrier", tag: {CustomModelData: 130001}}, x_min: 150, x_max: 450, y_min: -650, y_max: -350, command: "data modify entity @e[type=marker,limit=1,tag=whimc.barrelbot.puzzle_storage,predicate=whimc:barrelbot/match_edit_id] data.success_function set value touch_green", hover_text: "Touch Green"}
data modify storage whimc:storage Page.Buttons append value {item: {id: "minecraft:barrier", tag: {CustomModelData: 130004}}, x_min: -149, x_max: 150, y_min: -650, y_max: -350, command: "data modify entity @e[type=marker,limit=1,tag=whimc.barrelbot.puzzle_storage,predicate=whimc:barrelbot/match_edit_id] data.success_function set value touch_observer", hover_text: "Touch Observer"}
data modify storage whimc:storage Page.Buttons append value {item: {id: "minecraft:barrier", tag: {CustomModelData: 0}}, x_min: -449, x_max: -149, y_min: -650, y_max: -350, command: "data modify entity @e[type=marker,limit=1,tag=whimc.barrelbot.puzzle_storage,predicate=whimc:barrelbot/match_edit_id] data.success_function set value defer", hover_text: "Defer to Barrelbots"}
data modify storage whimc:storage Page.Buttons append value {item: {id: "minecraft:barrier", tag: {CustomModelData: 130003}}, x_min: -750, x_max: -449, y_min: -650, y_max: -350, page: "success_conditions_0", hover_text: "Next Page"}
data modify storage whimc:storage Page.Text append value {data: {transformation: {translation: [0.0f, 0.75f, 0.0f], scale: [1.0f, 1.0f, 1.0f]}}, text_provider: '{"text":"Success Conditions","color":"yellow"}'}
