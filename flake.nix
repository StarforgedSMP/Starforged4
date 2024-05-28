{
  # Use nixpkgs stable
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";

  outputs = {
    self,
    nixpkgs,
    ...
  }: let
    systems = ["x86_64-linux" "aarch64-linux"];
    forEachSystem = nixpkgs.lib.genAttrs systems;

    pkgsForEach = nixpkgs.legacyPackages;
  in {
    packages = forEachSystem (system: {
      default = pkgsForEach.${system}.writers.writePython3Bin "build-all-hosts" {
        flakeIgnore = ["E501"];
      } (builtins.readFile self + /docs/generate.py);
    });

    devShells = forEachSystem (system: {
      default = pkgsForEach.${system}.mkShellNoCC {
        packages = [self.packages.${system}.default];
      };
    });
  };
}
