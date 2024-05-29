import argparse
from pathlib import Path
import re


def read_toml_file(file_path):
    """Reads the contents of a TOML file."""
    try:
        with open(file_path, "r", encoding="utf-8") as file:
            return file.read()
    except FileNotFoundError:
        print(f"File not found: {file_path}")
        return ""


def extract_mod_info(content):
    """Extracts the mod name & modrinth ID from the given TOML content."""
    mod_name_match = re.search(r'name = "([^"]+)"', content)
    mod_id_match = re.search(r'mod-id = "([^"]+)"', content)
    if mod_name_match and mod_id_match:
        return mod_name_match.group(1), mod_id_match.group(1)
    elif mod_name_match:
        return mod_name_match.group(1), None
    else:
        return None, None


def generate_markdown(mods_info):
    """Generates markdown content based on the mods info."""
    markdown_content = (
        "# Mod List\n\n"
        "The list of all mods present in the modpack.\n\n"
        "For a brief introduction for the mods that matter, please see the "
        "[Mod Introductions](/docs/mod-introductions) page.\n\n"
    )
    for mod_name, mod_id in mods_info:
        link_text = (
            f"[{mod_name}]({f'https://modrinth.com/mod/{mod_id}' if mod_id else ''})"
        )
        markdown_content += f"- {link_text}\n"
    return markdown_content


def main(mods_directory, output_path="./index.md"):
    mods_info = []
    # Process all.pw.toml files
    for file_path in Path(mods_directory).glob("*.pw.toml"):
        content = read_toml_file(file_path)
        mod_name, mod_id = extract_mod_info(content)
        mods_info.append((mod_name, mod_id))

    # Generate and write markdown content
    markdown_file_path = Path(output_path)
    markdown_content = generate_markdown(mods_info)
    with markdown_file_path.open("w", encoding="utf-8", newline="\n") as markdown_file:
        markdown_file.write(markdown_content)

    print(f"Markdown file generated successfully at: {markdown_file_path}")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Generate a markdown index of mods.")
    parser.add_argument(
        "mods_directory",
        type=str,
        help="Path to the directory containing.pw.toml files",
    )
    parser.add_argument(
        "--output-path",
        type=str,
        default="./index.md",
        help="Path to save the generated markdown file",
    )
    args = parser.parse_args()

    main(args.mods_directory, args.output_path)
