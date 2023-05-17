**Disclaimer:** (2023-05-17) the project is in the "*almost ready to be usable*" state (read: it isn't working as you'd expect it to work), I am finilizing core libs and final optimisations in the backend.

# Example project for the purescript-lua

This project exists to demonstrate usage of the [PureScript compiler backend for Lua](https://github.com/Unisay/purescript-lua).

## How to build

The project relies on `nix` to build dependencies.

1. Initialize nix shell:  
    * Using `direnv`: `direnv allow`.
    * Using `nix develop` command.

2. Inside nix shell run pre-defined `build` script:

```sh
$ build
Building...
[  1 of 151] Compiling Unsafe.Coerce
[  2 of 151] Compiling Type.Proxy
[  4 of 151] Compiling Record.Unsafe
[  3 of 151] Compiling Type.Equality
[  5 of 151] Compiling Data.Unit
[  6 of 151] Compiling Data.Void
[  7 of 151] Compiling Data.Traversable.Accum
[  8 of 151] Compiling Data.NaturalTransformation
[  9 of 151] Compiling Partial
... elided ...
[135 of 151] Compiling Data.Array.ST.Partial
[136 of 151] Compiling Data.Array.ST.Iterator
[137 of 151] Compiling Data.Semigroup.Foldable
[138 of 151] Compiling Data.Bifoldable
[139 of 151] Compiling Data.Traversable
[140 of 151] Compiling Data.FoldableWithIndex
[142 of 151] Compiling Data.Semigroup.Traversable
[141 of 151] Compiling Data.Bitraversable
[143 of 151] Compiling Data.Unfoldable1
[144 of 151] Compiling Data.TraversableWithIndex
[145 of 151] Compiling Data.Unfoldable
[147 of 151] Compiling Data.Array.NonEmpty.Internal
[146 of 151] Compiling Data.NonEmpty
[148 of 151] Compiling Data.Array
[149 of 151] Compiling Main
[150 of 151] Compiling Data.Array.Partial
[151 of 151] Compiling Data.Array.NonEmpty
[info] Build succeeded.
Compiling modules:
Wrote linked modules to /home/user/purescript-lua/example/main.lua
```

## How to run compiled script

```sh
lua -e 'dofile("main.lua")'
```
