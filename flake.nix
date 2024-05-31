{
  # Use nixpkgs stable
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";

  outputs = {
    self,
    nixpkgs,
    ...
  }: let
    inherit (nixpkgs) lib;
    systems = ["x86_64-linux" "aarch64-linux"];
    forEachSystem = lib.genAttrs systems;

    pkgsForEach = nixpkgs.legacyPackages;
  in {
    packages = forEachSystem (system: let
      pkgs = pkgsForEach.${system};
    in {
      generate-modlist = pkgsForEach.${system}.writers.writePython3Bin "generate-modlist" {
        flakeIgnore = ["E501"];
      } (builtins.readFile self + /docs/generate.py);

      packwiz-installer-bootstrap = let
        name = "packwiz-installer-bootstrap";
        version = "0.0.3";

        jar = builtins.fetchurl {
          url = "https://github.com/packwiz/packwiz-installer-bootstrap/releases/download/v${version}/packwiz-installer-bootstrap.jar";
          sha256 = "0v0i7m2bdjnbrfzmv3f0xyc8nc8sv79q53k8yjbqw9q4qr6v5yx8";
        };
      in
        pkgs.stdenvNoCC.mkDerivation {
          inherit name version;
          nativeBuildInputs = [pkgs.makeWrapper];
          dontUnpack = true;
          dontBuild = true;

          # Generate an executable script to run the jar
          # with the correct JAVA_HOME and the java wrapper.
          installPhase = ''
            makeWrapper ${pkgs.jdk21}/bin/java $out/bin/packwiz-installer-bootstrap \
              --set JAVA_HOME ${pkgs.jdk21.home} \
              --add-flags "-jar ${jar}" \
          '';

          meta = {
            description = "An updater for packwiz-installer";
            homepage = "https://github.com/packwiz/packwiz-installer-bootstrap";
            license = lib.licenses.mit;
            maintainers = with lib.maintainers; [NotAShelf];
          };
        };
    });

    devShells = forEachSystem (system: {
      default = pkgsForEach.${system}.mkShellNoCC {
        packages = [self.packages.${system}.default];
      };
    });
  };
}
