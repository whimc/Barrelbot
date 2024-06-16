# Reassigns the player's in_puzzle_id if they interact with a feature from a puzzle
entity_type_tag whimc:features {
  "values": [
    "minecraft:item_display",
    "minecraft:text_display",
    "minecraft:marker"
  ]
}

block_tag whimc:interactables {
    "values": [
        "#minecraft:buttons",
        "#minecraft:shulker_boxes",
        "minecraft:barrel",
        "minecraft:dispenser"
    ]
}

advancement ./click_feature {
  "criteria": {
    "requirement": {
      "trigger": "minecraft:item_used_on_block",
      "conditions": {
        "location": [
          {
            "condition": "minecraft:location_check",
            "predicate": {
              "block": {
                "tag": "whimc:interactables"
              }
            }
          }
        ]
      }
    }
  },
  "rewards": {
    "function": "whimc:barrelbot/data_collection/click_feature"
  }
}

advancement revoke @s only ./click_feature

# Perform raycast
scoreboard players set $raycast whimc.dummy 30
scoreboard players set $out whimc.barrelbot.in_puzzle_id -1
execute anchored eyes positioned ^ ^ ^ run function ~/raycast

# Assign ID if something was found
execute unless score $out whimc.barrelbot.in_puzzle_id matches -1 run scoreboard players operation @s whimc.barrelbot.in_puzzle_id = $out whimc.barrelbot.in_puzzle_id

function ~/raycast:
  execute if block ~ ~ ~ #whimc:interactables:
    execute align xyz as @e[type=#whimc:features,dx=0,dy=0,dz=0,scores={whimc.barrelbot.puzzle_id=-2147483648..2147483647}] run scoreboard players operation $out whimc.barrelbot.in_puzzle_id = @s whimc.barrelbot.puzzle_id

  scoreboard players remove $raycast whimc.dummy 1
  execute if score $raycast whimc.dummy matches 1.. if score $out whimc.barrelbot.in_puzzle_id matches -1 positioned ^ ^ ^0.2 run function ~/