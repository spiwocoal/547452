{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    utils.url = "github:numtide/flake-utils";
  };
  outputs = {
    self,
    nixpkgs,
    utils,
  }:
    utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {inherit system;};
      in {
        devShells.default = with pkgs;
          mkShell {
            buildInputs = [
              # planner
              ngspice
              gnuplot
              cairo
              feh
              imagemagick
              openscad
            ];
          };
      }
    );
}
