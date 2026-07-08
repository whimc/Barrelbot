#!/usr/bin/env python3
"""Option A: finalize Barrelbot build output for Minecraft 1.21.11."""

from __future__ import annotations

import json
import re
import shutil
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
DATA = ROOT / "build" / "barrelbot_data_pack" / "data"
RES = ROOT / "build" / "barrelbot_resource_pack"

PLURAL_DIRS = {
    "functions",
    "advancements",
    "loot_tables",
    "predicates",
    "item_modifiers",
}

TAG_PLURAL_DIRS = {
    "functions",
    "blocks",
    "entity_types",
    "items",
}


def remove_plural_datapack_dirs() -> None:
    import subprocess

    for ns_dir in DATA.iterdir():
        if not ns_dir.is_dir():
            continue
        # Only remove legacy top-level folders like data/<ns>/functions.
        # Do not recurse: paths like data/whimc/function/barrelbot/functions are valid.
        for plural in PLURAL_DIRS:
            path = ns_dir / plural
            if path.is_dir():
                subprocess.run(
                    ["powershell", "-NoProfile", "-Command",
                     f"Remove-Item -LiteralPath '{path}' -Recurse -Force"],
                    check=True,
                )
                print(f"removed {path.relative_to(ROOT)}")
        tags = ns_dir / "tags"
        if tags.is_dir():
            for plural in TAG_PLURAL_DIRS:
                path = tags / plural
                if path.is_dir():
                    subprocess.run(
                        ["powershell", "-NoProfile", "-Command",
                         f"Remove-Item -LiteralPath '{path}' -Recurse -Force"],
                        check=True,
                    )
                    print(f"removed {path.relative_to(ROOT)}")


def write_pack_meta(path: Path, description: str, fmt: list[int]) -> None:
    path.write_text(
        json.dumps(
            {
                "pack": {
                    "min_format": fmt,
                    "max_format": fmt,
                    "description": description,
                }
            },
            indent=2,
        )
        + "\n",
        encoding="utf-8",
    )


def convert_overrides_to_items(model_path: Path) -> None:
    data = json.loads(model_path.read_text(encoding="utf-8"))
    overrides = data.get("overrides")
    if not overrides:
        return

    item_id = model_path.stem
    fallback_parent = data.get("parent", f"minecraft:item/{item_id}")
    if fallback_parent.startswith("minecraft:block/"):
        fallback_model = fallback_parent
    elif fallback_parent.startswith("minecraft:item/"):
        fallback_model = fallback_parent
    else:
        fallback_model = f"minecraft:item/{item_id}"

    entries = []
    for override in sorted(overrides, key=lambda o: o["predicate"]["custom_model_data"]):
        cmd = override["predicate"]["custom_model_data"]
        model = override["model"]
        entries.append(
            {
                "threshold": cmd,
                "model": {"type": "minecraft:model", "model": model},
            }
        )

    items_dir = model_path.parents[2] / "items"
    items_dir.mkdir(parents=True, exist_ok=True)
    item_def = {
        "model": {
            "type": "minecraft:range_dispatch",
            "property": "minecraft:custom_model_data",
            "index": 0,
            "fallback": {"type": "minecraft:model", "model": fallback_model},
            "entries": entries,
        }
    }
    (items_dir / f"{item_id}.json").write_text(
        json.dumps(item_def, indent=2) + "\n", encoding="utf-8"
    )

    # Keep only the vanilla base model definition.
    base = {
        k: v
        for k, v in data.items()
        if k in {"parent", "textures", "display", "gui_light"}
    }
    model_path.write_text(json.dumps(base, indent=2) + "\n", encoding="utf-8")
    print(f"converted item model {item_id} ({len(entries)} overrides)")


def migrate_resource_pack() -> None:
    models_dir = RES / "assets" / "minecraft" / "models" / "item"
    for model_path in sorted(models_dir.glob("*.json")):
        convert_overrides_to_items(model_path)

    blocks_atlas = RES / "assets" / "minecraft" / "atlases" / "blocks.json"
    items_atlas = RES / "assets" / "minecraft" / "atlases" / "items.json"
    if blocks_atlas.exists():
        shutil.copyfile(blocks_atlas, items_atlas)
        print("created items atlas from blocks atlas")

    write_pack_meta(
        RES / "pack.mcmeta",
        "WHIMC Barrelbot Pack\nAuthor: Kobe Duda\nMinecraft 1.21.11",
        [75, 0],
    )


def fix_datapack_metadata() -> None:
    write_pack_meta(
        ROOT / "build" / "barrelbot_data_pack" / "pack.mcmeta",
        "WHIMC Barrelbot Pack\nAuthor: Kobe Duda\nMinecraft 1.21.11",
        [94, 1],
    )


def migrate_dev_book_give(dev_book: Path) -> None:
    if not dev_book.exists():
        print("give_dev_book missing, skipping")
        return

    text = dev_book.read_text(encoding="utf-8").strip()
    if "minecraft:written_book_content" in text:
        print("give_dev_book already migrated, skipping")
        return

    pages_match = re.search(r"pages:\s*\[(.*)\]\s*,\s*title", text, re.DOTALL)
    if not pages_match:
        pages_match = re.search(r"pages:\s*\[(.*)\]\s*\}", text, re.DOTALL)
    if not pages_match:
        raise RuntimeError("Could not parse dev book pages")

    pages_blob = pages_match.group(1).replace("\\\n", "").replace("\\", "")
    pages = re.findall(r"'((?:\\'|[^'])*)'", pages_blob)
    if not pages:
        raise RuntimeError("Could not parse dev book page strings")

    pages_snbt = "[" + ",".join(f"'{p}'" for p in pages) + "]"
    dev_book.write_text(
        "give @s written_book[minecraft:custom_name={text:'Barrelbot Dev Book',color:'#FFAA00',bold:true,italic:false},"
        "minecraft:custom_data={barrelbot_dev_book:1b},"
        f"minecraft:written_book_content={{pages:{pages_snbt},title:'',author:''}}]\n",
        encoding="utf-8",
    )
    print("updated give_dev_book")


def fix_remaining_datapack_files() -> None:
    migrate_dev_book_give(
        DATA / "whimc" / "function" / "barrelbot" / "dev" / "give_dev_book.mcfunction"
    )

    click_wfoas = DATA / "whimc" / "function" / "technical" / "click_wfoas.mcfunction"
    if click_wfoas.exists():
        original = click_wfoas.read_text(encoding="utf-8")
        updated = original.replace(
            "{ClickedItem: {tag: {whimc_puzzle_wand: 1b}}}",
            '{ClickedItem: {components: {"minecraft:custom_data": {whimc_puzzle_wand: 1b}}}}',
        )
        if updated != original:
            click_wfoas.write_text(updated, encoding="utf-8")

    for rel, key in [
        ("whimc/predicate/barrelbot/holding_edit_wand.json", {"whimc_puzzle_wand": True}),
        ("whimc/predicate/barrelbot/holding_dev_book.json", {"barrelbot_dev_book": True}),
    ]:
        path = DATA / rel
        if not path.exists():
            continue
        data = json.loads(path.read_text(encoding="utf-8"))
        hand = data["predicate"]["equipment"]["mainhand"]
        if "nbt" in hand:
            hand.pop("nbt")
            hand["predicates"] = {"minecraft:custom_data": key}
            path.write_text(json.dumps(data, indent=2) + "\n", encoding="utf-8")

    press_f = DATA / "whimc" / "advancement" / "interact" / "press_f_wand.json"
    if press_f.exists():
        pf = json.loads(press_f.read_text(encoding="utf-8"))
        changed = False
        for section in ("player", "parent"):
            if section in pf["criteria"]["requirement"]["conditions"]:
                cond = pf["criteria"]["requirement"]["conditions"][section]
                if "equipment" in cond:
                    for slot in cond["equipment"].values():
                        if "nbt" in slot:
                            slot.pop("nbt")
                            slot["predicates"] = {"minecraft:custom_data": {"whimc_puzzle_wand": True}}
                            changed = True
        if changed:
            press_f.write_text(json.dumps(pf, indent=2) + "\n", encoding="utf-8")

    scan_layer = DATA / "whimc" / "function" / "barrelbot" / "block" / "scan_layer.mcfunction"
    if scan_layer.exists():
        scan_layer.write_text(
            scan_layer.read_text(encoding="utf-8").replace(
                '#whimc:custom_blocks{Items: [{tag: {whimc: {block: {}}}}]}',
                '#whimc:custom_blocks[minecraft:container={items:[{components:{"minecraft:custom_data":{whimc:{block:{}}}}}]}]',
            ),
            encoding="utf-8",
        )

    recursion_limit = (
        DATA / "whimc" / "function" / "barrelbot" / "functions" / "recursion_limit_reached.mcfunction"
    )
    if recursion_limit.exists():
        recursion_limit.write_text(
            recursion_limit.read_text(encoding="utf-8").replace(
                "black_stained_glass_pane{CustomModelData: 130002}",
                "black_stained_glass_pane[minecraft:custom_model_data=130002]",
            ),
            encoding="utf-8",
        )

    interaction_rewards = {
        "whimc/advancement/interact/right_click_node.json": "whimc:barrelbot/editor/drag/click_node",
        "whimc/advancement/interact/right_click_function.json": "whimc:barrelbot/functions/interact/right_click",
        "whimc/advancement/interact/right_click_editor.json": "whimc:barrelbot/editor/edit_wand/edit_mode/click",
    }

    for rel, tag in [
        ("whimc/advancement/interact/right_click_node.json", "whimc.editor_node"),
        ("whimc/advancement/interact/right_click_function.json", "whimc.barrelbot.function_interaction"),
        ("whimc/advancement/interact/right_click_editor.json", "whimc.editor_click"),
    ]:
        path = DATA / rel
        if not path.exists():
            continue
        existing = json.loads(path.read_text(encoding="utf-8"))
        entity = existing.get("criteria", {}).get("requirement", {}).get("conditions", {}).get("entity", {})
        if entity.get("type") == "minecraft:interaction" and "nbt" not in entity:
            # Still fix reward function if a prior migration pointed at the wrong handler.
            expected = interaction_rewards[rel]
            if existing.get("rewards", {}).get("function") == expected:
                continue
        path.write_text(
            json.dumps(
                {
                    "criteria": {
                        "requirement": {
                            "trigger": "minecraft:player_interacted_with_entity",
                            "conditions": {
                                "entity": {
                                    "type": "minecraft:interaction",
                                    "tags": [tag],
                                }
                            },
                        }
                    },
                    "rewards": {
                        "function": interaction_rewards[rel],
                    },
                },
                indent=2,
            )
            + "\n",
            encoding="utf-8",
        )

    riding = DATA / "whimc" / "predicate" / "barrelbot" / "riding_edit_instance.json"
    if riding.exists():
        riding.write_text(
            json.dumps(
                {
                    "condition": "minecraft:entity_properties",
                    "entity": "this",
                    "predicate": {
                        "vehicle": {
                            "type": "minecraft:item_display",
                            "tags": ["whimc.editor_base"],
                        }
                    },
                },
                indent=2,
            )
            + "\n",
            encoding="utf-8",
        )

    click_running = DATA / "whimc" / "advancement" / "interact" / "click_running_bot.json"
    if click_running.exists():
        existing = json.loads(click_running.read_text(encoding="utf-8"))
        lock = (
            existing.get("criteria", {})
            .get("requirement", {})
            .get("conditions", {})
            .get("location", [{}])[0]
            .get("predicate", {})
            .get("block", {})
            .get("components", {})
            .get("minecraft:lock", {})
        )
        if lock.get("predicates", {}).get("minecraft:custom_name", {}).get("text"):
            pass  # already migrated by fix_1211_syntax
        else:
            click_running.write_text(
                json.dumps(
                    {
                        "criteria": {
                            "requirement": {
                                "trigger": "minecraft:item_used_on_block",
                                "conditions": {
                                    "location": [
                                        {
                                            "condition": "minecraft:location_check",
                                            "predicate": {
                                                "block": {
                                                    "blocks": ["minecraft:barrel"],
                                                    "components": {
                                                        "minecraft:lock": {
                                                            "predicates": {
                                                                "minecraft:custom_name": {
                                                                    "text": "_LOCKTYPE: RUNNING_"
                                                                }
                                                            }
                                                        }
                                                    },
                                                }
                                            },
                                        }
                                    ]
                                },
                            }
                        },
                        "rewards": {
                            "function": "whimc:barrelbot/bot/bot_running_message",
                        },
                    },
                    indent=2,
                )
                + "\n",
                encoding="utf-8",
            )
    print("fixed predicates and advancements")


def run_syntax_fixes() -> None:
    import runpy

    runpy.run_path(str(ROOT / "scripts" / "fix_1211_syntax.py"), run_name="__main__")


def main() -> None:
    remove_plural_datapack_dirs()
    fix_datapack_metadata()
    fix_remaining_datapack_files()
    migrate_resource_pack()
    run_syntax_fixes()
    print("Migration complete.")


if __name__ == "__main__":
    main()
