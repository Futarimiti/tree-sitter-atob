{
  description = "tree-sitter-atob";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    utils.url = "github:numtide/flake-utils";
  };

  outputs =
    { nixpkgs, utils, ... }:
    utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        packages.default = import ./default.nix { inherit pkgs; };
        devShells.default = import ./shell.nix { inherit pkgs; };
      }
    );
}
