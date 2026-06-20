{
  pkgs ? import <nixpkgs> { },
}:
pkgs.tree-sitter.buildGrammar {
  language = "atob";
  version = "0.0.1";
  src = ./.;
}
