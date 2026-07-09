#!/usr/bin/env python3
"""Regenerate give_dev_book.mcfunction with 1.21.11 text component pages."""

from __future__ import annotations

import json
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / "src" / "data" / "whimc" / "functions" / "barrelbot" / "dev" / "give_dev_book.mcfunction"
OUT = ROOT / "build" / "barrelbot_data_pack" / "data" / "whimc" / "function" / "barrelbot" / "dev" / "give_dev_book.mcfunction"


def escape_snbt_string(value: str) -> str:
    return (
        value.replace("\\", "\\\\")
        .replace('"', '\\"')
        .replace("\n", "\\n")
    )


def click_event_snbt(event: dict) -> str:
    action = event["action"]
    if action == "change_page":
        page = int(event["value"]) - 1
        return f'click_event:{{action:"change_page",page:{page}}}'
    if action == "run_command":
        command = escape_snbt_string(event["value"])
        return f'click_event:{{action:"run_command",command:"{command}"}}'
    if action == "copy_to_clipboard":
        value = escape_snbt_string(event["value"])
        return f'click_event:{{action:"copy_to_clipboard",value:"{value}"}}'
    raise ValueError(f"Unsupported click event: {action}")


def hover_event_snbt(event: dict) -> str:
    value = event.get("value", [])
    if isinstance(value, list) and value:
        text = escape_snbt_string(value[0].get("text", ""))
        return f'hover_event:{{action:"show_text",value:[{{text:"{text}"}}]}}'
    return ""


def component_snbt(component: dict) -> str:
    parts: list[str] = []
    if "text" in component:
        parts.append(f'text:"{escape_snbt_string(component["text"])}"')
    if "color" in component:
        parts.append(f'color:"{component["color"]}"')
    if component.get("bold"):
        parts.append("bold:true")
    if component.get("italic") is False:
        parts.append("italic:false")
    if "clickEvent" in component:
        parts.append(click_event_snbt(component["clickEvent"]))
    if "hoverEvent" in component:
        hover = hover_event_snbt(component["hoverEvent"])
        if hover:
            parts.append(hover)
    return "{" + ",".join(parts) + "}"


def page_snbt(page_json: str) -> str:
    components = json.loads(page_json)
    if not components:
        return '{text:""}'
    root = components[0]
    if len(components) == 1:
        return component_snbt(root)
    root_text = escape_snbt_string(root.get("text", ""))
    extra = ",".join(component_snbt(comp) for comp in components[1:])
    return f'{{text:"{root_text}",extra:[{extra}]}}'


def parse_src_pages(text: str) -> list[str]:
    pages_match = re.search(r"pages:\s*\[(.*)\]\s*\}", text, re.DOTALL)
    if not pages_match:
        raise RuntimeError("Could not parse source dev book pages")
    pages_blob = pages_match.group(1).replace("\\\n", "")
    pages = re.findall(r"'((?:[^'\\]|\\.)*)'", pages_blob, re.DOTALL)
    if not pages:
        raise RuntimeError("No page strings found in source dev book")
    return [bytes(page, "utf-8").decode("unicode_escape") for page in pages]


def main() -> None:
    src_text = SRC.read_text(encoding="utf-8")
    pages = [page_snbt(page) for page in parse_src_pages(src_text)]
    pages_blob = ",".join(pages)
    OUT.write_text(
        "give @s written_book[minecraft:custom_name={text:'Barrelbot Dev Book',color:'#FFAA00',bold:true,italic:false},"
        "minecraft:custom_data={barrelbot_dev_book:true},"
        f"minecraft:written_book_content={{pages:[{pages_blob}],title:'',author:''}}]\n",
        encoding="utf-8",
    )
    print(f"Wrote {OUT}")


if __name__ == "__main__":
    main()
