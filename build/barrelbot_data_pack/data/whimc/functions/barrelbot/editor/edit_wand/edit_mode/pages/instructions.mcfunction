data modify storage whimc:storage Page set value {Buttons: [], Text: []}
data modify storage whimc:storage Page.key set value "instructions"
data modify storage whimc:storage Page.Text append value {data: {transformation: {translation: [0.0f, 0.5f, 0.1f], scale: [1.0f, 1.0f, 1.0f]}}, text_provider: '{"text":"Instructions","color":"yellow"}'}
data modify storage whimc:storage Page.Buttons append value {item: {id: "minecraft:white_stained_glass_pane", tag: {CustomModelData: 130019}}, x_min: -100, x_max: 100, y_min: -100, y_max: 100, command: "function whimc:barrelbot/instructions/move_forward/give", hover_text: "Move Forward"}
