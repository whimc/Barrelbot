data modify storage whimc:storage Page set value {Buttons: [], Text: []}
data modify storage whimc:storage Page.key set value "general"
data modify storage whimc:storage Page.Text append value {data: {transformation: {translation: [0.0f, 0.5f, 0.1f], scale: [1.0f, 1.0f, 1.0f]}}, text_provider: '{"text":"Barrelbot Utilities","color":"yellow"}'}
data modify storage whimc:storage Page.Buttons append value {item: {id: "minecraft:white_stained_glass_pane", tag: {CustomModelData: 130014}}, x_min: 149, x_max: 449, y_min: -400, y_max: -100, command: "function whimc:barrelbot/dev/clone/paste_puzzle", hover_text: "Paste linked puzzle"}
data modify storage whimc:storage Page.Buttons append value {item: {id: "minecraft:white_stained_glass_pane", tag: {CustomModelData: 130017}}, x_min: -150, x_max: 149, y_min: -400, y_max: -100, page: "instructions", hover_text: "Get instruction items"}
data modify storage whimc:storage Page.Buttons append value {item: {id: "minecraft:white_stained_glass_pane", tag: {CustomModelData: 130018}}, x_min: -450, x_max: -150, y_min: -400, y_max: -100, page: "blocks", hover_text: "Get blocks"}
