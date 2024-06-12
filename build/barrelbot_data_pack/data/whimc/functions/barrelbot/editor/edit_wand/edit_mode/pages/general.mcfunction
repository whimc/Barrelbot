data modify storage whimc:storage Page set value {Buttons: [], Text: []}
data modify storage whimc:storage Page.key set value "general"
data modify storage whimc:storage Page.Text append value {data: {transformation: {translation: [0.0f, 0.5f, 0.1f], scale: [1.0f, 1.0f, 1.0f]}}, text_provider: '{"text":"Barrelbot Utilities","color":"yellow"}'}
data modify storage whimc:storage Page.Buttons append value {item: {id: "minecraft:white_stained_glass_pane", tag: {CustomModelData: 130014}}, x_min: 0, x_max: 300, y_min: -400, y_max: -100, command: "function whimc:barrelbot/dev/clone/paste_puzzle", hover_text: "Paste linked puzzle"}
data modify storage whimc:storage Page.Buttons append value {item: {id: "minecraft:white_stained_glass_pane", tag: {CustomModelData: 130016}}, x_min: -300, x_max: 0, y_min: -400, y_max: -100, command: "function whimc:barrelbot/dev/reset_all_puzzles", hover_text: "Reset all puzzles"}
