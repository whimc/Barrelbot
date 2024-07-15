data modify storage whimc:storage Page set value {Buttons: [], Text: []}
data modify storage whimc:storage Page.key set value "instructions"
data modify storage whimc:storage Page.Text append value {data: {transformation: {translation: [0.0f, 0.5f, 0.1f], scale: [1.0f, 1.0f, 1.0f]}}, text_provider: '{"text":"Instructions","color":"yellow"}'}
data modify storage whimc:storage Page.Buttons append value {item: {id: "minecraft:white_stained_glass_pane", tag: {CustomModelData: 130019}}, x_min: 500, x_max: 700, y_min: 100, y_max: 300, command: "function whimc:barrelbot/instructions/move_forward/give", hover_text: "Move Forward"}
data modify storage whimc:storage Page.Buttons append value {item: {id: "minecraft:white_stained_glass_pane", tag: {CustomModelData: 130020}}, x_min: 299, x_max: 499, y_min: 100, y_max: 300, command: "function whimc:barrelbot/instructions/turn_right/give", hover_text: "Turn Right"}
data modify storage whimc:storage Page.Buttons append value {item: {id: "minecraft:white_stained_glass_pane", tag: {CustomModelData: 130021}}, x_min: 99, x_max: 299, y_min: 100, y_max: 300, command: "function whimc:barrelbot/instructions/turn_left/give", hover_text: "Turn Left"}
data modify storage whimc:storage Page.Buttons append value {item: {id: "minecraft:white_stained_glass_pane", tag: {CustomModelData: 130022}}, x_min: -100, x_max: 99, y_min: 100, y_max: 300, command: "function whimc:barrelbot/instructions/move_down/give", hover_text: "Move Down"}
data modify storage whimc:storage Page.Buttons append value {item: {id: "minecraft:white_stained_glass_pane", tag: {CustomModelData: 130023}}, x_min: -300, x_max: -100, y_min: 100, y_max: 300, command: "function whimc:barrelbot/instructions/move_up/give", hover_text: "Move Up"}
data modify storage whimc:storage Page.Buttons append value {item: {id: "minecraft:white_stained_glass_pane", tag: {CustomModelData: 130025}}, x_min: -500, x_max: -300, y_min: 100, y_max: 300, command: "function whimc:barrelbot/instructions/death_ray/give", hover_text: "Death Ray"}
data modify storage whimc:storage Page.Buttons append value {item: {id: "minecraft:white_stained_glass_pane", tag: {CustomModelData: 130026}}, x_min: -700, x_max: -500, y_min: 100, y_max: 300, command: "function whimc:barrelbot/instructions/place_block/give", hover_text: "Place Block"}
data modify storage whimc:storage Page.Buttons append value {item: {id: "minecraft:white_stained_glass_pane", tag: {CustomModelData: 130029}}, x_min: 100, x_max: 300, y_min: -100, y_max: 100, command: "function whimc:barrelbot/instructions/grab_cake/give", hover_text: "Grab Block"}
data modify storage whimc:storage Page.Buttons append value {item: {id: "minecraft:white_stained_glass_pane", tag: {CustomModelData: 130027}}, x_min: -99, x_max: 100, y_min: -100, y_max: 100, command: "function whimc:barrelbot/instructions/grab/give", hover_text: "Grab Any Block"}
data modify storage whimc:storage Page.Buttons append value {item: {id: "minecraft:white_stained_glass_pane", tag: {CustomModelData: 130028}}, x_min: -300, x_max: -99, y_min: -100, y_max: 100, command: "function whimc:barrelbot/instructions/place/give", hover_text: "Drop Block"}
