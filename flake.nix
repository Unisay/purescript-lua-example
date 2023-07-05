{
  description = "Purescript-Lua Flake";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "nixpkgs/nixos-unstable";
    easyps = {
      url = "github:justinwoo/easy-purescript-nix";
      flake = false;
    };
    # pslua.url = "github:Unisay/purescript-lua";
    pslua.url = "/home/yura/projects/purescript/purescript-lua/purescript-lua";
  };

  outputs = { self, nixpkgs, flake-utils, easyps, pslua }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        epkgs = import easyps { inherit pkgs; };
        lpkgs = pkgs.lua53Packages;
      in {
        devShell = pkgs.mkShell {
          buildInputs = with epkgs;
            with pkgs;
            with lpkgs; [
              dhall
              lua
              luacheck
              nixfmt
              openresty
              pslua.packages.${system}.default
              purescript
              purs-tidy
              spago
            ];
        };
      });
}

