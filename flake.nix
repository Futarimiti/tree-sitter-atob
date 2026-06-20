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
        grammar = import ./default.nix { inherit pkgs; };
      in
      {
        packages.default = grammar;
        devShells.default = import ./shell.nix { inherit pkgs; };
        overlays.default = _: prev: {
          vimPlugins = prev.vimPlugins // {
            nvim-treesitter = prev.vimPlugins.nvim-treesitter // {
              grammarPlugins = prev.vimPlugins.nvim-treesitter.grammarPlugins // {
                atob = prev.vimPlugins.nvim-treesitter.grammarToPlugin grammar;
              };
            };
          };
        };
      }
    );
}
