{
  description = "Purescript-Lua Flake";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "nixpkgs/nixos-unstable";
    easyps.url = "github:justinwoo/easy-purescript-nix";
    pslua.url = "github:Unisay/purescript-lua";
  };

  outputs = { self, nixpkgs, flake-utils, easyps, pslua }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        epkgs = easyps.packages.${system};
        pkgs = nixpkgs.legacyPackages.${system};
        lpkgs = pkgs.lua53Packages;
      in {
        devShell = pkgs.mkShell {
          buildInputs = with pkgs;
            with lpkgs; [
              dhall
              lua
              luacheck
              nixfmt
              openresty
              pslua.packages.${system}.default
              epkgs.purs-0_15_10
              epkgs.purs-tidy
              epkgs.spago
            ];
        };
      });
}

