#!/usr/bin/env python3
"""Package Barrelbot build output for GitHub releases."""

from __future__ import annotations

import argparse
import re
import sys
import zipfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
VERSION_FILE = ROOT / "VERSION"
DATA_PACK = ROOT / "build" / "barrelbot_data_pack"
RESOURCE_PACK = ROOT / "build" / "barrelbot_resource_pack"


def read_version() -> str:
    if not VERSION_FILE.exists():
        raise FileNotFoundError(f"Missing version file: {VERSION_FILE}")
    version = VERSION_FILE.read_text(encoding="utf-8").strip()
    if not re.fullmatch(r"\d+", version):
        raise ValueError(f"VERSION must be a positive integer, got: {version!r}")
    return version


def zip_pack(source: Path, archive: Path) -> None:
    if not source.is_dir():
        raise FileNotFoundError(f"Pack directory not found: {source}")
    if not (source / "pack.mcmeta").is_file():
        raise FileNotFoundError(f"Missing pack.mcmeta in {source}")

    archive.parent.mkdir(parents=True, exist_ok=True)
    if archive.exists():
        archive.unlink()

    with zipfile.ZipFile(archive, "w", compression=zipfile.ZIP_DEFLATED) as zf:
        for path in sorted(source.rglob("*")):
            if path.is_file():
                zf.write(path, path.relative_to(source).as_posix())


def package_release(version: str, output_dir: Path) -> tuple[Path, Path]:
    data_zip = output_dir / f"barrelbot_data_pack_v{version}.zip"
    resource_zip = output_dir / f"barrelbot_resource_pack_v{version}.zip"
    zip_pack(DATA_PACK, data_zip)
    zip_pack(RESOURCE_PACK, resource_zip)
    return data_zip, resource_zip


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--version",
        help="Release version number without the v prefix (default: VERSION file)",
    )
    parser.add_argument(
        "--output",
        type=Path,
        default=ROOT / "dist",
        help="Directory for release zip files (default: dist/)",
    )
    args = parser.parse_args()

    version = args.version or read_version()
    if not re.fullmatch(r"\d+", version):
        print(f"Invalid version: {version!r}", file=sys.stderr)
        return 1

    try:
        data_zip, resource_zip = package_release(version, args.output)
    except (FileNotFoundError, ValueError) as exc:
        print(exc, file=sys.stderr)
        return 1

    print(f"Created {data_zip.relative_to(ROOT)}")
    print(f"Created {resource_zip.relative_to(ROOT)}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
