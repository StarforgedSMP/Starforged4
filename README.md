# Starforged

A repository containing a 1.20.1 Fabric modpack and infrastructure meant for a
private server, Starforged. Designd to be used with
[packwiz](https://github.com/packwiz/packwiz)

## Documentation

- [Installation](docs/installation/)
- [Modlist](docs/modlist/)
- [Mod Instruductions](docs/mod_introductions/)

## Hacking

Notes on working with and developing this package or/and infrastructure.

### Using the template

A MultiMC/PrismLauncher modpack instance template is provided at
[template/](/template). On its own, this template does not do much but in
combination with the packwiz modpack available in the root of this repository,
you will be able to generate a complete instance of the Starforged modpack.

There are two ways to do this.

#### Exporting the Packwiz modpack

[packwiz]: https://packwiz.infra.link/reference/commands/packwiz/curseforge/export/
[modrinth]: https://packwiz.infra.link/reference/commands/packwiz/modrinth/

[Packwiz](https://github.com/packwiz/packwiz) is capable of exporting modpacks
in multiple formats, which are normally enough. You may use the exported modpack
archives after running [`packwiz curseforge export`](packwiz) or
[`packwiz modrinth export`](modrinth), both of which write a `.zip` file in the
current directory, you may use your favorite launcher with import capabilities[^1]
to import the exportedd modpack.

### Using Utilities

A Python3 script is found in [docs/](/docs/) for the purposes of generating a
complete modlist from the Packwiz metadata. Assuming you have Python3 installed
on your system (Python 3.11 or 3.12 would be recommended), then it may be
invoked with the mods directory as the first argument, and the output path as
the `--output-path` argument.

Example:

```bash
# From repository root
python3 docs/generate.py packwiz/mods --output-path docs/modlist/index.md
```

## External Mods (not on Curseforge/Modrinth)

- Star's Steel

---

[^1]:
    As of writing this page, only MultiMC, PolyMC and PrismLauncher are known
    to be capable of importing Curseforge and Modrinth modpacks from exported
    packs. If your custom launcher can do it too, please add it to the list.
