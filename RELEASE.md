# Releasing Barrelbot

Releases follow the existing GitHub pattern: `v13`, `v15`, etc., each with:

- `barrelbot_data_pack_v{N}.zip`
- `barrelbot_resource_pack_v{N}.zip`

The next release version is tracked in [`VERSION`](VERSION) (currently **15**).

## Automated release (recommended)

1. Update [`VERSION`](VERSION) to the release number.
2. Add release notes in `release-notes/v{N}.md` (optional but recommended).
3. Commit the migrated `build/` output and release files.
4. Create and push the tag:

```bash
git tag v15
git push origin v15
```

The [Release workflow](.github/workflows/release.yml) will:

1. Run `scripts/migrate_build_1211.py`
2. Package `build/barrelbot_data_pack/` and `build/barrelbot_resource_pack/`
3. Publish a GitHub release with both zip assets

## Manual packaging

```bash
python scripts/migrate_build_1211.py
python scripts/package_release.py
```

Zips are written to `dist/`.

To publish manually after packaging:

```bash
gh release create v15 dist/barrelbot_data_pack_v15.zip dist/barrelbot_resource_pack_v15.zip \
  --title "Barrelbot v15" \
  --notes-file release-notes/v15.md
```

## Manual workflow test

Use **Actions → Release → Run workflow** to build zip assets without creating a tag. This is useful for verifying packaging before tagging.

After a successful release, bump `VERSION` to the next number on `main` if you are preparing the following release.
