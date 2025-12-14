{
  description = "eframe devShell";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    esp-dev = {
      url = "github:mirrexagon/nixpkgs-esp-dev";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    esp-dev,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      overlays = [esp-dev.outputs.overlays.default];
      pkgs = import nixpkgs {
        inherit system overlays;
        config.permittedInsecurePackages = [
          "python3.13-ecdsa-0.19.1"
        ];
      };
    in
      with pkgs; {
        devShells.default = mkShell {
          buildInputs = [
            esp-idf-full
            gdb
            minicom
          ];

          shellHook = ''
            export CLANGD_FLAGS="--query-driver=`which riscv32-esp-elf-g++`,`which riscv32-esp-elf-gcc`,`which xtensa-esp32-elf-g++`,`which xtensa-esp32-elf-gcc` --clang-tidy --background-index --suggest-missing-includes"
          '';
        };
      });
}
