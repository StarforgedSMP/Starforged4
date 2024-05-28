# Starforged

A repository containing a 1.20.1 Fabric modpack and infrastructure meant for a
private server, Starforged. Designd to be used with
[packwiz](https://github.com/packwiz/packwiz)

## Documentation

- [Installation](/docs/installation/)
- [Modlist](/docs/modlist/)
- [Mod Instruductions](/docs/mod_introductions/)

## Hacking

Notes on working on developing this pack, i.e., hacking it.

### Using the template

A MultiMC/PrismLauncher modpack instance template is provided at
[template/](/template). On its own, this template does not do much but in
combination with the packwiz modpack available in the root of this repository,
you will be able to generate a complete instance of the Starforged modpack.

There are two ways to do this.

#### Exporting the Packwiz modpack

### Using Utilities

A Python3 script is found in [docs/](/docs/) for the purposes of generating a
complete modlist from the Packwiz metadata. Assuming you have Python3 installed
on your system (Python 3.11 or 3.12 would be recommended), then it may be
invoked with the mods directory as an argument.

```bash
# From repository root
python3 docs/generate.py packwiz/mods
```

## External Mods (not on Curseforge/Modrinth)

- Star's Steel
