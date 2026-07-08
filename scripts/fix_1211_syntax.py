#!/usr/bin/env python3
"""Fix 1.21.11 command and datapack syntax in build output."""

from __future__ import annotations

import json
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
DATA = ROOT / "build" / "barrelbot_data_pack" / "data"

TEXT_COLORS = {
    "gray": "#AAAAAA",
    "grey": "#AAAAAA",
    "blue": "#5555FF",
    "yellow": "#FFFF55",
    "cyan": "#55FFFF",
    "aqua": "#55FFFF",
    "gold": "#FFAA00",
    "green": "#55FF55",
    "red": "#FF5555",
    "white": "#FFFFFF",
    "dark_red": "#AA0000",
    "dark_gray": "#555555",
    "dark_grey": "#555555",
}

# NBT fields that must stay as byte values, not booleans.
NUMERIC_BYTE_FIELDS = frozenset(
    {"Count", "Slot", "Age", "PickupDelay", "Fire", "Health", "HurtTime", "Lifetime"}
)

BLOCK_GIVES: dict[str, str] = {
    "whimc/function/barrelbot/block/barrelbot/give.mcfunction": (
        'give @s barrel[minecraft:custom_name={text:\'Barrelbot\',color:\'#FFFF55\',italic:false},'
        'minecraft:block_entity_data={id:"minecraft:barrel",items:[{slot:0,id:"minecraft:barrier",count:1,'
        'components:{"minecraft:custom_data":{whimc:{block:{id:"barrelbot"}}}}}]},'
        "minecraft:custom_model_data={floats:[130123.0f]}]\n"
    ),
    "whimc/function/barrelbot/block/function/give.mcfunction": (
        'give @s shulker_box[minecraft:custom_name={text:\'Function\',color:\'#55FFFF\',italic:false},'
        'minecraft:block_entity_data={id:"minecraft:shulker_box",items:[{slot:0,id:"minecraft:barrier",count:1,'
        'components:{"minecraft:custom_data":{whimc:{block:{id:"function"}}}}}]},'
        "minecraft:custom_model_data={floats:[130123.0f]}]\n"
    ),
    "whimc/function/barrelbot/block/dispenser_bot/give.mcfunction": (
        'give @s dispenser[minecraft:custom_name={text:\'Dispenser Bot\',color:\'#FFFF55\',italic:false},'
        'minecraft:block_entity_data={id:"minecraft:dispenser",items:[{slot:0,id:"minecraft:barrier",count:1,'
        'components:{"minecraft:custom_data":{whimc:{block:{id:"dispenser_bot"}}}}}]},'
        "minecraft:custom_model_data={floats:[130123.0f]}]\n"
    ),
    "whimc/function/barrelbot/block/instructor/give.mcfunction": (
        'give @s yellow_shulker_box[minecraft:custom_name={text:\'Instructor\',color:\'#55FFFF\',italic:false},'
        'minecraft:block_entity_data={id:"minecraft:shulker_box",items:[{slot:0,id:"minecraft:barrier",count:1,'
        'components:{"minecraft:custom_data":{whimc:{block:{id:"instructor"}}}}}]},'
        "minecraft:custom_model_data={floats:[130000.0f]}]\n"
    ),
}

SCAN_BROKEN_PATTERNS = (
    (
        "if block ~ ~ ~ #whimc:custom_blocks if items block ~ ~ ~ container.0 "
        '*{components:{"minecraft:custom_data":{whimc:{block:{}}}}}',
        "if block ~ ~ ~ #whimc:custom_blocks if data block ~ ~ ~ "
        'Items[0].components."minecraft:custom_data".whimc.block',
    ),
    (
        "if data block ~ ~ ~ items[0].components.\"minecraft:custom_data\".whimc.block",
        'if data block ~ ~ ~ Items[0].components."minecraft:custom_data".whimc.block',
    ),
)

INVENTORY_PUZZLE_ITEM_FILTER = re.compile(
    r'(Inventory|TempInventory)\[\{components:\s*\{"minecraft:custom_data":\s*'
    r'\{barrelbot:\s*\{puzzle_item:(?:true|false|1b|0b)\}\}\}\}\]'
)

LOCK_COMPONENT_PATH = 'components."minecraft:lock"'

LOCK_STRING_NAME = re.compile(
    r'components\.(?:minecraft\.lock|"minecraft:lock") set value \{predicates:\{"minecraft:custom_name":"([^"]+)"\}\}'
)


def fix_block_give_files() -> int:
    changed = 0
    for rel, content in BLOCK_GIVES.items():
        path = DATA / rel
        if path.exists() and path.read_text(encoding="utf-8") != content:
            path.write_text(content, encoding="utf-8")
            changed += 1
    return changed


def fix_text_colors(text: str) -> str:
    for name, hex_color in TEXT_COLORS.items():
        text = text.replace(f"color:'{name}'", f"color:'{hex_color}'")
        text = text.replace(f'color:"{name}"', f'color:"{hex_color}"')
    return text


def fix_custom_model_data(text: str) -> str:
    text = re.sub(
        r"minecraft:custom_model_data=(\d+)",
        r"minecraft:custom_model_data={floats:[\1.0f]}",
        text,
    )
    text = re.sub(
        r'"minecraft:custom_model_data": (\d+)',
        r'"minecraft:custom_model_data":{floats:[\1.0f]}',
        text,
    )
    return text


TEXT_COLOR_NAMES = {
    "green": "#55FF55",
    "red": "#FF5555",
    "yellow": "#FFFF55",
    "blue": "#5555FF",
    "gray": "#AAAAAA",
    "grey": "#AAAAAA",
    "gold": "#FFAA00",
    "white": "#FFFFFF",
}

TEXT_COMPONENT_STRING = re.compile(
    r"(set value |text_provider: )'(\{[^']+\})'"
)


def fix_boolean_literals(text: str) -> str:
    """Only convert custom_data flags; never touch Count/Slot and similar byte fields."""

    def replacer(match: re.Match[str]) -> str:
        field = match.group(1)
        if field in NUMERIC_BYTE_FIELDS:
            return match.group(0)
        if match.group(0).endswith(":1b"):
            return f"{field}:true"
        return f"{field}:false"

    text = re.sub(r"(\w+):1b\b", replacer, text)
    text = re.sub(r"(\w+):0b\b", replacer, text)
    return text


def _json_text_string_to_snbt(json_text: str) -> str:
    """Convert a JSON text string to SNBT component object."""
    data = json.loads(json_text)
    color = data.get("color")
    if isinstance(color, str) and color in TEXT_COLOR_NAMES:
        data["color"] = TEXT_COLOR_NAMES[color]
    parts = [f'text:"{data["text"]}"']
    if "color" in data:
        parts.append(f'color:"{data["color"]}"')
    if data.get("bold"):
        parts.append("bold:true")
    if data.get("italic") is False:
        parts.append("italic:false")
    return "{" + ",".join(parts) + "}"


def fix_text_component_strings(text: str) -> str:
    """Convert quoted JSON text strings to SNBT text component objects."""

    def replace_json(match: re.Match[str]) -> str:
        prefix = match.group(1)
        json_text = match.group(2).replace('\\"', '"')
        return prefix + _json_text_string_to_snbt(json_text)

    text = re.sub(
        r"(set value )'(\{[^']+\})'",
        replace_json,
        text,
    )
    text = re.sub(
        r"(text_provider: )'(\{[^']+\})'",
        replace_json,
        text,
    )
    return text


def fix_corrupted_numeric_bytes(text: str) -> str:
    """Repair byte fields that were incorrectly converted to booleans."""
    replacements = {
        "Count:true": "Count:1b",
        "Count:false": "Count:0b",
        "Slot:true": "Slot:1b",
        "Slot:false": "Slot:0b",
        "Age:true": "Age:1b",
        "Age:false": "Age:0b",
        "PickupDelay:true": "PickupDelay:1b",
        "PickupDelay:false": "PickupDelay:0b",
    }
    for old, new in replacements.items():
        text = text.replace(old, new)
    return text


def fix_entity_item_stack_counts(text: str) -> str:
    """Normalize item_display / summoned item stacks to 1.21 count field."""
    text = text.replace(
        'item: {id: "minecraft:stone_button", Count:1b}',
        'item: {id: "minecraft:stone_button", count: 1}',
    )
    text = text.replace(
        'item: {id: "minecraft:stone_button", Count:true}',
        'item: {id: "minecraft:stone_button", count: 1}',
    )
    text = text.replace(
        'item: {id: "minecraft:barrier", Count:1b}',
        'item: {id: "minecraft:barrier", count: 1}',
    )
    text = text.replace(
        'item: {id: "minecraft:barrier", Count:true}',
        'item: {id: "minecraft:barrier", count: 1}',
    )
    text = text.replace(
        'Item: {id: "minecraft:stone", Count:1b}',
        'Item: {id: "minecraft:stone", count: 1}',
    )
    text = text.replace(
        'Item: {id: "minecraft:stone", Count:true}',
        'Item: {id: "minecraft:stone", count: 1}',
    )
    return text


def fix_particles(text: str) -> str:
    text = re.sub(
        r"particle dust ([\d.]+) ([\d.]+) ([\d.]+) ([\d.]+) (.+)",
        r"particle dust{color:[\1,\2,\3],scale:\4} \5",
        text,
    )
    text = re.sub(
        r"particle dust_color_transition ([\d.]+) ([\d.]+) ([\d.]+) ([\d.]+) "
        r"([\d.]+) ([\d.]+) ([\d.]+) (.+)",
        r"particle dust_color_transition{from_color:[\1,\2,\3],to_color:[\5,\6,\7],scale:\4} \8",
        text,
    )
    return text


def fix_enchantment_glint(text: str) -> str:
    return text.replace(
        "barrier{Enchantments: [{}]}",
        "barrier[minecraft:enchantment_glint_override=true]",
    )


def fix_item_component_paths(text: str) -> str:
    replacements = [
        ("item.tag.barrelbot", 'item.components."minecraft:custom_data".barrelbot'),
        ("item.tag.display.Name", 'item.components."minecraft:custom_name"'),
        ("item.tag.Page", 'item.components."minecraft:custom_data".Page'),
        (
            'data modify storage whimc:storage item.tag.Enchantments set value [{}]',
            'data modify storage whimc:storage item.components."minecraft:enchantment_glint_override" set value true',
        ),
        (
            'data modify storage whimc:storage item.components."minecraft:enchantment_glint_override" set value [{}]',
            'data modify storage whimc:storage item.components."minecraft:enchantment_glint_override" set value true',
        ),
    ]
    for old, new in replacements:
        text = text.replace(old, new)
    return text


def fix_lock_commands(text: str) -> str:
    text = re.sub(
        r"data modify block ~ ~ ~ Lock set value \"([^\"]+)\"",
        rf'data modify block ~ ~ ~ {LOCK_COMPONENT_PATH} set value '
        r'{predicates:{"minecraft:custom_name":{text:"\1"}}}',
        text,
    )
    text = text.replace(
        "components.minecraft.lock",
        LOCK_COMPONENT_PATH,
    )
    text = text.replace(
        "data remove block ~ ~ ~ Lock",
        f"data remove block ~ ~ ~ {LOCK_COMPONENT_PATH}",
    )
    return LOCK_STRING_NAME.sub(
        rf'{LOCK_COMPONENT_PATH} set value {{predicates:{{"minecraft:custom_name":{{text:"\1"}}}}}}',
        text,
    )


def fix_inventory_filters(text: str) -> str:
    return INVENTORY_PUZZLE_ITEM_FILTER.sub(
        lambda m: (
            f'{m.group(1)}[{{components:{{"minecraft:custom_data":'
            f'{{barrelbot:{{puzzle_item:1b}}}}}}}}]'
        ),
        text,
    )


def fix_scan_layer(text: str) -> str:
    for old, new in SCAN_BROKEN_PATTERNS:
        text = text.replace(old, new)
    return text


def fix_mcfunction(path: Path) -> bool:
    original = path.read_text(encoding="utf-8")
    text = original
    text = fix_text_colors(text)
    text = fix_custom_model_data(text)
    text = fix_boolean_literals(text)
    text = fix_corrupted_numeric_bytes(text)
    text = fix_entity_item_stack_counts(text)
    text = fix_text_component_strings(text)
    text = fix_particles(text)
    text = fix_enchantment_glint(text)
    text = fix_item_component_paths(text)
    text = fix_lock_commands(text)
    text = fix_inventory_filters(text)
    text = fix_scan_layer(text)
    if text != original:
        path.write_text(text, encoding="utf-8")
        return True
    return False


def fix_set_lore_in_json(obj: object) -> None:
    if isinstance(obj, dict):
        if obj.get("function") == "minecraft:set_lore":
            mode = obj.get("mode")
            if mode is None or mode == "replace" or mode == {"type": "replace_all"}:
                obj["mode"] = "replace_all"
        for value in obj.values():
            fix_set_lore_in_json(value)
    elif isinstance(obj, list):
        for item in obj:
            fix_set_lore_in_json(item)


def fix_lock_predicate_in_json(obj: object) -> None:
    if isinstance(obj, dict):
        if "minecraft:custom_name" in obj and isinstance(obj["minecraft:custom_name"], str):
            obj["minecraft:custom_name"] = {"text": obj["minecraft:custom_name"]}
        for value in obj.values():
            fix_lock_predicate_in_json(value)
    elif isinstance(obj, list):
        for item in obj:
            fix_lock_predicate_in_json(item)


INTERACTION_ADVANCEMENT_FUNCTIONS = {
    "right_click_editor.json": "whimc:barrelbot/editor/edit_wand/edit_mode/click",
    "right_click_node.json": "whimc:barrelbot/editor/drag/click_node",
    "right_click_function.json": "whimc:barrelbot/functions/interact/right_click",
}


def fix_interaction_advancements(data: dict, path: Path) -> None:
    expected = INTERACTION_ADVANCEMENT_FUNCTIONS.get(path.name)
    if not expected:
        return
    rewards = data.get("rewards", {})
    if rewards.get("function") != expected:
        rewards["function"] = expected


def fix_place_custom_block_advancement(data: dict) -> None:
    tool = (
        data.get("criteria", {})
        .get("requirement", {})
        .get("conditions", {})
        .get("location", [{}])[1]
        .get("predicate", {})
        .get("predicates", {})
        .get("minecraft:block_entity_data")
    )
    if not isinstance(tool, dict):
        return
    if "Items" in tool and "items" not in tool:
        tool["items"] = tool.pop("Items")


def fix_receive_puzzle_item_advancement(data: dict) -> None:
    data["criteria"] = {
        "components": {
            "trigger": "minecraft:inventory_changed",
            "conditions": {
                "items": [
                    {
                        "predicates": {
                            "minecraft:custom_data": {
                                "barrelbot": {"puzzle_item": 1}
                            }
                        }
                    }
                ]
            },
        },
        "legacy_tag": {
            "trigger": "minecraft:inventory_changed",
            "conditions": {
                "items": [{"nbt": "{barrelbot:{puzzle_item:1b}}"}]
            },
        },
    }
    data["requirements"] = [["components"], ["legacy_tag"]]
    rewards = data.setdefault("rewards", {})
    rewards["function"] = "whimc:barrelbot/no_smuggle/receive_puzzle_item"


ASSIGN_ID_LEGACY_FALLBACK = """data modify storage whimc:storage Item set from storage whimc:storage Inventory[{components:{"minecraft:custom_data":{barrelbot:{puzzle_item:1b}}}}]
execute unless data storage whimc:storage Item run data modify storage whimc:storage Item set from storage whimc:storage Inventory[{tag:{barrelbot:{puzzle_item:1b}}}]
execute store result score @s whimc.barrelbot.in_puzzle_id run data get storage whimc:storage Item.components."minecraft:custom_data".barrelbot.puzzle_id
execute unless score @s whimc.barrelbot.in_puzzle_id matches 1.. run execute store result score @s whimc.barrelbot.in_puzzle_id run data get storage whimc:storage Item.tag.barrelbot.puzzle_id"""

SCAN_MISMATCH_LEGACY = """data modify storage whimc:storage TempInventory set from storage whimc:storage Inventory
$data remove storage whimc:storage TempInventory[{components:{"minecraft:custom_data":{barrelbot:{puzzle_id:$(id)}}}}]
$data remove storage whimc:storage TempInventory[{tag:{barrelbot:{puzzle_id:$(id)}}}}]
execute if data storage whimc:storage TempInventory[{components:{"minecraft:custom_data":{barrelbot:{puzzle_item:1b}}}}] run function whimc:barrelbot/no_smuggle/return_all_items
execute if data storage whimc:storage TempInventory[{tag:{barrelbot:{puzzle_item:1b}}}}] run function whimc:barrelbot/no_smuggle/return_all_items"""


def fix_no_smuggle_legacy_paths(path: Path) -> bool:
    if path.name == "assign_id.mcfunction":
        text = path.read_text(encoding="utf-8")
        updated = re.sub(
            r"tag @s add whimc\.in_puzzle\n"
            r"data modify storage whimc:storage Item set from storage whimc:storage Inventory\[\{components:\{\"minecraft:custom_data\":\{barrelbot:\{puzzle_item:1b\}\}\}\}\]\n"
            r"execute store result score @s whimc\.barrelbot\.in_puzzle_id run data get storage whimc:storage Item\.components\.\"minecraft:custom_data\"\.barrelbot\.puzzle_id",
            "tag @s add whimc.in_puzzle\n" + ASSIGN_ID_LEGACY_FALLBACK,
            text,
            count=1,
        )
        if updated != text:
            path.write_text(updated, encoding="utf-8")
            return True
    if path.name == "scan_for_mismatch.mcfunction":
        text = path.read_text(encoding="utf-8")
        if "tag:{barrelbot:{puzzle_id:" not in text:
            path.write_text(SCAN_MISMATCH_LEGACY + "\n", encoding="utf-8")
            return True
    if path.name == "return_all_items.mcfunction":
        text = path.read_text(encoding="utf-8")
        updated = text
        updated = updated.replace(
            'execute unless data entity @s Inventory[{components:{"minecraft:custom_data":{barrelbot:{puzzle_item:1b}}}}] run return 0',
            'execute unless data entity @s Inventory[{components:{"minecraft:custom_data":{barrelbot:{puzzle_item:1b}}}}] '
            'unless data entity @s Inventory[{tag:{barrelbot:{puzzle_item:1b}}}] run return 0',
        )
        legacy_tail = (
            'execute unless data entity @s Inventory[{components:{"minecraft:custom_data":{barrelbot:{puzzle_item:1b}}}}] '
            'if data entity @s Inventory[{tag:{barrelbot:{puzzle_item:1b}}}] '
            "run function whimc:barrelbot/no_smuggle/return_all_items/nested_execute_0"
        )
        if legacy_tail not in updated:
            updated = updated.replace(
                'execute if data entity @s Inventory[{components:{"minecraft:custom_data":{barrelbot:{puzzle_item:1b}}}}] '
                "run function whimc:barrelbot/no_smuggle/return_all_items/nested_execute_0",
                'execute if data entity @s Inventory[{components:{"minecraft:custom_data":{barrelbot:{puzzle_item:1b}}}}] '
                "run function whimc:barrelbot/no_smuggle/return_all_items/nested_execute_0\n"
                + legacy_tail,
            )
        if updated != text:
            path.write_text(updated, encoding="utf-8")
            return True
    if path.name == "recursively_return_items.mcfunction":
        text = path.read_text(encoding="utf-8")
        legacy_line = (
            "execute unless data storage whimc:storage Inventory[0].components."
            '"minecraft:custom_data".barrelbot.puzzle_item if data storage whimc:storage '
            "Inventory[0].tag.barrelbot.puzzle_item run function whimc:barrelbot/no_smuggle/return_item"
        )
        if legacy_line not in text:
            updated = text.replace(
                'execute if data storage whimc:storage Inventory[0].components."minecraft:custom_data".barrelbot.puzzle_item run function whimc:barrelbot/no_smuggle/return_item',
                'execute if data storage whimc:storage Inventory[0].components."minecraft:custom_data".barrelbot.puzzle_item run function whimc:barrelbot/no_smuggle/return_item\n'
                + legacy_line,
            )
            if updated != text:
                path.write_text(updated, encoding="utf-8")
                return True
    if path.name == "return_item.mcfunction":
        text = path.read_text(encoding="utf-8")
        legacy_line = (
            "execute unless score $temp whimc.barrelbot.bot_id matches 1.. run execute store result score $temp whimc.barrelbot.bot_id "
            'run data get storage whimc:storage Inventory[0].tag.barrelbot.instructor_id'
        )
        if legacy_line not in text:
            updated = text.replace(
                "execute store result score $temp whimc.barrelbot.bot_id run data get storage whimc:storage Inventory[0].components.\"minecraft:custom_data\".barrelbot.instructor_id",
                'execute store result score $temp whimc.barrelbot.bot_id run data get storage whimc:storage Inventory[0].components."minecraft:custom_data".barrelbot.instructor_id\n'
                + legacy_line,
            )
            if updated != text:
                path.write_text(updated, encoding="utf-8")
                return True
    return False


def fix_edit_menu_interaction(path: Path) -> bool:
    if path.name == "enter_edit_mode.mcfunction":
        text = path.read_text(encoding="utf-8")
        updated = text.replace("width: 0.01f", "width: 2.0f")
        if updated != text:
            path.write_text(updated, encoding="utf-8")
            return True
    if path.name == "edit_tick.mcfunction":
        text = path.read_text(encoding="utf-8")
        if "whimc.editor_click" not in text:
            updated = (
                "execute on vehicle on passengers as @s[type=minecraft:interaction,tag=whimc.editor_click] "
                "if data entity @s interaction on target run function whimc:barrelbot/editor/edit_wand/edit_mode/click\n"
                + text
            )
            path.write_text(updated, encoding="utf-8")
            return True
    if path.name == "click.mcfunction":
        text = path.read_text(encoding="utf-8")
        legacy_line = (
            "execute on vehicle on passengers as @s[type=minecraft:interaction,tag=whimc.editor_click] "
            "run data remove entity @s interaction"
        )
        if legacy_line not in text:
            updated = text.replace(
                "advancement revoke @s only whimc:interact/right_click_editor\n",
                "advancement revoke @s only whimc:interact/right_click_editor\n" + legacy_line + "\n",
            )
            if updated != text:
                path.write_text(updated, encoding="utf-8")
                return True
    return False


def fix_json_file(path: Path) -> bool:
    original = path.read_text(encoding="utf-8")
    data = json.loads(original)
    fix_set_lore_in_json(data)
    if "advancement" in path.parts:
        fix_lock_predicate_in_json(data)
        fix_interaction_advancements(data, path)
        if path.name == "place_custom_block.json":
            fix_place_custom_block_advancement(data)
        if path.name == "receive_puzzle_item.json":
            fix_receive_puzzle_item_advancement(data)

    updated = json.dumps(data, indent=2) + "\n"
    if updated != original:
        path.write_text(updated, encoding="utf-8")
        return True
    return False


def main() -> None:
    mc_changed = 0
    for path in DATA.rglob("*.mcfunction"):
        changed = False
        if fix_mcfunction(path):
            changed = True
        if fix_no_smuggle_legacy_paths(path):
            changed = True
        if fix_edit_menu_interaction(path):
            changed = True
        if changed:
            mc_changed += 1

    json_changed = 0
    for path in DATA.rglob("*.json"):
        if fix_json_file(path):
            json_changed += 1

    block_give_changed = fix_block_give_files()

    print(
        f"Updated {mc_changed} mcfunction files, {json_changed} json files, "
        f"and {block_give_changed} block give files."
    )


if __name__ == "__main__":
    main()
