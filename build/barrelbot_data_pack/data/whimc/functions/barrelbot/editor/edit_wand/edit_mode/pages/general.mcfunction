data modify storage whimc:storage Page set value {Buttons: [], Text: []}
data modify storage whimc:storage Page.key set value "general"
data modify storage whimc:storage Page.Text append value {data: {transformation: {translation: [0.0f, 0.5f, 0.1f], scale: [1.0f, 1.0f, 1.0f]}}, text_provider: '{"text":"Barrelbot Utilities","color":"yellow"}'}
data modify storage whimc:storage Page.Buttons append value {item: {id: "minecraft:white_stained_glass_pane", tag: {CustomModelData: 130014}}, x_min: -150, x_max: 150, y_min: -150, y_max: 150, command: "function whimc:barrelbot/dev/clone/paste_puzzle", hover_text: "Paste linked puzzle"}
