{ name = "my-project"
, dependencies =
  [ "arrays", "console", "effect", "foldable-traversable", "prelude" ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
, backend =
    ''
    pslua \
    --foreign-path foreign \
    --ps-output output \
    --lua-output-file main.lua \
    --module Main 
    ''
}
