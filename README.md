# Starforged

A repository containing a 1.20.1 Fabric modpack and infrastructure meant for a
private server, Starforged. Designd to be used with
[packwiz](https://github.com/packwiz/packwiz)

## Documentation

Below are available documentation pages on the Modpack, and the server itself.

- [Installation](docs/installation/)
- [Modlist](docs/modlist/)
- [Mod Instruductions](docs/mod_introductions/)

## Hacking

Notes on working with and developing this package or/and infrastructure. If you
are a user, you may ignore this section.

### Exporting the Packwiz modpack

[packwiz]: https://packwiz.infra.link/reference/commands/packwiz/curseforge/export/
[modrinth]: https://packwiz.infra.link/reference/commands/packwiz/modrinth/

[Packwiz](https://github.com/packwiz/packwiz) is capable of exporting modpacks
in multiple formats, which are normally enough. You may use the exported modpack
archives after running [`packwiz curseforge export`](packwiz) or
[`packwiz modrinth export`](modrinth), both of which write a `.zip` file in the
current directory, you may use your favorite launcher with import capabilities[^1]
to import the exported modpack.

### Using Utilities

A Python3 script is found in [`docs`](docs/generate.py) for the purposes of
generating a complete modlist from the Packwiz metadata. Assuming you have
Python3 installed on your system (Python 3.11 or 3.12 would be recommended),
then it may be invoked with the mods directory as the first argument, and the
output path as the `--output-path` argument.

Example:

```bash
# From repository root
python3 docs/generate.py packwiz/mods --output-path docs/modlist/index.md
```

### Documentation

[docs]: https://starforgedsmp.github.io/Starforged4/docs/installation

Documentation for this modpack are generated and published automagically from
available markdown files in this repository. README.md in repository root will
correspond to the index page, and all pages will be available under the same
relative paths without their file extensions.

For example, [`docs/installation/index.md`](docs/installation/index.md) will be
available under [the same relative path](docs).

## External Mods (not on Curseforge/Modrinth)

- Star's Steel

---

[^1]:
    As of writing this page, only MultiMC, PolyMC and PrismLauncher are known
    to be capable of importing Curseforge and Modrinth modpacks from exported
    packs. If your custom launcher can do it too, please add it to the list.
